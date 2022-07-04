import 'package:dartz/dartz.dart';

import '../../domain/entities/photo_entity.dart';
import '../../domain/repositories/photo_repository.dart';
import '../../errors/error.dart';
import '../datasource/photo_datasource.dart';

class PhotoRepository implements IPhotoRepository {
  final IPhotoDataSource photoDataSource;

  PhotoRepository(this.photoDataSource);

  @override
  Future<Either<PhotoException, List<PhotoEntity>>> fetchPhotos(
      {String? query, required int page, required int perPage}) async {
    try {
      List<PhotoEntity> result;

      if (query != null) {
        result = await photoDataSource.searchPhotos(
            query: query, page: page, perPage: perPage);
      } else {
        result =
            await photoDataSource.fetchPhotos(perPage: perPage, page: page);
      }
      return right(result);
    } on PhotoDataSourceException catch (e) {
      return left(PhotoException(e.toString()));
    }
  }
}
