import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import '../models/cat.dart';
import '../providers/cat_provider.dart';
import '../widgets/cat_card.dart';
import '../widgets/like_button.dart';
import '../widgets/dislike_button.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController _cardController = CardSwiperController();

  @override
  void initState() {
    super.initState();
    // Fetch cats when the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CatProvider>(context, listen: false).fetchCats();
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
      MaterialPageRoute(
        builder: (context) => DetailScreen(cat: cat),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Swiper'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<CatProvider>(
        builder: (context, catProvider, child) {
          if (catProvider.isLoading && catProvider.cats.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (catProvider.error != null && catProvider.cats.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${catProvider.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => catProvider.fetchCats(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (catProvider.cats.isEmpty) {
            return const Center(child: Text('No cats available'));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Liked Cats: ${catProvider.likedCatsCount}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                  cardBuilder: (context, index, percentThresholdX, percentThresholdY) {
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
                        _cardController.swipe();
                      },
                    ),
                    LikeButton(
                      onPressed: () {
                        _cardController.swipe();
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
