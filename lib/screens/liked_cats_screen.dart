import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/cat.dart';
import '../providers/cat_provider.dart';
import '../widgets/cat_card.dart';
import 'detail_screen.dart';

class LikedCatsScreen extends StatelessWidget {
  const LikedCatsScreen({super.key});

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
                    items.add(PopupMenuItem<String?>(
                      value: breed,
                      child: Text(breed),
                    ));
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
          
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: likedCats.length,
            itemBuilder: (context, index) {
              final Cat cat = likedCats[index];
              final String breedName = cat.breeds.isNotEmpty 
                  ? cat.breeds.first.name 
                  : 'Unknown Breed';
              final String likedDate = cat.likedAt != null
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
                            child: CatCard(
                              cat: cat,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(cat: cat),
                                  ),
                                );
                              },
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
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Remove Cat'),
                                      content: const Text(
                                        'Are you sure you want to remove this cat from your liked cats?'
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
          );
        },
      ),
    );
  }
}
