import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../errors/error.dart';

abstract class IDownloadPhotoRepository {
  Future<Either<PhotoException, File>> downloadPhoto(
      {required String imagePath});
}
