import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TranscationList extends StatelessWidget {
  final List<Transaction> transcations;
  TranscationList(this.transcations);

  @override
  Widget build(BuildContext context) {
    return Container(
      //By adding we are defining how much scroll it needs
      height: 500,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
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
                    '\₹${transcations[index].Amount}',
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
                      transcations[index].Title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                    Text(
                      DateFormat('dd-MM-yyy').format(transcations[index].date),
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
        },
        itemCount: transcations.length,
      ),
    );
  }
}
