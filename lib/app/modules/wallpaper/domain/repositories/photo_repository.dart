import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/photo_entity.dart';

abstract class IPhotoRepository {
  // qundo ele pesquisar ele busca as fotos
  Future<Either<PhotoException, List<PhotoEntity>>> fetchPhotos({
    String? query,
    required int page,
    required int perPage,
  });
}
