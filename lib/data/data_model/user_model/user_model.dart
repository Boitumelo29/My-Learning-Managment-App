class UserModel {
  final String? id;
  final String username;
  final String email;

  UserModel({ this.id,required this.username, required this.email});

  Map<String, dynamic> toJson() {
    return {'username': username, 'email': email};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }
}
