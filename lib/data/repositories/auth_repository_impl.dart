import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotes_clean/data/data_sources/remote/auth.dart';
import 'package:quotes_clean/domain/repositories/auth_repository.dart';

import '../../core/exceptions/exceptions.dart';
import '../../core/success/success.dart';

class AuthRepositoryImpl implements AuthRepository {
  FirebaseAuthSource firebaseAuthSource;

  AuthRepositoryImpl({required this.firebaseAuthSource});

  @override
  Future<Either<Failure, UserCredential>> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    return await firebaseAuthSource.signUp(
        email: email, password: password, userName: userName);
  }

  @override
  Future<Either<Failure, UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    return await firebaseAuthSource.signIn(email: email, password: password);
  }

  @override
  Future<Either<Failure, Success>> signOut() async {
    return await firebaseAuthSource.signOut();
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithEmail(
      {required String email}) async {
    return await firebaseAuthSource.signUpWithEmail(email: email);
  }

  @override
  Future<Either<Failure, UserCredential>> signUpWithGoogle() async {
    return await firebaseAuthSource.signUpWithGoogle();
  }

  @override
  Future<Either<Failure, Success>> updateEmail(
      {required String oldEmail, required String newEmail}) async {
    return await firebaseAuthSource.updateEmail(
        oldEmail: oldEmail, newEmail: newEmail);
  }

  @override
  Future<Either<Failure, Success>> updatePassword(
      {required String email,
      required String oldPassword,
      required String newPassword}) async {
    return await firebaseAuthSource.updatePassword(
        email: email, oldPassword: oldPassword, newPassword: newPassword);
  }

  @override
  Future<Either<Failure, Success>> updateUserName(
      {required String newUserName, required String password}) async {
    return await firebaseAuthSource.updateUserName(
        newUserName: newUserName, password: password);
  }

  @override
  Future<Either<Failure, Success>> forgotPassword(
      {required String email, required String newPassword}) async {
    return await firebaseAuthSource.forgotPassword(
      email: email,
      newPassword: newPassword,
    );
  }
}
