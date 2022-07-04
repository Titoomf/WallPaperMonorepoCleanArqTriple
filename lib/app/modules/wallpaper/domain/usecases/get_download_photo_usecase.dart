import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../shared/url_validator.dart';
import '../../errors/error.dart';
import '../repositories/download_photo_repository.dart';

abstract class IGetDownloadPhotoUsecase {
  Future<Either<PhotoException, File>> call({required String imagePath});
}

class GetDownloadPhotoUsecase implements IGetDownloadPhotoUsecase {
  final IDownloadPhotoRepository _repository;

  GetDownloadPhotoUsecase(this._repository);

  @override
  Future<Either<PhotoException, File>> call({required String imagePath}) async {
    if (imagePath.trim().isEmpty || UrlValidatorDownload.isValid(imagePath)) {
      return left(PhotoException('Caminho inválido'));
    }

    return await _repository.downloadPhoto(imagePath: imagePath);
  }
}
