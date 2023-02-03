import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:savelives/pages/drawers/drawer.dart';
import 'package:savelives/repositories/auth_repository.dart';

class HomeDonor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeDonor();
  }
}

class _HomeDonor extends State<HomeDonor> {
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
        title: Text("Início"),
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
                    fontSize: 24,
                  ),
                ),
              ),
            ),
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
              width: kIsWeb
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: const Text(
                "O candidato à doação de sangue pode agendar sua doação de qualquer lugar, a qualquer momento. Além disso, é possível também visualizar a situação dos bancos de sangue dos hemocentros cadastrados na plataforma. E o diferencial é que você pode também simular o processo de triagem clinica, que nada mais é do que responder as perguntas que são feitas durante este processo e visualizar se você está apto ou não a doar e isso você pode fazer sem precisar se cadastrar ou logar na aplicação.Já o hemocentro pode controlar os agendamentos das doações, cadastrar os dias e os horários disponíveis para doação e muito mais. ",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(22),
                child: const Text(
                  "Sobre doações",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
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
            Container(
              width: kIsWeb
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: Wrap(
                children: [
                  const Text(
                    "Você sabia que os meses em que há uma maior necessidade de doação de sangue são os meses de Dezembro, Janeiro e Fevereiro? Você sabe o motivo de justamente esses meses serem os que as pessoas precisam de mais doações de sangue? ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    child: const Text(
                      "Leia mais...",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, color: Colors.purple),
                    ),
                    onTap: (){
                      Modular.to.pushNamed('/december-page');
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: const Text(
                "Dúvidas frequentes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/leia_mais_2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: kIsWeb
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: Wrap(
                children: const [
                  Text(
                    "Mitos e verdades sobre a doação de sangue.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Leia mais...",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15, color: Colors.purple),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: const Text(
                "Podcast",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              width: kIsWeb
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width / 2,
              height: kIsWeb
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/podcast.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: kIsWeb
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              child: const Text(
                "Escaneie o QR code para ouvir o podcast do Save Lives.Este podcast foi feito sob orientação do professor especialista Wanderley Rodrigo de Souza.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
