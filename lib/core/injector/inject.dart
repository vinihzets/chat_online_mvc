import 'package:get_it/get_it.dart';
import 'package:training/auth/home_repository.dart';
import 'package:training/auth/login_repository.dart';
import 'package:training/auth/register_repository.dart';
import 'package:training/controller/home_controller.dart';
import 'package:training/controller/login_controller.dart';
import 'package:training/controller/register_controller.dart';
import 'package:training/core/services/auth_service.dart';
import 'package:training/core/services/database_service.dart';
import 'package:training/core/utils/const_routes.dart';

class Injector {
  static build() async {
    GetIt getIt = GetIt.instance;

// --> CORE

    getIt.registerLazySingleton(() => ConstRoutes());
    getIt.registerLazySingleton(() => DatabaseService());
    getIt.registerLazySingleton(() => AuthService());

// --> Repositories

    getIt.registerLazySingleton(() => RegisterRepository(
          getIt(),
          getIt(),
        ));

    getIt.registerLazySingleton(() => LoginRepository(getIt()));

    getIt.registerLazySingleton(() => HomeRepository(getIt(), getIt()));

// --> Controllers
    getIt.registerFactory(() => HomeController(getIt(), getIt()));
    getIt.registerFactory(() => RegisterController(getIt(), getIt()));
    getIt.registerFactory(() => LoginController(getIt(), getIt(), getIt()));
  }
}
