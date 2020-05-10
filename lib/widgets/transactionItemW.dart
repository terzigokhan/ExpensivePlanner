import 'package:intl/intl.dart';
import 'dart:math';
import '../models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionItemW extends StatefulWidget {
  const TransactionItemW({
    Key key,
    @required Transaction transaction,
    @required this.deleteTxt,
  })  : _transaction = transaction,
        super(key: key);

  final Transaction _transaction;
  final Function deleteTxt;

  @override
  _TransactionItemWState createState() => _TransactionItemWState();
}

class _TransactionItemWState extends State<TransactionItemW> {
  Color _backGroundCOlor;
  @override
  void initState() {
    const avaibleColors = [
      Colors.red,
      Colors.blue,
      Colors.purple,
      Colors.black
    ];

    _backGroundCOlor = avaibleColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backGroundCOlor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: FittedBox(child: Text('\$${widget._transaction.amount}')),
          ),
        ),
        title: Text(
          widget._transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget._transaction.date),
          // style: Theme.of(context).textTheme.subtitle,
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget.deleteTxt(widget._transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTxt(widget._transaction.id),
              ),
      ),
    );
  }
}
