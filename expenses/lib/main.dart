import 'dart:math';

import "package:expenses/models/transaction.dart";
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

void main(List<String> args) {
  initializeDateFormatting('pt_BR', null).then((_) {
    runApp(ExpensesApp());
  });
}

//sem estado
class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Quicksand",
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: "OpenSans", fontSize: 16),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    /*
    Transaction(
        id: "t1", title: "Novo tênis", value: 310.76, date: DateTime.now()),
    Transaction(
        id: "t2", title: "Corte de cabelo", value: 55.7, date: DateTime.now()),
    Transaction(
        id: "t3", title: "Corte de cabelo", value: 55.7, date: DateTime.now()),
    Transaction(
        id: "t4", title: "Corte de cabelo", value: 55.7, date: DateTime.now()),
    Transaction(
        id: "t5", title: "Corte de cabelo", value: 55.7, date: DateTime.now()),
    Transaction(
        id: "t6", title: "Corte de cabelo", value: 55.7, date: DateTime.now()),
    Transaction(
        id: "t7", title: "Corte de cabelo", value: 55.7, date: DateTime.now()),
    Transaction(
        id: "t8", title: "Corte de cabelo", value: 55.7, date: DateTime.now()),*/
  ];

  Random rd = Random();

  _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: rd.nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop(); //removendo modal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pesoais"),
        actions: [
          IconButton(
              onPressed: () => _openTransactionModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, //esticar
            children: [
              Container(
                child: Card(
                  color: Colors.blue,
                  child: Text("Gráfico"),
                  elevation: 5,
                ),
              ),
              TransactionList(_transactions),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openTransactionModal(context),
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
