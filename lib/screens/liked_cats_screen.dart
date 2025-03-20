import 'package:flutter/material.dart';
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
      ),
      body: Consumer<CatProvider>(
        builder: (context, catProvider, child) {
          final likedCats = catProvider.likedCats;
          if (likedCats.isEmpty) {
            return const Center(
              child: Text(
                'No liked cats yet',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: likedCats.length,
            itemBuilder: (context, index) {
              final Cat cat = likedCats[index];
              return CatCard(
                cat: cat,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(cat: cat),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
