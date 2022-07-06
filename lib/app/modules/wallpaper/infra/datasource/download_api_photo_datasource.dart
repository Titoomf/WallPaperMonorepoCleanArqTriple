abstract class IDownloadDataSource {
  Future<Map<String, dynamic>> download(String url);
}
