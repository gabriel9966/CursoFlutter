import 'package:flutter/material.dart';

import './questao.dart';
import './resposta.dart';
import './resultado.dart';

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
    List<String>? resposta = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]["resposta"] as List<String>
        : null;
    List<Widget>? widget =
        resposta?.map((t) => Resposta(t, _responder)).toList();

/*
    final respostas =
        _perguntas[_perguntaSelecionada]?["resposta"] as List<String>?;

    if (respostas != null) {
      for (String i in respostas) {
        resposta.add(Resposta(i, _responder));
      }
    }*/

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Primeiro"),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: <Widget>[
                    Questao(_perguntas[_perguntaSelecionada]["texto"]
                        as String), //as String conversão explicita
                    if (resposta != null) ...?widget
                    //... todos os elementos sao adicionados
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Resultado(),
                    ElevatedButton(
                        onPressed: _reiniciar, child: Text("Reiniciar"))
                  ],
                )),
    );
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é sua cor favorita ?",
      "resposta": ["Preto", "Vermelho", "Verde", "Branco"]
    },
    {
      "texto": "Qual é seu esporte favorito ?",
      "resposta": ["Correr", "Nadar", "Academia", "Futebol"]
    },
    {
      "texto": "Qual é o seu carro favorito ?",
      "resposta": ["Ferrari", "Porsche", "Maserati", "Ford"]
    }
  ];

  var _perguntaSelecionada = 0;

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }
}

//com estado
class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
