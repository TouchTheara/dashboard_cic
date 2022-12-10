import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  double _valueStatic = 10;

  List<_SalesData> data = [
    _SalesData('Click 1', 0),
    _SalesData('Click 2', 10),
  ];
  _increaseValue({String month = '', double value = 0.0}) {
    double click = _valueStatic - 8;
    data.add(_SalesData("$month$click", value));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.5,
      child: Column(
        children: [
          SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                SplineAreaSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                    name: 'Sales',
                    // Enable data label
                    dataLabelSettings:
                        const DataLabelSettings(isVisible: true)),
              ]),
          Container(
              height: 100,
              padding: const EdgeInsets.all(8.0),
              //Initialize the spark charts widget
              child: ElevatedButton(
                child: const Text('Increase'),
                onPressed: () {
                  _valueStatic = _valueStatic + 1;
                  _increaseValue(month: 'Click', value: _valueStatic);
                  setState(() {});
                },
              ))
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
