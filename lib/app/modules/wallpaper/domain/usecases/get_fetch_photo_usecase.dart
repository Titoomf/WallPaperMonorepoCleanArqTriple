import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/photo_entity.dart';
import '../repositories/get_fetch_photo_repository.dart';

abstract class FetchPhotosUsecase {
  Future<Either<FetchPhotoException, List<PhotoEntity>>> call({
    required int page,
    required int perPage,
  });
}

class FetchPhotosUsecaseImpl implements FetchPhotosUsecase {
  final FetchPhotoRepository _repository;

  FetchPhotosUsecaseImpl(this._repository);

  @override
  Future<Either<FetchPhotoException, List<PhotoEntity>>> call({
    required int page,
    required int perPage,
  }) async {
    if (page < 1 || perPage < 1) {
      return left(PhotoException('Error!!,photo não encontrada'));
    }

    return await _repository.fetchPhotos(
      page: page,
      perPage: perPage,
    );
  }
}
