import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quotes_clean/domain/entities/author_entity.dart';
import 'package:quotes_clean/domain/entities/user_collection_entity.dart';

import '../../core/success/success.dart';
import '../entities/quote_entity.dart';

abstract class QuoteRepository {
  // gets all quotes for main screen
  Future<Either<FirebaseException, Quote>> getAllQuotes(int userId);
  //gets all quotes for author drawer
  Future<Either<FirebaseException, AuthorCollection>> getAuthorQuotes(
      int userId);
  //gets all custom user collection
  Future<Either<FirebaseException, UserCollection>> getUserCollections(
      int userId);

  Future<Either<FirebaseException, Success>> createQuote(int userId);

  Future<Either<FirebaseException, Success>> editQuote(int userId);

  Future<Either<FirebaseException, Success>> deleteQuote(int userId);
}
