import '../../domain/entities/photo_entity.dart';

abstract class IPhotoDataSource {
  Future<List<PhotoEntity>> fetchPhotos({
    required int page,
    required int perPage,
  });
  Future<List<PhotoEntity>> searchPhotos({
    required String query,
    required int page,
    required int perPage,
  });
}
