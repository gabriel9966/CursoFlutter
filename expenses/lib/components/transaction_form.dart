import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    } else {
      widget.onSubmit(title, value); //por herança
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
              controller: titleController,
              onSubmitted: (value) => _submitForm(),
              decoration: InputDecoration(labelText: "Título")),
          TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _submitForm(),
              controller: valueController,
              decoration: InputDecoration(labelText: "Valor em (R\$)")),
          TextButtonTheme(
            data: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor:
                    Colors.purple, // Define a cor do texto do botão
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _submitForm,
                  child: Text("Nova transação"),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
