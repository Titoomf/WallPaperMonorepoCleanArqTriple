import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/download_photo_repository.dart';
import '../../errors/error.dart';
import '../datasource/download_api_photo_datasource.dart';

class DownloadPhotosRepository implements IDownloadPhotoRepository {
  final IDownloadDataSource dataSource;

  DownloadPhotosRepository(this.dataSource);

  @override
  Future<Either<PhotoException, File>> downloadPhoto(
      {required String imagePath}) async {
    try {
      final result = await dataSource.downloadPhoto(imagePath);

      return right(result);
    } catch (e) {
      return left(PhotoException(e.toString()));
    }
  }
}
