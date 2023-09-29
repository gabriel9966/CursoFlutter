import 'package:flutter/material.dart';

//sem estado
class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto); // Uso da sintaxe de inicialização de campo

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      /*ocupa toda largura disponivel*/
      margin: EdgeInsets.all(10),
      child: Text(
        /*child = representa o conteudo*/
        texto,
        style: TextStyle(fontSize: 29),
        textAlign: TextAlign.center,
      ),
    );
  }
}
