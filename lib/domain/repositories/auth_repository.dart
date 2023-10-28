import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotes_clean/core/exceptions/exceptions.dart';
import 'package:quotes_clean/core/success/success.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> signUp(
      {required String email,
      required String password,
      required String userName});
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, Success>> signOut();
  Future<Either<Failure, UserCredential>> signUpWithEmail(
      {required String email});
  Future<Either<Failure, UserCredential>> signUpWithGoogle();

  Future<Either<Failure, Success>> updateEmail(
      {required String oldEmail, required String newEmail});
  Future<Either<Failure, Success>> updatePassword(
      {required String email,
      required String oldPassword,
      required String newPassword});
  Future<Either<Failure, Success>> updateUserName(
      {required String newUserName, required String password});

  Future<Either<Failure, Success>> forgotPassword(
      {required String email, required String newPassword});
}
