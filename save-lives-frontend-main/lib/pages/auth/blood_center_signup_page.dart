import 'package:flutter/material.dart';

import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/services/utils/validators.dart';

class BloodCenterSignUpPage extends StatelessWidget {
  HemocentroModel? bloodCenter;
  Function? callback;

  BloodCenterSignUpPage({
    this.bloodCenter,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            validator: (value) {
              return Validators.validadeFields(value);
            },
            onSaved: (value) {
              bloodCenter!.cnpj = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "CNPJ",
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
              bloodCenter!.legalName = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nome Fantasia",
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            inputFormatters: [Utils.getPhoneFormatter()],
            validator: (value) {
              return Validators.validadeFields(value);
            },
            onSaved: (value) {
              bloodCenter!.phone = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Telefone",
            ),
          ),
        ),
      ],
    );
  }
}
