import 'package:flutter/material.dart';

main() {
  runApp(PerguntaApp());
}

//widget é uma instância classe
/*StatelessWidget = componente sem estado*/
// material app = widget inicial da aplicação , da acesso a varias configurações
//scaffold vai dar a estrutura básica de design da aplicação
class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Primeiro"),
        ),
        body: Text("Ola flutter"),
      ),
    );
  }
}
