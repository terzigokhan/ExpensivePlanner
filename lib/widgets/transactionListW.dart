import '../widgets/transactionItemW.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionListW extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function deleteTxt;
  TransactionListW(this._userTransaction, this.deleteTxt);

  @override
  Widget build(BuildContext context) {
    return _userTransaction.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constaints) {
              return Column(
                children: <Widget>[
                  Text(
                    'Not any transaction added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: constaints.maxHeight * 0.2,
                  ),
                  Container(
                      height: constaints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        : ListView(
            children: _userTransaction
                .map((tx) => TransactionItemW(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTxt: deleteTxt,
                    ))
                .toList(),
          );
    /*ListView.builder(
            itemBuilder: (ctx, index) {
              return /* Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorDark,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'TL ${_userTransaction[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _userTransaction[index].title,
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            DateFormat.yMd()
                                .add_Hm()
                                .format(_userTransaction[index].date),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ); */
                  TransactionItemW(transaction: _userTransaction[index], deleteTxt: deleteTxt);
            },
            itemCount: _userTransaction.length,
          )*/
    ;
  }
}
