// import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/errors/error.dart';
// import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/presenters/store/search_store.dart';
// import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/presenters/store/states/search_states_page.dart';
// import 'package:flutter_triple/flutter_triple.dart';
// import 'package:triple_test/triple_test.dart';

// class SearchPhotosStoreMock extends MockStore<PhotoException, SearchPhotosState>
//     implements SearchPhotosStore {}

// void main() {
//   final mock = SearchPhotosStoreMock();

//   whenObserve(
//     mock,
//     input: () => mock.getNextPage('nature'),
//     initialState: 0,
//     triples: [
//       Triple(
//         state: 1,
//       )
//     ],
//   );

//   storeTest<SearchPhotosStoreMock>('deve me retorna o numero de pagina',
//       build: () => SearchPhotosStoreMock(),
//       act: (store) => store.getNextPage,
//       expect: () => [0, 1]);
// }
