import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página não encontrada'),
      ),
      body: const Center(
        child: Icon(
          Icons.block,
          color: Colors.red,
        ),
      ),
    );
  }
}
