import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  //
  final _emailController = TextEditingController();
  final _pswController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _pswController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autenticação'),
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
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "O campo não pode ser vazio";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Email"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 2,
                child: TextFormField(
                  controller: _pswController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "O campo não pode ser vazio";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Senha",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(40),
                child: TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(
                        MediaQuery.of(context).size.width / 2.5,
                        40,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Constants.APP_COLORS.PRIMARY_COLOR),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processando...'),
                        ),
                      );
                      final response = await _authService.login(
                        _emailController.text,
                        _pswController.text,
                      );
                      if (!response) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuário ou senha inválidos'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Entrar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text(Constants.SYSTEM.APP_NAME)
            ],
          ),
        ),
      ),
    );
  }
}
