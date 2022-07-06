import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/domain/usecases/get_download_photo_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/usecases/get_fetch_photo_usecase.dart';
import '../../errors/error.dart';
import 'states/search_states_page.dart';

class FetchPhotosStore extends NotifierStore<PhotoException, FetchPhotosState> {
  final IGetFetchPhotosUsecase _fetchPhotousecase;
  final IGetDownloadPhotoUsecase downloadPhotoUsecase;

  FetchPhotosStore(this._fetchPhotousecase, this.downloadPhotoUsecase)
      : super(FetchPhotosState.empty());

  Future<void> fetchPhotos() async {
    setLoading(true);
    _sumPageValue();

    final usecaseResponse = await _fetchPhotousecase(
      page: state.page,
      perPage: state.perPage,
      query: state.query,
    );
    usecaseResponse.fold(
      (l) {
        setError(l);
        _subPageValue();
      },
      (r) => update(
        state.copyWith(photos: r, perPage: 1),
      ),
    );
    setLoading(false);
  }

  void _subPageValue() {
    final actualPage = state.page;
    final previousPage = actualPage - 1;
    update(state.copyWith(page: previousPage));
  }

  void _sumPageValue() {
    final actualPage = state.page;
    final nextPage = actualPage + 1;
    update(state.copyWith(page: nextPage));
  }

  void updateQuery(String query) {
    update(state.copyWith(query: query, page: 1));
  }

  // Future<void> downlodImageApi() async {
  //   final usecaseReponse = await downloadUsecase(imagePath: imagePath(
  //  imagePath:imagePath)

  //   downloadUsecase.fold(
  //     (l) =>
  //       ),
  //     ),
  //     (r) =>
  //   );
  // }
  // void sumPerpage(int perPage) {
  //   final actualPerpage = state.perPage;
  //   final nextPerpage = actualPerpage + 1;
  //   update(state.copyWith(perPage: perPage));
  // }

// arrow function
  // void incrementPage() => _page.value++;
  // void setPerPage(int value) => perPage.value = value;

  // void resetPage() => _page.value = 1;

  // void setQuery(query) => query.value = query;

  // void resetQuery() => _query.value = null;
// }
}
