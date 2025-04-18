import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import '../models/cat.dart';
import '../providers/cat_provider.dart';
import '../screens/detail_screen.dart';
import '../screens/liked_cats_screen.dart';
import '../widgets/cat_card.dart';
import '../widgets/dislike_button.dart';
import '../widgets/like_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController _cardController = CardSwiperController();
  bool _hasShownOfflineMessage = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CatProvider>(context, listen: false).fetchCats(limit: 5);
    });
  }

  @override
  void dispose() {
    _cardController.dispose();
    super.dispose();
  }

  void _navigateToDetailScreen(Cat cat) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(cat: cat)),
    );
  }

  void _navigateToLikedCats() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LikedCatsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Swiper'),
        actions: [
          Consumer<CatProvider>(
            builder: (context, catProvider, child) {
              return TextButton.icon(
                onPressed: _navigateToLikedCats,
                icon: const Icon(Icons.photo_library, color: Colors.black87),
                label: Text(
                  'Liked Cats: ${catProvider.likedCatsCount}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Montserrat',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<CatProvider>(
          builder: (context, catProvider, child) {
            if (catProvider.isOfflineMode && !_hasShownOfflineMessage) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _hasShownOfflineMessage = true;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('You are in offline mode. Showing cached cats.'),
                    duration: Duration(seconds: 3),
                    backgroundColor: Colors.orange,
                  ),
                );
              });
            }
            
            if (catProvider.isLoading && catProvider.cats.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (catProvider.error != null && catProvider.cats.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Network Error'),
                    content: Text('${catProvider.error}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          catProvider.fetchCats();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              });

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${catProvider.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black87,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => catProvider.fetchCats(),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            }

            if (catProvider.cats.isEmpty) {
              return const Center(child: Text('No cats available'));
            }

            return Column(
              children: [
                if (catProvider.isOfflineMode)
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    color: Colors.orange.withOpacity(0.8),
                    child: Row(
                      children: [
                        const Icon(Icons.wifi_off, color: Colors.white),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Offline mode: Showing cached cats',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh, color: Colors.white),
                          onPressed: () => catProvider.fetchCats(),
                          tooltip: 'Try to reconnect',
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: CardSwiper(
                    controller: _cardController,
                    cardsCount: catProvider.cats.length,
                    onSwipe: (previousIndex, currentIndex, direction) {
                      if (direction == CardSwiperDirection.right) {
                        catProvider.likeCat();
                      } else if (direction == CardSwiperDirection.left) {
                        catProvider.dislikeCat();
                      }
                      return true;
                    },
                    numberOfCardsDisplayed: 1,
                    backCardOffset: const Offset(0, 0),
                    padding: const EdgeInsets.all(24.0),
                    allowedSwipeDirection: const AllowedSwipeDirection.only(
                      left: true,
                      right: true,
                      up: false,
                      down: false,
                    ),
                    cardBuilder: (
                      context,
                      index,
                      percentThresholdX,
                      percentThresholdY,
                    ) {
                      final cat = catProvider.cats[index];
                      return CatCard(
                        cat: cat,
                        onTap: () => _navigateToDetailScreen(cat),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DislikeButton(
                        onPressed: () {
                          _cardController.swipeLeft();
                        },
                      ),
                      LikeButton(
                        onPressed: () {
                          _cardController.swipeRight();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
