import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            //Text Field Takes in input
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'title'),
                //Controller are one more type that takes in input from keybooard
                controller: amountController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: titleController,
              ),
              FlatButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.text);
                },
                child: Text('Add Transcation'),
                textColor: Colors.purple,
              )
            ],
          ),
        ));
  }
}
