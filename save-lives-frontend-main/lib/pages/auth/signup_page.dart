import 'package:flutter/material.dart';

import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/doador_model.dart';
import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/pages/auth/blood_center_signup_page.dart';
import 'package:savelives/pages/auth/donor_signup_page.dart';
import 'package:savelives/pages/dialogs/alert_dialog.dart';
import 'package:savelives/services/user/user_service.dart';
import 'package:savelives/models/user_model.dart';
import 'package:savelives/services/utils/validators.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  List<UserModel> models = [
    DoadorModel(usertype: Constants.ROLES.DONOR),
    HemocentroModel(usertype: Constants.ROLES.DONOR)
  ];
  int index = 0;
  String _usertype = Constants.ROLES.DONOR;
  final _userService = UserService();
  bool aceito = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar'),
        actions: [
          IconButton(icon: Icon(Icons.home), onPressed: (){
            Modular.to.pushNamed('/');
          },)
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].name = value;
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
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].email = value;
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
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].street = value;
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
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].neighbourhood = value;
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
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].city = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Município",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextFormField(
                  maxLength: 2,
                  textCapitalization: TextCapitalization.characters,
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].state = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "UF",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextFormField(
                  inputFormatters: [Utils.getCepFormater()],
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].zip = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "CEP",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.5,
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    return Validators.validadeFields(value);
                  },
                  onSaved: (value) {
                    models[index].psw = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Senha",
                  ),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: const EdgeInsets.all(5),
                    color: _usertype == Constants.ROLES.DONOR
                        ? Colors.grey.shade300
                        : Colors.transparent,
                    child: Row(
                      children: [
                        Radio<String>(
                          value: Constants.ROLES.DONOR,
                          groupValue: _usertype,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                _usertype = value;
                                index = 0;
                                models[index].usertype = Constants.ROLES.DONOR;
                              }
                            });
                          },
                        ),
                        Flexible(child: Text("DOADOR"))
                      ],
                    ),
                  ),
                  Container(
                    color: _usertype != Constants.ROLES.DONOR
                        ? Colors.grey.shade300
                        : Colors.transparent,
                    width: MediaQuery.of(context).size.width / 3,
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: Constants.ROLES.BLOOD_CENTER,
                          groupValue: _usertype,
                          onChanged: (value) {
                            setState(
                              () {
                                if (value != null) {
                                  _usertype = value;
                                  index = 1;
                                  models[index].usertype =
                                      Constants.ROLES.BLOOD_CENTER;
                                }
                              },
                            );
                          },
                        ),
                        Flexible(
                          child: Text(
                            'HEMOCENTRO',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _usertype == Constants.ROLES.DONOR
                  ? DonorSignUpPage(
                      donor: models[index] as DoadorModel,
                    )
                  : BloodCenterSignUpPage(
                      bloodCenter: models[index] as HemocentroModel,
                    ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogs.getAlertDialog(
                          context,
                          "Termos de Uso",
                          Constants.TERMS_CONSTANTS.TERMS_TEXT,
                          null,
                        );
                      });
                },
                child: Text(
                  "Ler Termos de Uso",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    padding: const EdgeInsets.all(5),
                    color: Colors.grey.shade300,
                    child: Row(
                      children: [
                        Checkbox(
                          value: aceito,
                          onChanged: (value) {
                            setState(() {
                              aceito = !aceito;
                            });
                          },
                        ),
                        Flexible(
                          child: Text("ACEITAR TERMOS"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 3,
                margin: const EdgeInsets.all(10),
                child: TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    if (!aceito) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Você deve aceitar os termos"),
                        ),
                      );
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _userService.saveUser(models[index]);
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
            ],
          ),
        ),
      ),
    );
  }
}
