class Destination {
  final int id;
  final String name;
  final String category;
  final String location;
  final String imageUrl;
  final double rating;
  final String description;

  Destination({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
    );
  }
}
