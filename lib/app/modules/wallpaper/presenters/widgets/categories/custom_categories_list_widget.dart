import 'package:flutter/material.dart';

import '../button/custom_category_button.dart';

class CustomCategoriesListWidget extends StatelessWidget {
  CustomCategoriesListWidget({
    Key? key,
  }) : super(key: key);

  final List<String> categories = ['city', 'animal', 'nature', 'motivação'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // vai pecorrer a lista de categorias
      children: categories
          .map(
            (data) => CustomCategoryButton(text: data),
          )
          .toList(),
    );
  }
}
