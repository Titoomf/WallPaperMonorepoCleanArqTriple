import 'package:dartz/dartz.dart';

import '../../domain/repositories/download_photo_repository.dart';
import '../../errors/error.dart';
import '../datasource/download_api_photo_datasource.dart';

class DownloadPhotosRepository implements IDownloadPhotoRepository {
  final IDownloadDataSource dataSource;

  DownloadPhotosRepository(this.dataSource);

  @override
  Future<Either<PhotoException, String>> downloadPhoto(
      {required String imagePath}) async {
    try {
      final result = await dataSource.download(imagePath);

      return right('result');
    } catch (e) {
      return left(PhotoException(e.toString()));
    }
  }
}
