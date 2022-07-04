abstract class FetchPhotoException implements Exception {
  final String message;

  FetchPhotoException(this.message);
}

class PhotoException extends FetchPhotoException {
  PhotoException(
    String message,
  ) : super(message);
}

class PhotoRepositoryException extends FetchPhotoException {
  PhotoRepositoryException(
    String message,
  ) : super(message);
}

class PhotoDataSourceException extends FetchPhotoException {
  PhotoDataSourceException(
    String message,
  ) : super(message);
}
