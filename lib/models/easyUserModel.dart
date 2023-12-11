class easyUserModel {
  String userId;
  String name;
  String email;
  String password;
  String userType;

  easyUserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });

  factory easyUserModel.fromJson(Map<String, dynamic> json) => easyUserModel(
        userId: json['user_id'],
        name: json['name'],
        email: json['email'],
        password: json['password'],
        userType: json['user_type'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'name': name,
        'email': email,
        'password': password,
        'user_type': userType,
      };
}
