import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quotes_clean/domain/entities/user_collection_entity.dart';
import 'package:quotes_clean/domain/repositories/quote_repository.dart';

class GetUserCollection {
  final QuoteRepository quoteRepository;
  GetUserCollection({required this.quoteRepository});

  Future<Either<FirebaseException, List<UserCollection>>> getUserCollections(
      String userId) async {
    return await quoteRepository.getUserCollections(userId);
  }
}
