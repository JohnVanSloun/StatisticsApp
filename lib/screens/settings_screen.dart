import 'package:flutter/material.dart';

import '../widgets/custom_bot_nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  final Function func1;
  final Function func2;
  final Function func3;
  SettingsScreen(this.func1, this.func2, this.func3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats App'),
      ),
      bottomNavigationBar: CustomBotNavBar(func1, func2, func3),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.9,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.05),
        child: Card(
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Text('App Color Theme'),
                ],
              ),
              Row(
                children: [
                  Text('Dark Mode'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
