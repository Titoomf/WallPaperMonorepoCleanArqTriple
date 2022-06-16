// import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/entities/photo_entity.dart';
import 'package:dio/dio.dart';

import '../../../shared/constants_api.dart';
import '../../domain/entities/photo_entity.dart';
import '../../errors/error.dart';
import '../../infra/datasource/get_fetch_photo_datasource.dart';
import '../../infra/model/photo_entity_model.dart';

class ApiFetchPhotoDataSource implements FetchPhotoDatasource {
  final Dio dio;

  ApiFetchPhotoDataSource(this.dio);

  @override
  Future<List<PhotoEntity>> fetchPhotos(
      {required int page, required int perPage}) async {
    try {
      final response = await dio.get(
          '${ConstantsApiUrls.searchCuratedPhoto}?page=$page&per_page=$perPage',
          options:
              Options(headers: {'Authorization': ConstantsApiUrls.apiKey}));

      final photolist = (response.data['photos'] as List)
          .map((e) => PhotoEntityModel.fromMap(e))
          .toList();
      return photolist;
    } on DioError catch (e) {
      throw PhotoDatasourceException(e.toString());
    }
  }
}
