// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImagesRepository on _ImagesRepository, Store {
  late final _$hueColorsAtom =
      Atom(name: '_ImagesRepository.hueColors', context: context);

  @override
  ObservableMap<String, BitmapDescriptor>? get hueColors {
    _$hueColorsAtom.reportRead();
    return super.hueColors;
  }

  @override
  set hueColors(ObservableMap<String, BitmapDescriptor>? value) {
    _$hueColorsAtom.reportWrite(value, super.hueColors, () {
      super.hueColors = value;
    });
  }

  late final _$_ImagesRepositoryActionController =
      ActionController(name: '_ImagesRepository', context: context);

  @override
  void addBitmapDescriptor(Map<String, BitmapDescriptor>? bitmap) {
    final _$actionInfo = _$_ImagesRepositoryActionController.startAction(
        name: '_ImagesRepository.addBitmapDescriptor');
    try {
      return super.addBitmapDescriptor(bitmap);
    } finally {
      _$_ImagesRepositoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hueColors: ${hueColors}
    ''';
  }
}
