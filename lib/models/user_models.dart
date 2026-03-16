class UserModels {
  var name;
  var email;
  var phoneNumber;
  var message;
  var statusCode;

  UserModels({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.message,
    required this.statusCode,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) {
    final user = json["user"];
    return UserModels(
      name: user != null && user is Map
          ? user["name"] ?? "no data"
          : json["name"] ?? "no data",
      email: user != null && user is Map
          ? user["email"] ?? "no data"
          : json["email"] ?? "no data",
      phoneNumber: user != null && user is Map
          ? user["phoneNumber"] ?? "no data"
          : json["phoneNumber"] ?? "no data",
      message: json["message"] ?? "no data",
      statusCode: json["statusCode"] ?? "no data",
    );
  }
}
