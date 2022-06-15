import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/entities/photo_entity.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/repositories/fetch_photo_repository.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/usecases/fetch_photo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FetchPhotoRepositoryMock extends Mock implements FetchPhotoRepository {}

void main() {
  final repository = FetchPhotoRepositoryMock();
  final usecase = FetchPhotosUsecaseImpl(repository);
  test('Return right to fetch photo list', () async {
    int page = 1;
    int perPage = 1;

    // when
    when(() => repository.fetchPhotos(page: page, perPage: perPage))
        .thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(page: page, perPage: perPage);
    // print(result.isRight());

    final isResultRight = result.isRight();
    //print(isResultRight);

    // expected
    expect(isResultRight, true);

    verify(() => repository.fetchPhotos(page: page, perPage: perPage))
        .called(1);
    verifyNoMoreInteractions(repository);
  });
}
