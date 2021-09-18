import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(StatsApp());
}

class StatsApp extends StatelessWidget {
  const StatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Stats App'),
              ),
            ),
          )
        : CupertinoApp(
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Home'),
              ),
              child: Container(),
            ),
          );
  }
}
