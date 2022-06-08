import '../../domain/entities/photo_entity.dart';

abstract class SeachPhotoDatasource {
  Future<List<PhotoEntity>> searchPhotos(
      {required String query, required int apiPage, required int perPage});
}
