import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveFlatButtonW extends StatelessWidget {
  final String text;
  final Function handler;

  AdaptiveFlatButtonW(this.text,this.handler);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                        ? CupertinoButton(
                            onPressed: handler,
                            child: Text(
                              'Choose Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : FlatButton(
                            onPressed: handler,
                            child: Text(
                              'Choose Date',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            textColor: Theme.of(context).primaryColor,
                          );
  }
}