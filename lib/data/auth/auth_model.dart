class AuthModel {
  final int? id;
  final String userID;
  final String password;

  AuthModel({
    this.id,
    required this.userID,
    required this.password,
  });

  // Factory method to create an instance from a JSON response
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      userID: json['userID'],
      password: json['password'],
    );
  }

  // Method to convert the model to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'password': password,
    };
  }
}
