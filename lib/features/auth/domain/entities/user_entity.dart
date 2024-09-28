abstract class UserEntity {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? password;
  final String? status;
  final String? profilePic;
  final String? role;

  UserEntity({
   this.name,
   this.email,
   this.phone,
   this.address,
   this.password,
   this.status,
   this.profilePic,
   this.role,
  });
}

class BabySitterEntity extends UserEntity {
  final List<int>? availability;
  final double? rating;
  final double? price;
  final String? bio;
  final String? cv;

  BabySitterEntity({
     super.name,
   super.email,
   super.phone,
   super.address,
   super.password,
   super.status,
   super.profilePic,
   super.role,
    this.availability,
    this.rating,
    this.price,
    this.bio,
    this.cv,
  });
}

class ParentEntity extends UserEntity {
  final List<Map<String?, dynamic>>? children;
  ParentEntity({
   super.name,
   super.email,
   super.phone,
   super.address,
   super.password,
   super.status,
   super.profilePic,
   super.role,
    this.children,
  });
}
