import '../../domain/entities/photo_entity.dart';

abstract class SeachPhotoDatasource {
  Future<List<PhotoEntity>> searchPhotos(
      {String? query, required int page, required int perPage});
}
