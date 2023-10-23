import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';

import '../entities/quote_entity.dart';
import '../repositories/quote_repository.dart';

class GetAllQuotes {
  final QuoteRepository quoteRepository;
  GetAllQuotes({required this.quoteRepository});

  Future<Either<FirebaseException, List<Quote>>> getAllQuotes(
      String userId) async {
    return await quoteRepository.getAllQuotes(userId);
  }
}
