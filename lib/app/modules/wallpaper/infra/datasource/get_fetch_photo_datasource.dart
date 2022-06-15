import '../../domain/entities/photo_entity.dart';

abstract class FetchPhotoDatasource {
  Future<List<PhotoEntity>> fetchPhotos(
      {required int page, required int perPage});
}
