import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionFlutterChartExample extends StatefulWidget {
  const SyncfusionFlutterChartExample({Key? key}) : super(key: key);

  @override
  State<SyncfusionFlutterChartExample> createState() =>
      _SyncfusionFlutterChartExampleState();
}

class _SyncfusionFlutterChartExampleState
    extends State<SyncfusionFlutterChartExample> {
  final List<SalesData> chartDate = [
    SalesData(2010, 35, Colors.red),
    SalesData(2011, 28, Colors.blue),
    SalesData(2012, 34, Colors.green),
    SalesData(2013, 32, Colors.deepOrange),
    SalesData(2014, 40, Colors.yellow)
  ];
  final List<PieData> pieData = [
    PieData('Akshit', 90000, Colors.red),
    PieData('Aasif', 80000, Colors.yellow),
    PieData('Karan', 120000, Colors.grey)
  ];
  List<StackedAreaSeries<ChartData, String>> _getStackedAreaSeries() {
    final List<ChartData> data1 = [
      ChartData(x: '29 Mar 2023 15:24', y: 90),
      ChartData(x: '29 Mar 2023 15:33', y: 80),
      ChartData(x: '29 Mar 2023 15:35', y: 95),
      ChartData(x: '29 Mar 2023 16:4', y: 145),
    ];

    final List<ChartData> data2 = [
      ChartData(x: '29 Mar 2023 15:24', y: 90),
      ChartData(x: '29 Mar 2023 15:33', y: 70),
      ChartData(x: '29 Mar 2023 15:35', y: 85),
      ChartData(x: '29 Mar 2023 16:4', y: 90),
    ];

    final List<ChartData> data3 = [
      ChartData(x: '29 Mar 2023 15:24', y: 70),
      ChartData(x: '29 Mar 2023 15:33', y: 80),
      ChartData(x: '29 Mar 2023 15:35', y: 80),
      ChartData(x: '29 Mar 2023 16:4', y: 99),
    ];

    return <StackedAreaSeries<ChartData, String>>[
      StackedAreaSeries<ChartData, String>(
        dataSource: data1,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        name: 'Series 1',
      ),
      StackedAreaSeries<ChartData, String>(
        dataSource: data2,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        name: 'Series 2',
      ),
      StackedAreaSeries<ChartData, String>(
        dataSource: data3,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        name: 'Series 3',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Syncfusion_Flutter_Chart")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              child:SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: _getStackedAreaSeries(),
              )
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              child: SfCartesianChart(
                backgroundColor: Colors.grey.shade200,
                title: ChartTitle(text: "CartesianChart"),
                series: [
                  AreaSeries<SalesData, int>(
                      color: Colors.red,
                      dataSource: chartDate,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) => sales.color),
                  AreaSeries<SalesData, int>(
                      color: Colors.red,
                      dataSource: chartDate,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) => sales.color),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.all(20),
                child: SfCircularChart(
                    legend: const Legend(isVisible: true),
                    title: ChartTitle(text: 'Radial Chart'),
                    backgroundColor: Colors.grey.shade200,
                    series: <CircularSeries>[
                      RadialBarSeries<PieData, String>(
                          trackColor: Colors.grey.shade800,
                          dataSource: pieData,
                          gap: '3%',
                          xValueMapper: (PieData data, _) => data.xData,
                          yValueMapper: (PieData data, _) => data.yData,
                          pointColorMapper: (PieData data, _) => data.color,
                          cornerStyle: CornerStyle.bothCurve,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                          radius: '70%',
                          innerRadius: '30%'),
                    ])),
            Container(
                margin: const EdgeInsets.all(20),
                child: SfCircularChart(
                    title: ChartTitle(text: 'Doughnut Chart'),
                    backgroundColor: Colors.grey.shade200,
                    legend: const Legend(isVisible: true),
                    series: <CircularSeries>[
                      DoughnutSeries<PieData, String>(
                        dataSource: pieData,
                        xValueMapper: (PieData data, _) => data.xData,
                        yValueMapper: (PieData data, _) => data.yData,
                        pointColorMapper: (PieData data, _) => data.color,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      ),
                    ])),
            Container(
              margin: const EdgeInsets.all(20),
              child: SfCircularChart(
                  backgroundColor: Colors.grey.shade200,
                  palette: const [Colors.red, Colors.green, Colors.blue],
                  title: ChartTitle(text: 'Circular Chart'),
                  legend: const Legend(isVisible: true),
                  series: <PieSeries<PieData, String>>[
                    PieSeries<PieData, String>(
                        explode: true,
                        explodeIndex: 0,
                        dataSource: pieData,
                        radius: '100',
                        strokeWidth: 1.5,
                        strokeColor: Colors.black,
                        xValueMapper: (PieData data, _) => data.xData,
                        yValueMapper: (PieData data, _) => data.yData,
                        dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 16))),
                  ]),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              child: SfCartesianChart(
                // legend: const Legend(isVisible: true),
                backgroundColor: Colors.grey.shade200,
                title: ChartTitle(text: "CartesianChart"),
                series: [
                  LineSeries<SalesData, int>(
                      dataSource: chartDate,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) => sales.color),
                ],
              ),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              child: SfCartesianChart(
                backgroundColor: Colors.grey.shade200,
                title: ChartTitle(text: "CartesianChart"),
                series: [
                  BarSeries<SalesData, int>(
                      dataSource: chartDate,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) => sales.color),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 300,
              child: SfCartesianChart(
                backgroundColor: Colors.grey.shade200,
                title: ChartTitle(text: "CartesianChart"),
                series: [
                  SplineSeries<SalesData, int>(
                      dataSource: chartDate,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) => sales.color),
                ],
              ),
            ),

            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              child: SfCartesianChart(
                backgroundColor: Colors.grey.shade200,
                title: ChartTitle(text: "CartesianChart"),
                series: [
                  ColumnSeries<SalesData, int>(
                      color: Colors.red,
                      dataSource: chartDate,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) => sales.color),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 300,
              child: SfCartesianChart(
                backgroundColor: Colors.grey.shade200,
                title: ChartTitle(text: "CartesianChart"),
                series: [
                  WaterfallSeries<SalesData, int>(
                      color: Colors.red,
                      dataSource: chartDate,
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      pointColorMapper: (SalesData sales, _) => sales.color),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  final int year;
  final double sales;
  final Color color;

  SalesData(this.year, this.sales, this.color);
}

class PieData {
  PieData(this.xData, this.yData, this.color);

  final Color color;

  final String xData;
  final num yData;
}
class ChartData {
  final String x;
  final double y;

  ChartData({required this.x, required this.y});
}