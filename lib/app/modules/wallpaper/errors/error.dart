abstract class FetchPhotoException implements Exception {
  final String message;

  FetchPhotoException(this.message);
}

class PhotoParamsException extends FetchPhotoException {
  PhotoParamsException(
    String message,
  ) : super(message);
}

class PhotoRepositoryException extends FetchPhotoException {
  PhotoRepositoryException(
    String message,
  ) : super(message);
}

class PhotoDatasourceException extends FetchPhotoException {
  PhotoDatasourceException(
    String message,
  ) : super(message);
}
