class Cat {
  final String id;
  final String url;
  final List<Breed> breeds;

  Cat({required this.id, required this.url, required this.breeds});

  factory Cat.fromJson(Map<String, dynamic> json) {
    List<Breed> breedsList = [];
    if (json['breeds'] != null) {
      breedsList = List<Breed>.from(
        json['breeds'].map((breed) => Breed.fromJson(breed)),
      );
    }
    return Cat(id: json['id'], url: json['url'], breeds: breedsList);
  }

  static Cat createTestCat() {
    return Cat(
      id: 'test-cat-${DateTime.now().millisecondsSinceEpoch}',
      url: 'https://cdn2.thecatapi.com/images/MTY5NjAwOQ.jpg',
      breeds: [
        Breed(
          id: 'test-breed',
          name: 'Тестовая порода',
          description: 'Это тестовый кот для демонстрации приложения без доступа к интернету.',
          temperament: 'Дружелюбный, игривый, любопытный',
          origin: 'Россия',
          lifeSpan: '12-15',
          adaptability: 5,
          affectionLevel: 5,
          childFriendly: 4,
          dogFriendly: 4,
          energyLevel: 5,
          healthIssues: 1,
          intelligence: 5,
          socialNeeds: 3,
          strangerFriendly: 4,
        )
      ],
    );
  }
}

class Breed {
  final String id;
  final String name;
  final String description;
  final String temperament;
  final String origin;
  final String lifeSpan;
  final int? adaptability;
  final int? affectionLevel;
  final int? childFriendly;
  final int? dogFriendly;
  final int? energyLevel;
  final int? healthIssues;
  final int? intelligence;
  final int? socialNeeds;
  final int? strangerFriendly;

  Breed({
    required this.id,
    required this.name,
    required this.description,
    required this.temperament,
    required this.origin,
    required this.lifeSpan,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.healthIssues,
    this.intelligence,
    this.socialNeeds,
    this.strangerFriendly,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown Breed',
      description: json['description'] ?? 'No description available',
      temperament: json['temperament'] ?? 'Unknown temperament',
      origin: json['origin'] ?? 'Unknown origin',
      lifeSpan: json['life_span'] ?? 'Unknown',
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
    );
  }
}
