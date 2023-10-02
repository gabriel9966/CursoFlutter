import 'dart:math';

import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rd = Random();
    int Naeatorio = rd.nextInt(101);

    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        Naeatorio.toString() + " %",
        style: TextStyle(fontSize: 25),
      ),
      Text(
        "Parabéns !",
        style: TextStyle(fontSize: 25),
      )
    ]));
  }
}
