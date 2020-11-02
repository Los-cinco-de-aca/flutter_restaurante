class RegistreResponsModel {
  final String token;
  final String id;

  RegistreResponsModel({this.token, this.id});

  factory RegistreResponsModel.fromJson(Map<String, dynamic> json) {
    return RegistreResponsModel(
      token: json['token'] ?? '',
      id: json['id'] ?? '',
    );
  }
}

class RegistreRequestModel {
  String email;
  String password;

  RegistreRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}
