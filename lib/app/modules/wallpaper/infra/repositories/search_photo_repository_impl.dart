import 'package:dartz/dartz.dart';

import '../../domain/entities/photo_entity.dart';
import '../../domain/repositories/search_photo_repository.dart';
import '../../errors/error.dart';
import '../datasource/search_photo_datasource.dart';

class SearchPhotoRepositoryimpl implements SearchPhotoRepository {
  final SeachPhotoDatasource dataSource;

  SearchPhotoRepositoryimpl(this.dataSource);

  @override
  Future<Either<PhotoException, List<PhotoEntity>>> searchPhotos(
      {String? query, required int page, required int perPage}) async {
    try {
      List<PhotoEntity> searchPhoto = await dataSource.searchPhotos(
        page: page,
        perPage: perPage,
        query: query,
      );
      return right(searchPhoto);
    } on PhotoException {
      return left(PhotoException(toString()));
    }
  }
}
