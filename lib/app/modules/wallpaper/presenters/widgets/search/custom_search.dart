import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../store/search_store.dart';

class CustomSearchBarWidget extends StatelessWidget implements PreferredSize {
  final TextEditingController controller;
  final Function(String)? onChanged;

  CustomSearchBarWidget({
    Key? key,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  final photosStore = Modular.get<FetchPhotosStore>();

// esse dois override eu consigo modificar a minha barra de aplicativo personalizado
  @override
  Widget get child => Container();

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 80,
      child: TextField(
        controller: controller,
        cursorColor: AppColors.searchFieldColor,
        textInputAction: TextInputAction.search,
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.searchFieldColor),
        decoration: InputDecoration(
          prefixIcon:
              const Icon(Icons.search, color: AppColors.searchFieldColor),
          hintText: 'Search',
          hintStyle: const TextStyle(color: (AppColors.searchFieldColor)),
          fillColor: AppColors.backgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
