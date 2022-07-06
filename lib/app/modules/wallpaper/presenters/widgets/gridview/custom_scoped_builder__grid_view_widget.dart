import 'package:clean_arq_wallpaper_monorepo/app/modules/wallpaper/presenters/store/states/search_states_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/photo_entity.dart';
import '../../../errors/error.dart';
import '../../store/search_store.dart';
import '../smallphoto/custom_small_photo_widget.dart';

class CustomGridViewScopedBuilderWidget extends StatefulWidget {
  const CustomGridViewScopedBuilderWidget({Key? key}) : super(key: key);

  @override
  State<CustomGridViewScopedBuilderWidget> createState() =>
      _CustomGridViewScopedBuilderWidgetState();
}

class _CustomGridViewScopedBuilderWidgetState
    extends State<CustomGridViewScopedBuilderWidget> {
  final photosStore = Modular.get<FetchPhotosStore>();

  late ScrollController scrollController = ScrollController();
  List<PhotoEntity> photos = [];

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(
      () {
        if (scrollController.offset >=
            scrollController.position.maxScrollExtent - 80) {
          photosStore.fetchPhotos();
        }
      },
    );

    photosStore.fetchPhotos();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<FetchPhotosStore, PhotoException, FetchPhotosState>(
      store: photosStore,
      onError: (_, PhotoException? error) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${error?.message}',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              photosStore.fetchPhotos();
              photosStore.updateQuery('query');
            },
            child: const Text('"Ops, nao encontramos nenhum resultado"'),
          ),
        ],
      ),
      onState: (_, state) {
        if (state.photos.isEmpty) {
          photosStore.fetchPhotos();
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  //cria um layout com blocos que têm uma extensão máxima de eixo cruzado.
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: MediaQuery.of(context).size.aspectRatio,
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  controller: scrollController,
                  itemCount: state.photos.length,
                  itemBuilder: (context, index) {
                    final photo = state.photos[index];

                    return CustomSmallPhotoWidget(photoPath: photo.photoPath);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
