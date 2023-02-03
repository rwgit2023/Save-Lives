import 'package:flutter/material.dart';

import 'package:savelives/models/hemocentro_model.dart';
import 'package:savelives/services/utils/validators.dart';

class BloodCenterProfilePage extends StatelessWidget {
  HemocentroModel? bloodCenter;

  BloodCenterProfilePage({
    this.bloodCenter
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            initialValue: bloodCenter!.cnpj,
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
            initialValue: bloodCenter!.legalName,
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
            initialValue: bloodCenter!.phone,
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
