import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/doador_model.dart';
import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/models/user_model.dart';

import 'package:savelives/pages/authenticated/common/blood_center_profile_page.dart';
import 'package:savelives/pages/authenticated/common/donor_profile_page.dart';
import 'package:savelives/pages/dialogs/confirm_dialogs.dart';
import 'package:savelives/repositories/auth_repository.dart';
import 'package:savelives/services/user/user_service.dart';
import 'package:savelives/services/utils/validators.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final UserService _userService = UserService();
  final _authRepository = Modular.get<AuthRepository>();

  @override
  void initState() {
    super.initState();
    if (!_authRepository.isLoggedIn)
      Modular.to.pushNamedAndRemoveUntil('/login', (p0) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(icon: Icon(Icons.home), onPressed: (){
            Modular.to.pushNamed('/');
          },)
        ],
      ),
      body: FutureBuilder(
        future: _userService.getUserProfile(
          _authRepository.userInformation![Constants.APP_KEYS.USER_TYPE],
          _authRepository.userInformation![Constants.APP_KEYS.USER_ID]
              .toString(),
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Constants.APP_COLORS.PRIMARY_COLOR,
              ),
            );
          }

          Map<String, UserModel>? map = snapshot.data as Map<String, UserModel>;
          var userModel;
          if (map.keys.first == Constants.ROLES.BLOOD_CENTER) {
            userModel = map.values.first as HemocentroModel;
          } else {
            userModel = map.values.first as DoadorModel;
          }

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(50),
                    child: Center(
                      child: Image.asset(
                        'assets/images/blood_drop.png',
                        height: 120,
                        width: 100,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextFormField(
                      initialValue: userModel.name,
                      validator: (value) {
                        return Validators.validadeFields(value);
                      },
                      onSaved: (value) {
                        userModel.name = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nome",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextFormField(
                      initialValue: userModel.email,
                      validator: (value) {
                        return Validators.validadeFields(value);
                      },
                      onSaved: (value) {
                        userModel.email = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextFormField(
                      initialValue: userModel.street,
                      validator: (value) {
                        return Validators.validadeFields(value);
                      },
                      onSaved: (value) {
                        userModel.street = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Rua",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextFormField(
                      initialValue: userModel.neighbourhood,
                      validator: (value) {
                        return Validators.validadeFields(value);
                      },
                      onSaved: (value) {
                        userModel.neighbourhood = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Bairro",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextFormField(
                      initialValue: userModel.city,
                      validator: (value) {
                        return Validators.validadeFields(value);
                      },
                      onSaved: (value) {
                        userModel.city = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Cidade",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextFormField(
                      initialValue: userModel.state,
                      validator: (value) {
                        return Validators.validadeFields(value);
                      },
                      onSaved: (value) {
                        userModel.state = value;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Estado"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: TextFormField(
                      initialValue: userModel.zip,
                      validator: (value) {
                        return Validators.validadeFields(value);
                      },
                      onSaved: (value) {
                        userModel.zip = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "CEP",
                      ),
                    ),
                  ),
                  _authRepository
                              .userInformation![Constants.APP_KEYS.USER_TYPE] ==
                          Constants.ROLES.DONOR
                      ? DonorProfilePage(
                          donor: userModel as DoadorModel,
                        )
                      : BloodCenterProfilePage(
                          bloodCenter: userModel as HemocentroModel,
                        ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        margin: const EdgeInsets.all(10),
                        child: TextButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return ConfirmDialogs.getConfirmDialog(
                                    context,
                                    "Atenção",
                                    "Deseja atualizar seu cadastro com estes dados?",
                                    userModel,
                                    _userService.updateUser,
                                  );
                                },
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "Salvar",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.5,
                        margin: const EdgeInsets.all(10),
                        child: TextButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ConfirmDialogs.getConfirmDialog(
                                  context,
                                  "Atenção",
                                  "Deseja deletar sua conta?",
                                  userModel.userid,
                                  _userService.deleteAccount,
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          label: const Text(
                            "Deletar conta",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
