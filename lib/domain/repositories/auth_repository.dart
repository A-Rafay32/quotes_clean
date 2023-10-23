import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotes_clean/core/success/success.dart';

abstract class AuthRepository {
  Future<Either<FirebaseAuthException, User>> signUp(
      {required String email,
      required String password,
      required String userName});
  Future<Either<FirebaseAuthException, User>> signIn({
    required String email,
    required String password,
  });
  Future<Either<FirebaseAuthException, User>> signOut();
  Future<Either<FirebaseAuthException, User>> signUpWithEmail(
      {required String email});
  Future<Either<FirebaseAuthException, User>> signUpWithGoogle();

  Future<Either<FirebaseAuthException, Success>> updateEmail(
      {required String oldEmail , required String newEmail});
  Future<Either<FirebaseAuthException, Success>> updatePassword(
      {required String email,
      required String oldPassword,
      required String newPassword});
  Future<Either<FirebaseAuthException, Success>> updateUserName(
      {required String newUserName, required String password});

  Future<Either<FirebaseAuthException, Success>> forgotPassword(
      {required String email, required String newPassword});
}
