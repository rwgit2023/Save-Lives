import 'package:mobx/mobx.dart';

part 'auth_repository.g.dart';

class AuthRepository extends _AuthRepository with _$AuthRepository {}

abstract class _AuthRepository with Store {
  @observable
  String? username = "";

  @observable
  String? token = "";

  @observable
  bool isLoggedIn = false;

  @observable
  ObservableMap<String, dynamic>? userInformation = ObservableMap<String, dynamic>.of({});

  @action
  void setUsername(String? user) {
    if (username == null) return;
    //
    username = user;
  }

  @action
  void setToken(String? responseToken) {
    token = responseToken;
  }

  @action
  void setUserInformation(Map<String, dynamic>? infos) {    
    //
    userInformation = ObservableMap<String, dynamic>.of(infos!);
  }

  @action
  void setIsLoggedIn(bool hasSignedIn){
    isLoggedIn = hasSignedIn;
  }
}
