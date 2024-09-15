import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mylearning/main.dart';
import 'package:mylearning/network/failures/failures.dart';
import 'package:mylearning/network/network_checker.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final InternetConnection internetConnection = getIt<InternetConnection>();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<Either<Failure, Unit>> logout() async {
    if (await internetConnection.isConnected == false) {
      return const Left(Failure.socketFailure());
    }
    try {
      await _firebaseAuth.signOut();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.authFailure(code: "$e"));
    }
  }

  Future<Either<Failure, Unit>> loginUser(String email, String password) async {
    if (await internetConnection.isConnected == false) {
      return const Left(Failure.socketFailure());
    }
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.authFailure(code: "$e"));
    }
  }

  Future<Either<Failure, Unit>> forgotPassword(String email) async {
    if (await internetConnection.isConnected == false) {
      return const Left(Failure.socketFailure());
    }
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.authFailure(code: "$e"));
    }
  }

  //I think the reason why it doesnt log in is because it is not signing the user in through the auth repo
  Future<User?> signInWithCredential(AuthCredential credential) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('Error signing in: $e');
      return null;
    }
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}
