import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../data/models/user_model.dart';

abstract class AuthRepository{
  
  Future<Either<FirebaseAuthException,User>> createUser();
  Future<Either<FirebaseAuthException,User>> signIn();
  Future<Either<FirebaseAuthException,User>> signOut();

}