import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'images_repository.g.dart';

class ImagesRepository extends _ImagesRepository with _$ImagesRepository {}

abstract class _ImagesRepository with Store {
  @observable
  ObservableMap<String, BitmapDescriptor>? hueColors =
      {"DEFAULT": BitmapDescriptor.defaultMarker}.asObservable();

  @action
  void addBitmapDescriptor(Map<String, BitmapDescriptor>? bitmap) {
    if (bitmap != null) {
      hueColors!.addAll(bitmap);
    }
  }
}
