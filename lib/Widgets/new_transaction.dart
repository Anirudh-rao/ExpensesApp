import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final eneteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (eneteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    //Widget. We can add any changes to the widget
    // Should be named issues

    widget.addTx(
      eneteredTitle,
      enteredAmount,
    );
    //We are telling the app the close the modal sheet after accepting values
    
    Navigator.of(context).pop();
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
