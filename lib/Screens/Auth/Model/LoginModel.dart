

class LoginModel {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? token;
  final String? message;

  LoginModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
    this.message
  });

  LoginModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        username = json['username'] as String?,
        email = json['email'] as String?,
        firstName = json['firstName'] as String?,
        lastName = json['lastName'] as String?,
        gender = json['gender'] as String?,
        image = json['image'] as String?,
        token = json['token'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'username' : username,
    'email' : email,
    'firstName' : firstName,
    'lastName' : lastName,
    'gender' : gender,
    'image' : image,
    'token' : token,
    'message' : message
  };
}