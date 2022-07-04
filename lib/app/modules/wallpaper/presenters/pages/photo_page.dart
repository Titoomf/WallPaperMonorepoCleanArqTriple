import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/usecases/get_download_photo_usecase.dart';
import '../widgets/button/custom_download_button_widget.dart';
import '../widgets/snackbar/custom_snack_bar_widget.dart';

class PhotoPage extends StatelessWidget {
  final String imagePath;

  PhotoPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  final downloadUsecase = Modular.get<GetDownloadPhotoUsecase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                onPressed: () {
                  Modular.to.maybePop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: DownloadButtonWidget(
              onPressed: () async {
                final response = await downloadUsecase(imagePath: imagePath);

                response.fold(
                  (l) => ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnackBarWidget(
                      message: l.message,
                      color: Colors.red,
                    ),
                  ),
                  (r) => ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnackBarWidget(
                      message: 'Já pode conferir a foto na sua galeria!',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
