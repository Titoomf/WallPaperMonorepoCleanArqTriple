import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../store/search_store.dart';

class CustomCategoryButton extends StatelessWidget {
  final String text;

  CustomCategoryButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  final photosStore = Modular.get<FetchPhotosStore>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () {
          photosStore.fetchPhotos();

          photosStore.updateQuery(text.toString());
          // photosStore.resetQuery();
          // photosStore.sumPerpage(5);
        },
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: AppColors.searchFieldColor,
          ),
        ),
      ),
    );
  }
}
