import 'package:clean_arq_wallpaper_monorepo/app/modules/shared/constants_api.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/photo_entity.dart';
import '../../errors/error.dart';
import '../../infra/datasource/search_photo_datasource.dart';
import '../../infra/model/photo_entity_model.dart';

class ApiSearchPhotoDataSource implements SeachPhotoDatasource {
  final Dio dio;

  ApiSearchPhotoDataSource(this.dio);
  @override
  Future<List<PhotoEntity>> searchPhotos(
      {required int page, required int perPage, String? query}) async {
    try {
      final response = await dio.get(
        '${ConstantsApiUrls.searchPhotoBytext}?query=$query&page=$page&per_page=$perPage',
        options: Options(
          headers: {
            'Authorization': ConstantsApiUrls.apiKey,
          },
        ),
      );

      final photolist = (response.data['photos'] as List)
          .map((e) => PhotoEntityModel.fromMap(e))
          .toList();
      return photolist;
    } on DioError catch (e) {
      throw PhotoDatasourceException(e.toString());
    }
  }
}
