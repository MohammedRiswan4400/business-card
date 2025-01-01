class UserModel {
  final String name;
  final String email;
  final String title;

  UserModel({
    required this.name,
    required this.email,
    required this.title,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'email': email,
    };
  }
}
