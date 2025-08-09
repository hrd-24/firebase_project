class UserTestModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String gender;

  UserTestModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
    };
  }

  factory UserTestModel.fromMap(Map<String, dynamic> map) {
    return UserTestModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      gender: map['gender'] ?? '',
    );
  }
}
