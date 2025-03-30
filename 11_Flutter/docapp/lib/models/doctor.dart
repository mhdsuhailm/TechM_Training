class Doctor {
  String id;
  final String name;
  final String specialty;
  final double rating;
  final String imageUrl;
  final String description;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.imageUrl,
    required this.description,
  });

  factory Doctor.fromMap(Map<String, dynamic> data, String docId) {
    return Doctor(
      id: docId, 
      name: data['name'] ?? 'Unknown',
      specialty: data['specialty'] ?? 'Unknown',
      rating: (data['rating'] as num?)?.toDouble() ?? 0.0,
      imageUrl: data['imageUrl'] ?? 'assets/images/default_doctor.png',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'specialty': specialty,
      'rating': rating,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
}
