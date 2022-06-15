import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/external/datasource/search_api_photo_datasource.dart';
import 'package:mocktail/mocktail.dart';

class ApiSearchPhotoDataSourceMock extends Mock
    implements ApiSearchPhotoDataSource {}

// void main() {
//   test('deve retorna minha pesquisa', () async {
//     final datasource = ApiSearchPhotoDataSourceMock();

//     when(() => datasource.searchPhotos(query: 'nature', page: 1, perPage: 1))
//         .thenAnswer((_) async => [PhotoEntity(photoPath: '')]);
//     final result =
//         await datasource.searchPhotos(query: 'Nature', page: 1, perPage: 1);

//     expect(result, isA<List<PhotoEntity>>());
//   });
// }
