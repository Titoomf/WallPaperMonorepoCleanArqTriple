import 'dart:io';

import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/repositories/download_photo_repository.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/usecases/get_download_photo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetDownloadPhotoRepositoryMock extends Mock
    implements IDownloadPhotoRepository {}

void main() {
  final repository = GetDownloadPhotoRepositoryMock();
  final usecase = GetDownloadPhotoUsecase(repository);

  test('Should return right to photo download ', () async {
    const String imagePath =
        'https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg';

    // when
    when(() => repository.downloadPhoto(imagePath: imagePath))
        .thenAnswer((_) async => right(
              File(''),
            ));

    // do
    final result = await usecase(imagePath: imagePath);
    final isResultRight = result.isRight();

    // expect
    expect(isResultRight, true);
    verify(() => repository.downloadPhoto(imagePath: imagePath)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
