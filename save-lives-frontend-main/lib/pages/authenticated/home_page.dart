import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/pages/drawers/drawer.dart';
import 'package:savelives/repositories/auth_repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
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
        title: const Text("Início"),
      ),
      drawer: HomeDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(20),
                child: const Text(
                  "Save Lives, a plataforma criada para aproximar o candidato à doação de sangue dos hemocentros.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                 
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/people-holding-rubber-heart.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(                  
                  width: kIsWeb ? MediaQuery.of(context).size.width / 2.5 : MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20),
                  child: const Text(
                    "O candidato à doação de sangue pode agendar sua doação de qualquer lugar, a qualquer momento. Além disso, é possível também visualizar a situação dos bancos de sangue dos hemocentros cadastrados na plataforma. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: const Text(
                    "E o diferencial é que você pode também simular o processo de triagem clinica, que nada mais é do que responder as perguntas que são feitas durante este processo e visualizar se você está apto ou não a doar e isso você pode fazer sem precisar se cadastrar ou logar na aplicação.Já o hemocentro pode controlar os agendamentos das doações, cadastrar os dias e os horários disponíveis para doação e muito mais.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
