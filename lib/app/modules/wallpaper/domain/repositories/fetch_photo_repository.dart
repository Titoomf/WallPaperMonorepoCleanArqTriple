import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/photo_entity.dart';

abstract class FetchPhotoRepository {
  // Buscar as fotos
  Future<Either<FetchPhotoException, List<PhotoEntity>>> fetchPhotos({
    String? query,
    required int page,
    required int perPage,
  });

  // Future<Either<PhotoException, File>> downloadPhoto(
  //     {required String imagePath});
}
