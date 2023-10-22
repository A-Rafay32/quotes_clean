import '../../domain/entities/quote_entity.dart';

class QuoteModel extends Quote {
  QuoteModel({
    required id,
    required author,
    required quote,
    required isFav,
    required collectionName,
  }) : super(
            author: author,
            collectionName: collectionName,
            id: id,
            isFav: isFav,
            quote: quote);

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
        id: json["id"],
        author: json["author"],
        quote: json["quote"],
        isFav: json["isFav"],
        collectionName: json["collectionName"]);
  }

  Map<String, dynamic> toMap() {
    return {
      ' id': id,
      'collectionName': collectionName,
      'author': author,
      'isFav': isFav,
      'quote': quote,
    };
  }
}

