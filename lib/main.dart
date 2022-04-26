import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './Widgets/new_transaction.dart';
import '../Widgets/transcation_list.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Will add a Global Theme/Default  that the app can to follow
      theme: ThemeData(
          //PrimarySwatch makes the app  generate different shades of the color
          //Primary Color forces a particukar color
          primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _UserTransactions = [
    Transaction(
        id: 't1', Title: 'New Shoes', Amount: 69.90, date: DateTime.now()),
    Transaction(id: 't2', Title: 'Groceries', Amount: 400, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      Title: txTitle,
      Amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    //To setState
    setState(() {
      //Add methid
      _UserTransactions.add(newTx);
    });
  }

  void _StartAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Expenses App'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _StartAddNewTransaction(context))
          ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    )),
                elevation: 5,
              ),
            ),
            //Input Area
            TranscationList(_UserTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _StartAddNewTransaction(context),
      ),
    );
  }
}
