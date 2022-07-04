import '../../../domain/entities/photo_entity.dart';

// abstract class SearchPhotosState {}

class FetchPhotosState {
  final int page;
  final int perPage;
  final String query;
  final List<PhotoEntity> photos;

  FetchPhotosState({
    required this.photos,
    required this.page,
    required this.perPage,
    required this.query,
  });

  FetchPhotosState.empty({
    this.page = 0,
    this.perPage = 5,
    this.query = 'Nature',
    this.photos = const [],
  });

  FetchPhotosState copyWith({
    int? page,
    int? perPage,
    String? query,
    List<PhotoEntity>? photos,
  }) {
    return FetchPhotosState(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      photos: photos ?? this.photos,
      query: query ?? this.query,
    );
  }
}
