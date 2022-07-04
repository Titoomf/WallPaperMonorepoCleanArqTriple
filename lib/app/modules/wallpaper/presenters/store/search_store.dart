import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/usecases/get_fetch_photo_usecase.dart';
import '../../errors/error.dart';
import 'states/search_states_page.dart';

class FetchPhotosStore extends NotifierStore<PhotoException, FetchPhotosState> {
  final IGetFetchPhotosUsecase _fetchPhotousecase;

  FetchPhotosStore(this._fetchPhotousecase) : super(FetchPhotosState.empty());

  void fetchPhotos() async {
    setLoading(true);

    _sumPageValue();

    final usecaseResponse = await _fetchPhotousecase(
      page: state.page,
      perPage: state.perPage,
      query: state.query,
    );
    usecaseResponse.fold((l) {
      _subPageValue();
      setError(l);
    }, (r) => update(state.copyWith(photos: r, perPage: 1)));
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
}
