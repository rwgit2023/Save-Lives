import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/pages/dialogs/confirm_dialogs.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/auth/auth_service.dart';

class HomeDrawer extends StatelessWidget {
  //
  final _authRepository = Modular.get<AuthRepository>();
  final _authService = AuthService();
  //
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              heightFactor: 3,
              child: Image(
                image: AssetImage('assets/images/blood_drop_black_white.png'),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Observer(
                  builder: (context) {
                    return (_authRepository.userInformation![
                                Constants.APP_KEYS.USER_TYPE] !=
                            Constants.ROLES.BLOOD_CENTER)
                        ? ListTile(
                            leading: const Icon(Icons.format_align_left),
                            title: const Text("Avaliação prévia"),
                            onTap: () {
                              Modular.to.pushNamed('/questions');
                            },
                          )
                        : Container();
                  },
                ),
                Observer(builder: (context) {
                  return (_authRepository
                              .userInformation![Constants.APP_KEYS.USER_TYPE] !=
                          Constants.ROLES.BLOOD_CENTER)
                      ? ListTile(
                          leading: const Icon(Icons.water_drop),
                          title: const Text("Hemocentros"),
                          onTap: () {
                            Modular.to.pushNamed('/blood-centers');
                          },
                        )
                      : Container();
                }),
                Observer(
                  builder: (context) {
                    if (_authRepository.isLoggedIn &&
                        _authRepository.userInformation![
                                Constants.APP_KEYS.USER_TYPE] ==
                            Constants.ROLES.BLOOD_CENTER) {
                      return ListTile(
                        leading: const Icon(Icons.timer),
                        title: const Text("Adicionar horário"),
                        onTap: () {
                          Modular.to.pushNamed('/insert-daytime');
                        },
                      );
                    }
                    //
                    else if (_authRepository.isLoggedIn &&
                        _authRepository.userInformation![
                                Constants.APP_KEYS.USER_TYPE] ==
                            Constants.ROLES.DONOR) {
                      return ListTile(
                        leading: const Icon(Icons.timer),
                        title: const Text("Agendar horário"),
                        onTap: () {
                          Modular.to.pushNamed('/schedule');
                        },
                      );
                    }
                    return Container();
                  },
                ),
                Observer(
                  builder: (context) {
                    return (_authRepository.isLoggedIn &&
                            _authRepository.userInformation![
                                    Constants.APP_KEYS.USER_TYPE] ==
                                Constants.ROLES.BLOOD_CENTER
                        ? ListTile(
                            leading: const Icon(Icons.warning),
                            title: const Text("Criticidade"),
                            onTap: () {
                              Modular.to.pushNamed('/criticity');
                            },
                          )
                        : Container());
                  },
                ),
                Observer(
                  builder: (context) {
                    return (_authRepository.isLoggedIn
                        ? ListTile(
                            leading: const Icon(Icons.menu_book),
                            title: const Text("Agendamento pendente"),
                            onTap: () {
                              Modular.to.pushNamed('/pending-schedule');
                            },
                          )
                        : Container());
                  },
                ),
                Observer(
                  builder: (context) {
                    return (_authRepository.isLoggedIn
                        ? ListTile(
                            leading: const Icon(Icons.menu_book),
                            title: const Text("Agendamento concluído"),
                            onTap: () {
                              Modular.to.pushNamed('/schedule-completed');
                            },
                          )
                        : Container());
                  },
                ),
                Observer(
                  builder: (context) {
                    if (!_authRepository.isLoggedIn) {
                      return ListTile(
                        leading: const Icon(Icons.app_registration),
                        title: const Text("Cadastro"),
                        onTap: () {
                          Modular.to.pushNamed('/signup');
                        },
                      );
                    }
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Atualizar cadastro"),
                      onTap: () {
                        Modular.to.pushNamed('/profile-page');
                      },
                    );
                  },
                ),
                Observer(builder: (context) {
                  if (!_authRepository.isLoggedIn) {
                    return ListTile(
                      leading: const Icon(Icons.login),
                      title: const Text("Entrar"),
                      onTap: () {
                        Modular.to.pushNamed('/login');
                      },
                    );
                  }
                  return ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Sair"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ConfirmDialogs.getConfirmDialog(
                            context,
                            "Sair",
                            "Deseja mesmo sair?",
                            null,
                            _authService.logout,
                          );
                        },
                      );
                    },
                  );
                }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              Constants.SYSTEM.APP_NAME,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
