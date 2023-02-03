import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:savelives/repositories/images_repository.dart';

class OnStartUp {
  static loadImages() async {
    final _imagesRepository = Modular.get<ImagesRepository>();

    BitmapDescriptor bytes = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(
          WidgetsBinding.instance.window.physicalSize.width * 0.025,
          WidgetsBinding.instance.window.physicalSize.height * 0.05,
        ),
      ),
      "assets/images/location-pin-green.png",
    );
    _imagesRepository.addBitmapDescriptor({"ESTÁVEL": bytes});
    bytes = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(
          WidgetsBinding.instance.window.physicalSize.width * 0.025,
          WidgetsBinding.instance.window.physicalSize.height * 0.05,
        ),
      ),
      "assets/images/location-pin-yellow.png",
    );
    _imagesRepository.addBitmapDescriptor({"ADEQUADO": bytes});
    bytes = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(
          WidgetsBinding.instance.window.physicalSize.width * 0.025,
          WidgetsBinding.instance.window.physicalSize.height * 0.05,
        ),
      ),
      "assets/images/location-pin-orange.png",
    );
    _imagesRepository.addBitmapDescriptor({"ALERTA": bytes});
    bytes = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(
        size: Size(
          WidgetsBinding.instance.window.physicalSize.width * 0.025,
          WidgetsBinding.instance.window.physicalSize.height * 0.05,
        ),
      ),
      "assets/images/location-pin-red.png",
    );
    _imagesRepository.addBitmapDescriptor({"CRÍTICO": bytes});
  }
}
