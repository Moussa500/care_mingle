import 'package:care_mingle/features/auth/domain/entities/user_entity.dart';

abstract class UserModel extends UserEntity {
  UserModel(
      {required super.name,
      required super.email,
      required super.phone,
      required super.address,
      required super.password,
      required super.status,
      required super.profilePic,
      required super.role});
}

class BabySitterModel extends UserModel {
  final List<int>? availability;
  final double? rating;
  final double? price;
  final String? bio;
  final String? cv;
  BabySitterModel(
      {this.availability,
      this.rating,
      this.price,
      this.bio,
      this.cv,
      required super.name,
      required super.email,
      required super.phone,
      required super.address,
      required super.password,
      required super.status,
      required super.profilePic,
      required super.role});
  factory BabySitterModel.fromJson(Map<String, dynamic> json) {
    return BabySitterModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        password: json["password"],
        profilePic: json["profilePic"],
        role: json["role"],
        availability: json["availability"],
        price: json["price"],
        bio: json["bio"],
        cv: json["cv"],
        status: json["status"],
        rating: json["rating"]);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      "role": role,
      "profilePic": profilePic,
      "availability": availability,
      "price": price,
      "bio": bio,
      "cv": cv,
      "status": status,
      "rating": rating
    };
  }
}

class ParentModel extends UserModel {
  List<Map<String, dynamic>>? children;
  ParentModel(
      {this.children,
      required super.name,
      required super.email,
      required super.phone,
      required super.address,
      required super.password,
      required super.status,
      required super.profilePic,
      required super.role});
  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      password: json["password"],
      profilePic: json["profilePic"],
      role: json["role"],
      children: json["children"],
      status: json["status"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      "role": role,
      "profilePic": profilePic,
      "children": children,
      "status": status,
    };
  }
}

extension BabySitterModelX on BabySitterModel {
  BabySitterEntity toEntity() {
    return BabySitterEntity(
      name: name,
      email: email,
      phone: phone,
      address: address,
      password: password,
      status: status,
      profilePic: profilePic,
      role: role,
      availability: availability,
      bio: bio,
      cv: cv,
    );
  }
}

extension ParentModelX on ParentModel {
  ParentEntity toEntity() {
    return ParentEntity(
        name: name,
        email: email,
        phone: phone,
        address: address,
        password: password,
        status: status,
        profilePic: profilePic,
        role: role,
        children: children);
  }
}
