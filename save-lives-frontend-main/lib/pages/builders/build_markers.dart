import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/repositories/images_repository.dart';

class BuildMarkers {
  static Set<Marker> buildMarkers(List<UserModel> users) {
    final _imagesRepository = Modular.get<ImagesRepository>();
    Set<Marker> markers = {};
    for (var user in users) {
      HemocentroModel hemo = user as HemocentroModel;

      BitmapDescriptor? marker = _imagesRepository.hueColors![Constants.BLOOD_CENTER_CONSTANTS.STABLE];

      try {
        if (user.bloodBankList!.isNotEmpty) {
          if (hemo.bloodBankList!
              .where((element) =>
                  element.status == Constants.BLOOD_CENTER_CONSTANTS.CRITICAL)
              .isNotEmpty) {
            marker = _imagesRepository
                .hueColors![Constants.BLOOD_CENTER_CONSTANTS.CRITICAL];
          } else if (hemo.bloodBankList!
              .where((element) =>
                  element.status == Constants.BLOOD_CENTER_CONSTANTS.ALERT)
              .isNotEmpty) {
            marker = _imagesRepository
                .hueColors![Constants.BLOOD_CENTER_CONSTANTS.ALERT];
          } else if (hemo.bloodBankList!
              .where((element) =>
                  element.status == Constants.BLOOD_CENTER_CONSTANTS.ADEQUAD)
              .isNotEmpty) {
            marker = _imagesRepository
                .hueColors![Constants.BLOOD_CENTER_CONSTANTS.ADEQUAD];
          } else {
            marker = _imagesRepository
                .hueColors![Constants.BLOOD_CENTER_CONSTANTS.STABLE];
          }
        }
      } catch (e) {
        print(e);
      }

      markers.add(
        Marker(
          markerId: MarkerId(
            user.userid.toString(),
          ),
          icon: marker!,
          infoWindow: InfoWindow(
            title: user.name,
            onTap: () => Modular.to
                .pushNamed('/blood-center-detail', arguments: user.userid),
          ),
          position: LatLng(
            user.latitude!,
            user.longitude!,
          ),
        ),
      );
    }
    return markers;
  }
}
