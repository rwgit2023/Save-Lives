// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthRepository on _AuthRepository, Store {
  late final _$usernameAtom =
      Atom(name: '_AuthRepository.username', context: context);

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: '_AuthRepository.token', context: context);

  @override
  String? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: '_AuthRepository.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$userInformationAtom =
      Atom(name: '_AuthRepository.userInformation', context: context);

  @override
  ObservableMap<String, dynamic>? get userInformation {
    _$userInformationAtom.reportRead();
    return super.userInformation;
  }

  @override
  set userInformation(ObservableMap<String, dynamic>? value) {
    _$userInformationAtom.reportWrite(value, super.userInformation, () {
      super.userInformation = value;
    });
  }

  late final _$_AuthRepositoryActionController =
      ActionController(name: '_AuthRepository', context: context);

  @override
  void setUsername(String? user) {
    final _$actionInfo = _$_AuthRepositoryActionController.startAction(
        name: '_AuthRepository.setUsername');
    try {
      return super.setUsername(user);
    } finally {
      _$_AuthRepositoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setToken(String? responseToken) {
    final _$actionInfo = _$_AuthRepositoryActionController.startAction(
        name: '_AuthRepository.setToken');
    try {
      return super.setToken(responseToken);
    } finally {
      _$_AuthRepositoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserInformation(Map<String, dynamic>? infos) {
    final _$actionInfo = _$_AuthRepositoryActionController.startAction(
        name: '_AuthRepository.setUserInformation');
    try {
      return super.setUserInformation(infos);
    } finally {
      _$_AuthRepositoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoggedIn(bool hasSignedIn) {
    final _$actionInfo = _$_AuthRepositoryActionController.startAction(
        name: '_AuthRepository.setIsLoggedIn');
    try {
      return super.setIsLoggedIn(hasSignedIn);
    } finally {
      _$_AuthRepositoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
username: ${username},
token: ${token},
isLoggedIn: ${isLoggedIn},
userInformation: ${userInformation}
    ''';
  }
}
