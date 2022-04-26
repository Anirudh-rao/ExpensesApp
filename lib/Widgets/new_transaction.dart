import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final eneteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (eneteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      eneteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData
                // onChanged: (val) {
                //   titleInput = val;
                // },
                ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              //Will Change Keyborad type to number
              keyboardType: TextInputType.number,
              //Anonymous Function with an underScore that indicates
              //No value
              onSubmitted: (_) => submitData,
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                submitData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
