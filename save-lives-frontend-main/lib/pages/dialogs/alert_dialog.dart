import 'package:flutter/material.dart';

class AlertDialogs {
  static Widget getAlertDialog(
      BuildContext context, String title, String text, dynamic data) {
    return AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }

  static Widget goodDialog(
      BuildContext context, String title, String text, dynamic data) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green,
          ),
          Text(title),
        ],
      ),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }

  static Widget badDialog(
      BuildContext context, String title, String text, dynamic data) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(
            Icons.block,
            color: Colors.red,
          ),
          Text(title),
        ],
      ),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}
