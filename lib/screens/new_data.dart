import 'package:flutter/material.dart';
import 'package:stats_app/widgets/popup_form.dart';

import '../widgets/custom_bot_nav_bar.dart';

class NewData extends StatelessWidget {
  final Function func1;
  final Function func2;
  final Function func3;
  NewData(this.func1, this.func2, this.func3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats App'),
      ),
      bottomNavigationBar: CustomBotNavBar(func1, func2, func3),
      body: Center(
        child: Container(
          width: 50,
          height: 50,
          child: PopupForm(),
        ),
      ),
    );
  }
}
