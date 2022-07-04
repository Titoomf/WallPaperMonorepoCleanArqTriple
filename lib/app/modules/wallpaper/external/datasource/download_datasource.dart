import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_downloader/image_downloader.dart';

import '../../errors/error.dart';
import '../../infra/datasource/download_api_photo_datasource.dart';

class DownloadDataSource implements IDownloadDataSource {
  final Dio dio;

  DownloadDataSource(this.dio);

  @override
  Future<File> downloadPhoto(String url) async {
    try {
      final result = await dio.get(url);

      return result.data;
    } on DioError catch (e) {
      throw PhotoDataSourceException(e.toString());
    }
  }

  Future<Map<String, dynamic>> download(String url) async {
    try {
      String? imageId = await ImageDownloader.downloadImage(url,
          destination: AndroidDestinationType.directoryPictures);

      if (imageId == null) {
        throw PhotoException('Falha ao buscar a photo');
      }

      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);

      Map<String, dynamic> map = {
        'fileName': fileName,
        'path': path,
        'size': size,
        'mimeType': mimeType,
      };

      return map;
    } catch (e) {
      throw PhotoException(e.toString());
    }
  }
}
