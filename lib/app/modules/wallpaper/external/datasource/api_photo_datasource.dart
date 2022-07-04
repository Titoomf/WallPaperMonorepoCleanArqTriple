import 'package:clean_arq_wallpaper_monorepo/app/modules/shared/constants_api.dart';
import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/entities/photo_entity.dart';
import 'package:dio/dio.dart';

import '../../errors/error.dart';
import '../../infra/datasource/photo_datasource.dart';
import '../../infra/model/photo_entity_model.dart';

class PhotoDataSource implements IPhotoDataSource {
  final Dio dio;

  PhotoDataSource(this.dio);
// Busca as fotos da api
  @override
  Future<List<PhotoEntity>> fetchPhotos(
      {required int page, required int perPage}) async {
    try {
      final response = await dio.get(
        '${ConstantsApiUrls.searchCuratedPhoto}?page=$page&per_page=$perPage',
        options: Options(
          headers: {
            'baseUrl': ConstantsApiUrls.baseUrl,
            'Authorization': ConstantsApiUrls.apiKey,
          },
        ),
      );

      final photolist = (response.data['photos'] as List)
          .map((e) => PhotoEntityModel.fromMap(e))
          .toList();
      return photolist;
    } on DioError catch (e) {
      throw PhotoDataSourceException(e.toString());
    }
  }

// faz a pesquisar na api com o que o usuario digitar(query)
  @override
  Future<List<PhotoEntityModel>> searchPhotos(
      {required int page, required int perPage, String? query}) async {
    try {
      final response = await dio.get(
        '${ConstantsApiUrls.searchPhoto}?query=$query&page=$page&per_page=$perPage',
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
      throw PhotoDataSourceException(e.toString());
    }
  }
}
