class LoginResponse {
  bool success;
  LoginData data;

  LoginResponse({
    required this.data,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: LoginData.fromJson(json['data']),
        success: json['success'],
      );
}

class LoginData {
  User user;
  String token;

  LoginData({
    required this.user,
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        user: User.fromJson(json['user']),
        token: json['token'],
      );
}

class User {
  int id;
  String name;
  String email;
  String createdAt;
  String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']);
}
