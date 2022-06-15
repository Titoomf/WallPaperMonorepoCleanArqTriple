import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/photo_entity.dart';

abstract class SearchPhotoRepository {
  Future<Either<PhotoException, List<PhotoEntity>>> searchPhotos({
    String? query,
    required int page,
    required int perPage,
  });
}
