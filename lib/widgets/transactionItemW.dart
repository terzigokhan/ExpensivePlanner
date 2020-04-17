

import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionItemW extends StatelessWidget {
  const TransactionItemW({
    Key key,
    @required Transaction transaction,
    @required this.deleteTxt,
  }) : _transaction = transaction, super(key: key);

  final Transaction _transaction;
  final Function deleteTxt;

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
    leading: CircleAvatar(
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: FittedBox(
            child: Text('\$${_transaction.amount}')),
      ),
    ),
    title: Text(
      _transaction.title,
      style: Theme.of(context).textTheme.title,
    ),
    subtitle: Text(
      DateFormat.yMMMd().format(_transaction.date),
      // style: Theme.of(context).textTheme.subtitle,
    ),
    trailing: MediaQuery.of(context).size.width > 460
        ? FlatButton.icon(
            onPressed: () =>
                deleteTxt(_transaction.id),
            icon: Icon(Icons.delete),
            label: Text('Delete'),
            textColor: Theme.of(context).errorColor,
          )
        : IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).errorColor,
            onPressed: () =>
                deleteTxt(_transaction.id),
          ),
                ),
              );
  }
}
