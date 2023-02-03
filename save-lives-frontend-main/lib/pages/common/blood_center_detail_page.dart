import 'package:flutter/material.dart';
import 'package:savelives/constants/constants.dart';
import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/services/blood-center/blood_center_service.dart';

class BloodCenterDetailPage extends StatefulWidget {
  int? bloodCenterId;

  BloodCenterDetailPage({this.bloodCenterId});

  @override
  State<StatefulWidget> createState() {
    return _BloodCenterDetailPage();
  }
}

class _BloodCenterDetailPage extends State<BloodCenterDetailPage> {
  final _bloodCenterService = BloodCenterService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes do Hemocentro"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _bloodCenterService.getBloodCenterById(widget.bloodCenterId!),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                    color: Constants.APP_COLORS.PRIMARY_COLOR),
              );
            }

            HemocentroModel hemo = snapshot.data as HemocentroModel;

            return Column(
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
                    initialValue: hemo.name,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.name = value;
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
                    initialValue: hemo.email,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.email = value;
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
                    initialValue: hemo.street,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.street = value;
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
                    initialValue: hemo.neighbourhood,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.neighbourhood = value;
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
                    initialValue: hemo.city,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.city = value;
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
                    initialValue: hemo.state,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.state = value;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Estado"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: TextFormField(
                    initialValue: hemo.zip,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.zip = value;
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
                    initialValue: hemo.phone,
                    readOnly: true,
                    onSaved: (value) {
                      hemo.zip = value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Telefone",
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
