class RegisterModel {
  String firstName;
  String lastName;
  String email;
  String password;
  int privacyPolicy;

  RegisterModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.privacyPolicy,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      password: json['password'],
      privacyPolicy: json['privacy_policy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'privacy_policy': privacyPolicy,
    };
  }
}

class LoginModel {
  String email;
  String password;

  LoginModel({this.email, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

class AuthResponseModel {
  AuthResponseModel({
    this.message,
    this.apiToken,
  });

  String message;
  String apiToken;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        message: json["message"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "api_token": apiToken,
      };
}
