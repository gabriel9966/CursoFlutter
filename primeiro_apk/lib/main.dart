import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

//widget é uma instância classe
/*StatelessWidget = componente sem estado*/
// material app = widget inicial da aplicação , da acesso a varias configurações
//scaffold vai dar a estrutura básica de design da aplicação
//column uma lista de elementos organizados verticalmente, ele recebe um childrem(lista de items filhos) como argumento

class PeraguntaAppState extends State<PerguntaApp> {
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      "Qual é sua cor favorita ?",
      "Qual é sua musica favorita ?",
      "Qual é seu esporte favorito ?"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Primeiro"),
        ),
        body: Column(
          children: <Widget>[
            Text(perguntas[perguntaSelecionada]),
            ElevatedButton(onPressed: responder, child: Text("Resposta1")),
            ElevatedButton(onPressed: responder, child: Text("Resposta2")),
            ElevatedButton(onPressed: responder, child: Text("Resposta3"))
          ],
        ),
      ),
    );
  }

  var perguntaSelecionada = 0;
  void responder() {
    perguntaSelecionada++;
    print(perguntaSelecionada);
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  PeraguntaAppState createState() {
    return PeraguntaAppState();
  }
}
