import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/photo_entity.dart';
import '../repositories/fetch_photo_repository.dart';

abstract class FetchPhotosUsecase {
  Future<Either<FetchPhotoException, List<PhotoEntity>>> call({
    String? query,
    required int page,
    required int perPage,
  });
}

class FetchPhotosUsecaseImpl implements FetchPhotosUsecase {
  final FetchPhotoRepository _repository;

  FetchPhotosUsecaseImpl(this._repository);

  @override
  Future<Either<FetchPhotoException, List<PhotoEntity>>> call({
    String? query,
    required int page,
    required int perPage,
  }) async {
    if (page < 1 || perPage < 1) {
      return left(PhotoParamsException('Parâmetros não encontrado'));
    }

    if (query != null && query.trim().isEmpty) {
      return left(PhotoParamsException('Favor preencher a pesquisa'));
    }
    return await _repository.fetchPhotos(
      query: query,
      page: page,
      perPage: perPage,
    );
  }
}
