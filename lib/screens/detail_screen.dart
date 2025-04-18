import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../widgets/cat_card.dart';

class DetailScreen extends StatelessWidget {
  final Cat cat;

  const DetailScreen({super.key, required this.cat});

  Widget _buildRatingBar(String label, int? rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                Icons.star,
                color:
                    (rating != null && index < rating)
                        ? Colors.amber
                        : Colors.grey,
                size: 20,
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final breed = cat.breeds.isNotEmpty ? cat.breeds.first : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(breed?.name ?? 'Unknown Breed'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5F5F5), Color(0xFFFFFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'cat_image_${cat.id}',
                child: CachedNetworkImage(
                  cacheManager: CatCard.customCacheManager,
                  imageUrl: cat.url,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  memCacheWidth: 1200,
                  fadeInDuration: const Duration(milliseconds: 300),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (breed != null) ...[
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  breed.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Origin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  breed.origin,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Temperament',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  breed.temperament,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Life Span',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${breed.lifeSpan} years',
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Characteristics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                _buildRatingBar('Adaptability', breed.adaptability),
                _buildRatingBar('Affection Level', breed.affectionLevel),
                _buildRatingBar('Child Friendly', breed.childFriendly),
                _buildRatingBar('Dog Friendly', breed.dogFriendly),
                _buildRatingBar('Energy Level', breed.energyLevel),
                _buildRatingBar('Health Issues', breed.healthIssues),
                _buildRatingBar('Intelligence', breed.intelligence),
                _buildRatingBar('Social Needs', breed.socialNeeds),
                _buildRatingBar('Stranger Friendly', breed.strangerFriendly),
              ] else
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'No breed information available for this cat.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      color: Colors.black54,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
