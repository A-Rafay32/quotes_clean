import 'package:quotes_clean/domain/entities/author_entity.dart';

class AuthorCollectionModel extends AuthorCollection {
  AuthorCollectionModel({required id, required name, required quotes})
      : super(id: id, name: name, quotes: quotes);

  factory AuthorCollectionModel.fromJson(Map<String, dynamic> json) {
    return AuthorCollectionModel(
        id: json["id"], name: json["name"], quotes: json["quotes"]);
  }


  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "quotes": quotes};
  }
}
