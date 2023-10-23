import '../../domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({
    required name,
    required id,
    required email,
    required password,
  }) : super(email: email, id: id, name: name, password: password);


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        password: json["password"]);
  }
}
