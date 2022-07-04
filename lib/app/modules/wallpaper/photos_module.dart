import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/repositories/photo_repository.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/infra/datasource/photo_datasource.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/infra/repositories/i_search_photo_repository.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/presenters/pages/list_home_page_photo_page.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/presenters/store/search_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/download_photo_repository.dart';
import 'domain/usecases/get_download_photo_usecase.dart';
import 'domain/usecases/get_fetch_photo_usecase.dart';
import 'external/datasource/api_photo_datasource.dart';
import 'external/datasource/download_datasource.dart';
import 'infra/datasource/download_api_photo_datasource.dart';
import 'infra/repositories/i_download_photo_repository.dart';

class PhotosModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //usecases
        Bind.singleton((i) => GetDownloadPhotoUsecase(i())),
        Bind.singleton((i) => GetFetchPhotosUsecase(i())),

        //repository
        Bind.singleton<IDownloadPhotoRepository>(
            (i) => DownloadPhotosRepository(i())),
        Bind.singleton<IPhotoRepository>((i) => PhotoRepository(i())),

        // datasource
        Bind.singleton<IPhotoDataSource>((i) => PhotoDataSource(i())),
        Bind.singleton<IDownloadDataSource>((i) => DownloadDataSource(i())),

        //store
        Bind.singleton((i) => FetchPhotosStore(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HomePageListPhotosPage()),
      ];
}
