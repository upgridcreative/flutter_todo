class AuthenticationModel {
  final String accessToken;
  final String refreshToken;
  final String firstName;
  final String? lastName;

  AuthenticationModel({
    required this.accessToken,
    required this.refreshToken,
    required this.firstName,
    this.lastName,
  });

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        accessToken: json['tokens']['access'],
        refreshToken: json['tokens']['refresh'],
        firstName: json['details']['first_name'],
        lastName: json['details']['last_name'],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "firstName": firstName,
        "lastName": lastName,
      };
}
