import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/theme/app_colors.dart';
import '../store/search_store.dart';
import '../widgets/categories/custom_categories_list_widget.dart';
import '../widgets/gridview/custom_scoped_builder__grid_view_widget.dart';
import '../widgets/search/custom_search.dart';

class HomePageListPhotosPage extends StatefulWidget {
  const HomePageListPhotosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageListPhotosPage> createState() => _HomePageListPhotosPageState();
}

class _HomePageListPhotosPageState extends State<HomePageListPhotosPage> {
  final photosStore = Modular.get<FetchPhotosStore>();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Wallpaper',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            letterSpacing: 2.0,
          ),
        ),
        actions: const [
          // PerPageSlideComponent(),
        ],
        bottom: CustomSearchBarWidget(
          controller: controller,
          onChanged: (value) => photosStore.updateQuery(
            controller.text,
          ),
        ),
      ),
      body: Column(
        children: [
          CustomCategoriesListWidget(),
          const Expanded(
            child: CustomGridViewScopedBuilderWidget(),
          ),
        ],
      ),
    );
  }
}
