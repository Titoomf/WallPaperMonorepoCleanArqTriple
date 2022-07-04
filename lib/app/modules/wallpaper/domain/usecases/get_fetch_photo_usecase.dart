import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/photo_entity.dart';
import '../repositories/photo_repository.dart';

abstract class IGetFetchPhotosUsecase {
  Future<Either<PhotoException, List<PhotoEntity>>> call({
    String? query,
    required int page,
    required int perPage,
  });
}

class GetFetchPhotosUsecase implements IGetFetchPhotosUsecase {
  final IPhotoRepository _repository;

  GetFetchPhotosUsecase(this._repository);

  @override
  Future<Either<PhotoException, List<PhotoEntity>>> call({
    String? query,
    required int page,
    required int perPage,
  }) async {
    if (query != null && query.trim().isEmpty) {
      return left(PhotoException('Favor preencher a pesquisa'));
    }
    if (page < 1 || perPage < 1) {
      return left(PhotoException('Error!!,photo não encontrada'));
    }

    return await _repository.fetchPhotos(
      query: query,
      page: page,
      perPage: perPage,
    );
  }
}
