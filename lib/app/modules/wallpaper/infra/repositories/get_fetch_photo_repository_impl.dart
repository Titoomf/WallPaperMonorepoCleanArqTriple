import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/entities/photo_entity.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/errors/error.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/infra/datasource/get_fetch_photo_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/get_fetch_photo_repository.dart';

class GetFetchPhotosRepositoryImpl implements FetchPhotoRepository {
  final FetchPhotoDatasource dataSource;

  GetFetchPhotosRepositoryImpl(this.dataSource);

  @override
  Future<Either<FetchPhotoException, List<PhotoEntity>>> fetchPhotos(
      {required int page, required int perPage}) async {
    try {
      List<PhotoEntity> fetchPhotoList =
          await dataSource.fetchPhotos(page: page, perPage: perPage);
      return right(fetchPhotoList);
    } on PhotoException {
      return left(PhotoException(toString()));
    }
  }
}
