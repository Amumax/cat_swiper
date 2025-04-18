import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/cat.dart';
import '../providers/cat_provider.dart';
import '../widgets/cat_card.dart';
import 'detail_screen.dart';

class LikedCatsScreen extends StatefulWidget {
  const LikedCatsScreen({super.key});

  @override
  State<LikedCatsScreen> createState() => _LikedCatsScreenState();
}

class _LikedCatsScreenState extends State<LikedCatsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CatProvider>(context, listen: false).refreshLikedCats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Cats'),
        actions: [
          Consumer<CatProvider>(
            builder: (context, catProvider, _) {
              return PopupMenuButton<String?>(
                icon: const Icon(Icons.filter_list),
                tooltip: 'Filter by breed',
                onSelected: (String? value) {
                  catProvider.filterByBreed(value == 'All' ? null : value);
                },
                itemBuilder: (BuildContext context) {
                  final List<PopupMenuItem<String?>> items = [
                    const PopupMenuItem<String?>(
                      value: 'All',
                      child: Text('All Breeds'),
                    ),
                  ];

                  for (final breed in catProvider.availableBreeds) {
                    items.add(
                      PopupMenuItem<String?>(value: breed, child: Text(breed)),
                    );
                  }

                  return items;
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<CatProvider>(
        builder: (context, catProvider, child) {
          if (catProvider.isOfflineMode) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('You are in offline mode. Showing cached cats.'),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.orange,
                ),
              );
            });
          }
          
          final likedCats = catProvider.likedCats;

          if (likedCats.isEmpty && catProvider.selectedBreed != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No cats found for breed: ${catProvider.selectedBreed}',
                    style: const TextStyle(fontFamily: 'Montserrat'),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => catProvider.filterByBreed(null),
                    child: const Text('Show All Cats'),
                  ),
                ],
              ),
            );
          }

          if (likedCats.isEmpty) {
            return const Center(
              child: Text(
                'No liked cats yet',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => catProvider.refreshLikedCats(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: likedCats.length,
              itemBuilder: (context, index) {
                final Cat cat = likedCats[index];
                final String breedName =
                    cat.breeds.isNotEmpty
                        ? cat.breeds.first.name
                        : 'Unknown Breed';
                final String likedDate =
                    cat.likedAt != null
                        ? DateFormat('dd MMM yyyy, HH:mm').format(cat.likedAt!)
                        : 'Unknown date';

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(cat: cat),
                            ),
                          );
                        },
                        child: Hero(
                          tag: 'cat_image_${cat.id}',
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: CachedNetworkImage(
                                imageUrl: cat.url,
                                cacheManager: CatCard.customCacheManager,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) => const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        breedName,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Liked on: $likedDate',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Remove Cat'),
                                        content: const Text(
                                          'Are you sure you want to remove this cat from your liked cats?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              catProvider.removeLikedCat(cat.id);
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Remove'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
