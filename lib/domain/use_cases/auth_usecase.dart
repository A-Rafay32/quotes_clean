import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotes_clean/domain/repositories/auth_repository.dart';

import '../../core/success/success.dart';

class AuthUseCases {
  final AuthRepository authRepository;

  AuthUseCases({required this.authRepository});

  Future<Either<FirebaseAuthException, User>> signIn(
      {required String email, required String password}) async {
    return await authRepository.signIn(email: email, password: password);
  }

  Future<Either<FirebaseAuthException, User>> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    return await authRepository.signUp(
        email: email, password: password, userName: userName);
  }

  Future<Either<FirebaseAuthException, User>> signOut() async {
    return await authRepository.signOut();
  }

  Future<Either<FirebaseAuthException, User>> signUpWithEmail(
      {required String email}) async {
    return await authRepository.signUpWithEmail(
      email: email,
    );
  }

  Future<Either<FirebaseAuthException, User>> signUpwithGoogle(
      {required String email}) async {
    return await authRepository.signUpWithGoogle();
  }

  Future<Either<FirebaseAuthException, Success>> forgotPassword({
    required String email,
    required String newPassword,
  }) async {
    return await authRepository.forgotPassword(
        email: email, newPassword: newPassword);
  }

  Future<Either<FirebaseAuthException, Success>> updateEmail({
    required String newEmail,
    required String oldEmail,
  }) async {
    return await authRepository.updateEmail(
        oldEmail: oldEmail, newEmail: newEmail);
  }

  Future<Either<FirebaseAuthException, Success>> updatePassword({
    required String email,
    required String newPassword,
    required String oldPassword,
  }) async {
    return await authRepository.updatePassword(
        email: email, oldPassword: oldPassword, newPassword: newPassword);
  }

  Future<Either<FirebaseAuthException, Success>> updateUserName({
    required String password,
    required String newUserName,
    required String oldPassword,
  }) async {
    return await authRepository.updateUserName(
      password: password,
      newUserName: newUserName,
    );
  }
}
