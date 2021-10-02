import 'package:flutter/material.dart';
import 'package:stats_app/screens/login_screen.dart';

import '../widgets/custom_bot_nav_bar.dart';

class SettingsScreen extends StatefulWidget {
  final Function func1;
  final Function func2;
  final Function func3;
  final Function changeTheme;
  const SettingsScreen(this.func1, this.func2, this.func3, this.changeTheme);

  @override
  _SettingsScreenState createState() =>
      _SettingsScreenState(func1, func2, func3, changeTheme);
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Function func1;
  final Function func2;
  final Function func3;
  final Function changeTheme;
  bool isSwitched = false;
  bool isSignedIn = false;
  _SettingsScreenState(this.func1, this.func2, this.func3, this.changeTheme);

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Profile'),
                  isSignedIn
                      ? Text('Signed in')
                      : ElevatedButton(
                          child: Text('Sign In'),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                        ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Dark Theme'),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(
                        () {
                          this.isSwitched = value;
                          changeTheme(value);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
