import 'package:care_mingle/core/base/base_model.dart';
import 'package:care_mingle/features/auth/domain/entities/user_entity.dart';

class BabySitterModel extends BaseModel<BabySitterModel> {
  final List<int>? availability;
  final double? rating;
  final double? price;
  final String? bio;
  final String? cv;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? password;
  final String? status;
  final String? profilePic;
  final String? role;
  BabySitterModel(
      {this.availability,
      this.rating,
      this.price,
      this.bio,
      this.cv,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.password,
      this.status,
      this.profilePic,
      this.role});
  @override
  fromJson(Map<String, dynamic> json) {
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

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
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

  @override
  List<Object?> get props => [
        name,
        email,
        address,
        role,
        profilePic,
        availability,
        price,
        bio,
        cv,
        status,
        rating,
      ];
}

class ParentModel extends BaseModel<ParentModel> {
  List<Map<String, dynamic>>? children;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? password;
  final String? status;
  final String? profilePic;
  final String? role;
  ParentModel(
      {this.children,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.password,
      this.status,
      this.profilePic,
      this.role});
      @override
  fromJson(Map<String, dynamic> json) {
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
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'phone': phone,
      'address': address,
      "role": role,
      "profilePic": profilePic,
      "children": children,
      "status": status,
    };
  }
  
  @override
  List<Object?> get props =>[name,password,email,phone,address,role,profilePic,children,status];
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
