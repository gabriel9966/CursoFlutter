import 'package:flutter/material.dart';
//sem estado

class Resposta extends StatelessWidget {
  final String texto;

  Resposta(this.texto);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: null, child: Text(texto));
  }
}
