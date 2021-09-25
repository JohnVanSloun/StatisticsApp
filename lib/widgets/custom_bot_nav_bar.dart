import 'package:flutter/material.dart';

class CustomBotNavBar extends StatelessWidget {
  final Function func1;
  final Function func2;
  final Function func3;
  CustomBotNavBar(this.func1, this.func2, this.func3);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: ElevatedButton(
            child: Icon(Icons.library_books),
            onPressed: () => func2(),
          ),
          label: 'Library',
        ),
        BottomNavigationBarItem(
          icon: ElevatedButton(
            child: Icon(Icons.add),
            onPressed: () => func1(),
          ),
          label: 'Add Data',
        ),
        BottomNavigationBarItem(
          icon: ElevatedButton(
            child: Icon(Icons.settings),
            onPressed: () => func3(),
          ),
          label: 'Settings',
        )
      ],
    );
  }
}
