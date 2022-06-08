import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/entities/photo_entity.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/repositories/fetch_photo_repository.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/usecases/fetch_photo_usecase.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/errors/error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FetchPhotoRepositoryMock extends Mock implements FetchPhotoRepository {}

void main() {
  final repository = FetchPhotoRepositoryMock();
  final usecase = FetchPhotosUsecaseImpl(repository);

  // test('Return right to fetch photo list', () async {
  //   const int page = 1;
  //   const int perPage = 1;

  //   when(() => repository.fetchPhotos(page: page, perPage: perPage))
  //       .thenAnswer((_) async => right(<PhotoEntity>[]));

  //   final result = await usecase(page: page, perPage: perPage);

  //   expect(result.isRight, true);

  // verify(() => repository.fetchPhotos(page: page, perPage: perPage))
  //     .called(1);
  // verifyNoMoreInteractions(repository);
  // });

  test('Return right to fetch photo list', () async {
    const int page = 1;
    const int perPage = 1;

    // when
    when(() => repository.fetchPhotos(page: page, perPage: perPage))
        .thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(page: page, perPage: perPage);

    // expected
    expect(result.isRight, true);

    verify(() => repository.fetchPhotos(page: page, perPage: perPage))
        .called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Return right to fetch photo list by search', () async {
    const int page = 1;
    const int perPage = 1;
    const String query = 'any';
    // when
    when(() =>
            repository.fetchPhotos(query: query, page: page, perPage: perPage))
        .thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(query: query, page: page, perPage: perPage);

    // expected
    expect(result.isRight, true);

    verify(() =>
            repository.fetchPhotos(query: query, page: page, perPage: perPage))
        .called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Return PhotoParamsException caused by empty search', () async {
    const int page = 1;
    const int perPage = 1;
    const String query = '';
    // when

    // do
    final result = await usecase(query: query, page: page, perPage: perPage);

    final expectedValue = result.fold((l) => l, (r) => r);

    // expected
    expect(expectedValue, isA<PhotoParamsException>());
    verifyNever(() =>
        repository.fetchPhotos(query: query, page: page, perPage: perPage));
    verifyNoMoreInteractions(repository);
  });

  test('Return PhotoParamsException caused by wrong range of Page', () async {
    const int page = 0;
    const int perPage = 1;

    // when
    when(() => repository.fetchPhotos(page: page, perPage: perPage))
        .thenAnswer((_) async => right(<PhotoEntity>[]));

    // do
    final result = await usecase(page: page, perPage: perPage);

    final expectedValue = result.fold((l) => l, (r) => r);

    // expected
    expect(expectedValue, isA<PhotoParamsException>());
    verifyNever(() => repository.fetchPhotos(page: page, perPage: perPage));
    verifyNoMoreInteractions(repository);
  });
}
