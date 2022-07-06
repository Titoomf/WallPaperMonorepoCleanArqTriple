import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/wallpaper/photos_module.dart';
import 'modules/wallpaper/presenters/pages/photo_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Dio()),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: PhotosModule()),
        ChildRoute(
          '/photoPage',
          child: (context, args) => PhotoPage(
            imagePath: args.data,
            // onPressed: () {},
          ),
        ),
      ];
}
