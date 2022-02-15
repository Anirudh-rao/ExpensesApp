import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String Title;
  final double Amount;
  final DateTime date;

  //Constructor
  Transaction({
    //@required ensure that all four parameters are filled in
    @required this.id,
    @required this.Title,
    @required this.Amount,
    @required this.date,
  });
}
