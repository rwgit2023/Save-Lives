import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/pages/drawers/drawer.dart';
import 'package:savelives/repositories/auth_repository.dart';

class DecemberPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DecemberPage();
  }
}

class _DecemberPage extends State<DecemberPage> {
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
        title: Text("Leitura"),
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
                  "Saiba o motivo dos meses de Dezembro, Janeiro e Fevereiro serem os meses que aumenta a necessidade de doação de sangue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/ler_mais_1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: kIsWeb
                  ? MediaQuery.of(context).size.width / 1.5
                  : MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: const Text(
                "Você sabia que os meses em que há uma maior necessidade de doação de sangue são os meses de Dezembro, Janeiro e Fevereiro? Você sabe o motivo de justamente esses meses serem os que as pessoas precisam de mais doações de sangue? \n \n São esses meses, por conta que é período em que as pessoas tiram férias, saem para festas de ano novo, natal, carnaval e consequentemente são os meses que ocorrem um maior número de acidentes. Assim, a demanda de doação de sangue cresce. \n \n Isso é o que podemos concluir a partir de um artigo publicado na Revista Brasileira de Promoção a Saúde. Para mais informações do artigo citado, basta clicar no link a seguir: \n \n https://ojs.unifor.br/RBPS/article/view/5873/pdf \n\n Ótima leitura! ",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
