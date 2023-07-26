import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/core/failure/failure.dart';
import 'package:training/core/services/auth_service.dart';

class LoginRepository {
  AuthService authService;

  LoginRepository(this.authService);

  Future<Either<Failure, UserCredential>> signIn(
      String email, String password) async {
    try {
      return Right(await authService.auth
          .signInWithEmailAndPassword(email: email, password: password));
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
