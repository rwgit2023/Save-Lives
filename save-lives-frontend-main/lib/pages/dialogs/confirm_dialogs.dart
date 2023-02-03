import 'package:flutter/material.dart';

class ConfirmDialogs {
  static Widget getConfirmDialog(BuildContext context, String title, String text, dynamic data, Function? action) {
    return AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            if(data != null && action != null){
              Navigator.of(context).pop();
              return action.call(data);
            }
            action!.call();
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        )
      ],
    );
  }

   static Widget getConfirmDialog3Parameter(BuildContext context, String title, String text, dynamic data1, dynamic data2, dynamic data3, Function? action) {
    return AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            if((data1 != null && data2 != null && data3 != null) && action != null){
              Navigator.of(context).pop();
              return action.call(data1, data2, data3);
            }
            action!.call();
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        )
      ],
    );
  }
}
