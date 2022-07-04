import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/entities/photo_entity.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/repositories/photo_repository.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/usecases/get_fetch_photo_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchPhotoRepositoryMock extends Mock implements IPhotoRepository {}

void main() {
  final repository = SearchPhotoRepositoryMock();
  final usecase = GetFetchPhotosUsecase(repository);
  test('Return right to Search photo list', () async {
    const String query = 'any';
    const int page = 1;
    const int perPage = 1;

    // when
    when(() => repository.fetchPhotos(
          query: query,
          page: page,
          perPage: perPage,
        )).thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(
      query: query,
      page: page,
      perPage: perPage,
    );
    // print(result.isRight());

    final isResultRight = result.isRight();
    //print(isResultRight);

    // expected
    expect(isResultRight, true);

    verify(() => repository.fetchPhotos(
          query: query,
          page: page,
          perPage: perPage,
        )).called(1);
    verifyNoMoreInteractions(repository);
  });
}
