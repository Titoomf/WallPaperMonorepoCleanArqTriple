import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/entities/photo_entity.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/external/datasource/get_fetch_api_photo_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ApiFetchPhotoDataSourceMock extends Mock
    implements ApiFetchPhotoDataSource {}

void main() {
  test('deve retorna a lista de PhotoEntity', () async {
    final datasource = ApiFetchPhotoDataSourceMock();

    when(() => datasource.fetchPhotos(page: 1, perPage: 1))
        .thenAnswer((_) async => [PhotoEntity(photoPath: '')]);
    final result = await datasource.fetchPhotos(page: 1, perPage: 1);

    expect(result, isA<List<PhotoEntity>>());
  });
}
