import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../core/success/success.dart';

class FirebaseAuthSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();


  // User currentUser
  Future<Either<Failure, UserCredential>> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      return Right(await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(code: e.code, message: e.message.toString()));
    }
  }

  Future<Either<Failure, UserCredential>> signIn(
      {required String email,
      required String password,
      }) async {
    try {
      return Right(await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(code: e.code, message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> signOut(
      ) async {
    try {
      await firebaseAuth.signOut();
      return Right(Success(code: 200 ,message: "User Signed out"));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(code: e.code, message: e.message.toString()));
    }
  }

  Future<Either<Failure, UserCredential>> signUpWithEmail(
      {required String email,
      
      }) async {
    try {
      await firebaseAuth.sendSignInLinkToEmail(
          actionCodeSettings: ActionCodeSettings(url: email), email: email);

      return Right(
          await firebaseAuth.signInWithEmailLink(emailLink: "", email: email));
    } on FirebaseAuthException catch (e) {
      return Left(Failure(code: e.code, message: e.message.toString()));
    }
  }

  Future<Either<Failure, UserCredential>> signUpWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final credentials = await googleSignInAccount?.authentication;
      if (credentials != null) {
        return Right(await firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: credentials.idToken,
                accessToken: credentials.accessToken)));
      } else {
        return Left(Failure(code: "404", message: "Null Credentials"));
      }
    } on FirebaseAuthException catch (e) {
      return Left(Failure(code: e.code, message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> updateEmail(
      {required String oldEmail, required String newEmail}) async {
    try {
      await firebaseAuth.currentUser?.updateEmail(newEmail);
      return Right(Success(code: 200, message: "Email Updated"));
    } on FirebaseException catch (e) {
      return Left(Failure(code: "404", message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> updatePassword(
      {required String email,
      required String oldPassword,
      required String newPassword}) async {
    try {
      await firebaseAuth.currentUser?.updatePassword(newPassword);
      return Right(Success(code: 200, message: "Password Updated"));
    } on FirebaseException catch (e) {
      return Left(
          Failure(code: e.code.toString(), message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> updateUserName(
      {required String newUserName, required String password}) async {
    try {
      await firebaseAuth.currentUser?.updateDisplayName(newUserName);
      return Right(Success(code: 200, message: "Username Updated"));
    } on FirebaseException catch (e) {
      return Left(
          Failure(code: e.code.toString(), message: e.message.toString()));
    }
  }

  Future<Either<Failure, Success>> forgotPassword(
      {required String email,
      required String newPassword,
      }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      
      firebaseAuth.confirmPasswordReset(
          code: , newPassword: newPassword);
      return Right(Success(code: 200, message: "Username Updated"));
    } on FirebaseException catch (e) {
      return Left(
          Failure(code: e.code.toString(), message: e.message.toString()));
    }
  }
}
