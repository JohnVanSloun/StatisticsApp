import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/form_data.dart';
import '../models/data_point.dart';

class NewChart extends StatelessWidget {
  List<DataPoint> _buildDataPoints(data) {
    List<DataPoint> dataPoints = [];
    for (int i = 0; i < data.xValues.length; i++) {
      dataPoints.add(DataPoint(data.xValues[i], double.parse(data.yValues[i])));
    }
    return dataPoints;
  }

  final FormData data;

  NewChart(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chart'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            title: ChartTitle(text: data.title!),
            series: <LineSeries<DataPoint, String>>[
              LineSeries(
                  dataSource: <DataPoint>[..._buildDataPoints(data)],
                  xValueMapper: (DataPoint dataPoint, _) => dataPoint.x,
                  yValueMapper: (DataPoint dataPoint, _) => dataPoint.y),
            ],
          ),
        ),
      ),
    );
  }
}
