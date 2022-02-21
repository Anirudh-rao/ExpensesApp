import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transcations;
  TranscationList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Column(
      //We are mapping transactions to the widget
      //We also use tolist to ensure that the output is a list
      //Since map() function produces a map i.e key value pair
      children: transcations.map((tx) {
        //Tx is a function that returns a widget
        //in our case a Card
        return Card(
          //we can acess the tx values from here
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple, width: 2)),
                padding: EdgeInsets.all(10),
                //Double needs to be converted to a String
                child: Text(
                  //Text Widget outputs text
                  //$ is a reversed charecter
                  // we can use '\'
                  '\₹${tx.Amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple),
                ),
              ),
              Column(
                //Alligns from left to right

                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    tx.Title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple),
                  ),
                  Text(
                    DateFormat('dd-MM-yyy').format(tx.date),
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
