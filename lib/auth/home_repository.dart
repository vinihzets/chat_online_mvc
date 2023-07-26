import 'package:dartz/dartz.dart';
import 'package:training/core/failure/failure.dart';
import 'package:training/core/services/auth_service.dart';
import 'package:training/core/services/database_service.dart';

import '../model/message_model.dart';

class HomeRepository {
  AuthService authService;
  DatabaseService databaseService;
  HomeRepository(this.authService, this.databaseService);

  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await authService.auth.signOut());
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, List<MessageModel>>> getMessages() async {
    try {
      final request = await databaseService.chat.get();

      List<MessageModel> listMessages =
          request.docs.map((e) => MessageModel.fromJson(e.data())).toList();

      return Right(listMessages);
    } on Exception catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
