import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:training/core/failure/failure.dart';
import 'package:training/core/services/auth_service.dart';
import 'package:training/core/services/database_service.dart';
import 'package:training/model/user_model.dart';

class RegisterRepository {
  AuthService authService;
  DatabaseService databaseService;
  RegisterRepository(this.authService, this.databaseService);

  Future<Either<Failure, User?>> signUp(
      String email, String password, String name) async {
    try {
      final user = await authService.auth
          .createUserWithEmailAndPassword(email: email, password: password);

      final collection = databaseService.users;

      final entity = UserModel(name: name, id: user.user!.uid, email: email);

      await collection.doc(user.user!.uid).set(entity.toMap(entity));

      return Right(user.user);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
