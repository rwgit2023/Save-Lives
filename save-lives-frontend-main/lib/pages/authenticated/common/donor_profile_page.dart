import 'package:flutter/material.dart';
// conversor de datas
import 'package:intl/intl.dart';

import 'package:savelives/models/doador_model.dart';
import 'package:savelives/services/utils/validators.dart';

class DonorProfilePage extends StatelessWidget {
  DoadorModel? donor;

  DonorProfilePage({this.donor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            initialValue: donor!.userBloodType,
            validator: (value) {
              return Validators.validadeFields(value);
            },
            onSaved: (value) {
              donor!.userBloodType = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Tipo Sanguíneo",
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            inputFormatters: [Utils.getDateFormater()],
            initialValue: DateFormat("dd/MM/yyyy").format(DateUtils.dateOnly(
              DateTime.parse(donor!.birth.toString()),
            )),
            validator: (value) {
              return Validators.validadeFields(value);
            },
            onSaved: (value) {
              String date = value.toString().replaceAll("/", "-");
              String dateReversed = date.split("-").reversed.join("-");
              donor!.birth = DateUtils.dateOnly(
                DateFormat("yyyy-MM-dd").parse(dateReversed),
              );
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Data de Nascimento",
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            inputFormatters: [Utils.getPhoneFormatter()],
            initialValue: donor!.userCellphone,
            validator: (value) {
              return Validators.validadeFields(value);
            },
            onSaved: (value) {
              donor!.userCellphone = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Celular",
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width / 1.5,
          child: TextFormField(
            inputFormatters: [Utils.getCpfFormatter()],
            initialValue: donor!.cpf,
            validator: (value) {
              return Validators.validadeFields(value);
            },
            onSaved: (value) {
              donor!.cpf = value;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "CPF",
            ),
          ),
        ),
      ],
    );
  }
}
