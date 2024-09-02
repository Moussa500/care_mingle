abstract class UserEntity {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String password;
  final String status;
  final String profilePic;
  final String role;

  UserEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.password,
    required this.status,
    required this.profilePic,
    required this.role,
  });
}

class BabySitterEntity extends UserEntity {
  final List<int>? availability;
  final double? rating;
  final double? price;
  final String? bio;
  final String? cv;

  BabySitterEntity({
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required super.password,
    required super.status,
    required super.profilePic,
    required super.role,
    this.availability,
    this.rating,
    this.price,
    this.bio,
    this.cv,
  });
}

class ParentEntity extends UserEntity {
  final List<Map<String, dynamic>>? children;
  ParentEntity({
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required super.password,
    required super.status,
    required super.profilePic,
    required super.role,
    this.children,
  });
}
