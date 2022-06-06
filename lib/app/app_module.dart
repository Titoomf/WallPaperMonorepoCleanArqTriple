import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
      ];

  // @override
  // List<ModularRoute> get routes => [
  //       ModuleRoute(Modular.initialRoute, module: ),
  //     ];
}
