import 'package:flutter/material.dart';
import 'package:stats_app/themes/dark_theme.dart';
import 'package:stats_app/themes/light_theme.dart';

import 'screens/new_data.dart';
import 'screens/data_library_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _librarySelected = false;
  var _profileSelected = false;
  var _darkTheme = false;

  void toNewData() {
    setState(() {
      this._librarySelected = false;
      this._profileSelected = false;
    });
  }

  void toLibrary() {
    setState(() {
      this._librarySelected = true;
      this._profileSelected = false;
    });
  }

  void toSettings() {
    setState(() {
      this._librarySelected = false;
      this._profileSelected = true;
    });
  }

  void changeTheme(value) {
    setState(() {
      this._darkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkTheme
          ? DarkTheme().buildDarkTheme()
          : LightTheme().buildLightTheme(),
      home: Navigator(
        pages: [
          MaterialPage(
              child: NewData(
            toNewData,
            toLibrary,
            toSettings,
          )),
          if (_librarySelected)
            MaterialPage(
                child: DataLibraryScreen(
              toNewData,
              toLibrary,
              toSettings,
            )),
          if (_profileSelected)
            MaterialPage(
              child: SettingsScreen(
                toNewData,
                toLibrary,
                toSettings,
                changeTheme,
              ),
            ),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
