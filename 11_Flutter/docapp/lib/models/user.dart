class AppUser {
  final String id;
  final String email;
  final String name;
  final String phone;
  final String? profileImageUrl;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? address;
  final String role;

  AppUser({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    this.profileImageUrl,
    this.dateOfBirth,
    this.gender,
    this.address,
    this.role='user',
  }) {
    if (email.isEmpty || !email.contains('@')) {
      throw ArgumentError('Invalid email');
    }
    if (name.isEmpty) {
      throw ArgumentError('Name cannot be empty');
    }
    if (phone.isEmpty) {
      throw ArgumentError('Phone cannot be empty');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'address': address,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      profileImageUrl: map['profileImageUrl'],
      dateOfBirth:
          map['dateOfBirth'] != null
              ? DateTime.parse(map['dateOfBirth'])
              : null,
      gender: map['gender'],
      address: map['address'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppUser &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.phone == phone &&
        other.profileImageUrl == profileImageUrl &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        profileImageUrl.hashCode ^
        dateOfBirth.hashCode ^
        gender.hashCode ^
        address.hashCode;
  }
}
