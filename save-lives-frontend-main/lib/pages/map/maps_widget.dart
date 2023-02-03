import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/maps_model.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/pages/builders/build_markers.dart';
import 'package:savelives/services/blood-center/blood_center_service.dart';

class MapsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapsWidget();
  }
}

class _MapsWidget extends State<MapsWidget> {
  final mapsModel = MapsModel();
  final _bloodCenterService = BloodCenterService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _bloodCenterService.getAllBloodCenterWithCriticity(),      
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              color: Constants.APP_COLORS.PRIMARY_COLOR,
            ),
          );
        }

        List<UserModel> users = snapshot.data as List<UserModel>;

        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: mapsModel.center,
            zoom: 11.0,
          ),
          markers: BuildMarkers.buildMarkers(users),
        );
      },
    );
  }
}
