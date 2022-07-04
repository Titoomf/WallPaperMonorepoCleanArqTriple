import 'dart:io';

abstract class IDownloadDataSource {
  Future<File> downloadPhoto(String url);
}
