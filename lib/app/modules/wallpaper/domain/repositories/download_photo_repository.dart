import 'package:dartz/dartz.dart';

import '../../errors/error.dart';

abstract class IDownloadPhotoRepository {
  Future<Either<PhotoException, String>> downloadPhoto(
      {required String imagePath});
}
