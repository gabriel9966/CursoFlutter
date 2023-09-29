import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';

main() {
  runApp(PerguntaApp());
}

//widget é uma instância classe
/*StatelessWidget = componente sem estado*/
// material app = widget inicial da aplicação , da acesso a varias configurações
//scaffold vai dar a estrutura básica de design da aplicação
//column uma lista de elementos organizados verticalmente, ele recebe um childrem(lista de items filhos) como argumento

/*essa clase gerência o estado*/
class _PerguntaAppState extends State<PerguntaApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Primeiro"),
        ),
        body: Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]),
            Resposta("Resposta1"),
            Resposta("Resposta2"),
            Resposta("Resposta3")
          ],
        ),
      ),
    );
  }

  final List<String> _perguntas = [
    "Qual é sua cor favorita ?",
    "Qual é sua musica favorita ?",
    "Qual é seu esporte favorito ?",
    "Qual é o seu carro favorito ?"
  ];

  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    if (_perguntaSelecionada > _perguntas.length - 1) {
      setState(() {
        _perguntaSelecionada = 0;
      });
    }

    print(_perguntaSelecionada);
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
