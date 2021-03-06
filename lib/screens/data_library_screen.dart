import 'package:flutter/material.dart';

import '../widgets/custom_bot_nav_bar.dart';
import '../widgets/new_chart.dart';
import '../models/form_data.dart';
import '../models/data_collection.dart';

class DataLibraryScreen extends StatelessWidget {
  final Function func1;
  final Function func2;
  final Function func3;
  DataLibraryScreen(this.func1, this.func2, this.func3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats App'),
      ),
      bottomNavigationBar: CustomBotNavBar(func1, func2, func3),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.bottom,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [Text('Data')],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.55,
              child: ListView(
                children: [
                  ...DataCollection.dataList.map(
                    (data) => ListTile(
                      leading: Icon(
                        Icons.pie_chart,
                      ),
                      title: Text("${data.title}"),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewChart(data),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
