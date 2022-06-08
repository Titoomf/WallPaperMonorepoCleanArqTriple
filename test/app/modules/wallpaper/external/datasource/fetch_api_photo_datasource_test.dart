import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/external/datasource/fetch_api_photo_datasource.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/infra/datasource/fetch_photo_datasource.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/infra/datasource/model/photo_entity_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/fetch_photo_response.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dio;
  late FetchPhotoDatasource dataSource;
  final request = RequestOptions(path: "");

  setUpAll(() {
    dio = DioMock();

    dataSource = ApiFetchPhotoDataSource(dio);
  });

  test('Should return a PhotoEntityModel ', () {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        requestOptions: request,
        statusCode: 200,
        data: apiPixelResponse,
      ),
    );

    final results = dataSource.fetchPhotos(page: 1, perPage: 1);

    expect(results, isA<PhotoEntityModel>());
  });
}
