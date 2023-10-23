import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotes_clean/domain/repositories/quote_repository.dart';

import '../../core/success/success.dart';

class QuoteUseCases {
  final QuoteRepository quoteRepository;
  QuoteUseCases({required this.quoteRepository});

  Future<Either<FirebaseException, Success>> createQuote(String userId) async {
    return quoteRepository.createQuote(userId);
  }

  Future<Either<FirebaseException, Success>> editQuote(String userId) async {
    return quoteRepository.editQuote(userId);
  }

  Future<Either<FirebaseException, Success>> deleteQuote(String userId) async {
    return quoteRepository.deleteQuote(userId);
  }
}
