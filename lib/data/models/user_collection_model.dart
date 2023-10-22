import '../../domain/entities/user_collection__entity.dart';

class UserCollectionModel extends UserCollection {
  UserCollectionModel({
    required collectionName,
    required id,
    required quoteList,
  }) : super(collectionName: collectionName, id: id, quoteList: quoteList);

  factory UserCollectionModel.fromJson(Map<String, dynamic> json) {
    return UserCollectionModel(
        collectionName: json["collectionName"],
        id: json["id"],
        quoteList: json["quoteList"]);
  }
}
