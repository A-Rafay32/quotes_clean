import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quotes_clean/domain/entities/author_entity.dart';
import 'package:quotes_clean/domain/repositories/quote_repository.dart';

class GetAuthorCollection {
  final QuoteRepository quoteRepository;
  GetAuthorCollection({required this.quoteRepository});

  Future<Either<FirebaseException, List<AuthorCollection>>>
      getAuthorCollections(String userId) async {
    return await quoteRepository.getAuthorCollection(userId);
  }
}
