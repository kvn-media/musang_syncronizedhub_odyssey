import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../models/dashboard/atgSummary_model.dart';
import '../../../models/dashboard/atg_model.dart';

class ATGDashboardData extends StatefulWidget {
  const ATGDashboardData({
    Key? key,
  }) : super(key: key);

  @override
  State<ATGDashboardData> createState() => _ATGDashboardDataState();
}

class _ATGDashboardDataState extends State<ATGDashboardData> {
  late List<ATGModel> _listData;
  late Timer timer;
  final List<Gradient> gradients = [
    LinearGradient(
      colors: [Color(0xFF4CC3D9), Color(0xFF357EA6)],
      stops: [0.0, 1.0],
    ),
  ];

  List<StackedBarSeries<ATGModel, String>> _detailedChartData = [];

  final List<StackedBarSeries<ATGSummary, String>> _summaryChartData = [];

  @override
  void initState() {
    super.initState();
    _listData = ATGModel.list;
    _initializeChartData();

    // Set up the timer
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      updateData();
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    timer.cancel();
    super.dispose();
  }

  void _initializeChartData() {
    try {
      // Create a summary instance
      ATGSummary summary = ATGSummary(_listData);
      _summaryChartData.add(
        StackedBarSeries<ATGSummary, String>(
          dataSource: [summary],
          xValueMapper: (ATGSummary data, _) => "Summary",
          yValueMapper: (ATGSummary data, _) => data.finalLevel,
          name: "Final Level",
        ),
      );
    } catch (error) {
      // _showErrorDialog(error);
    }

    // Initialize detailed chart data
    _updateChartData();
  }

  void _updateChartData() {
    // Update detailed chart data
    _detailedChartData = [
      StackedBarSeries<ATGModel, String>(
        dataSource: _listData,
        xValueMapper: (ATGModel data, _) => data.timestamp,
        yValueMapper: (ATGModel data, _) =>
            data.levelBarrel != null ? data.levelBarrel! : 0,
        name: 'Level Barrel',
      ),
      StackedBarSeries<ATGModel, String>(
        dataSource: _listData,
        xValueMapper: (ATGModel data, _) => data.timestamp,
        yValueMapper: (ATGModel data, _) =>
            data.volumeChangeBarrel != null ? data.volumeChangeBarrel! : 0,
        name: 'Volume Change Barrel',
      ),
      StackedBarSeries<ATGModel, String>(
        dataSource: _listData,
        xValueMapper: (ATGModel data, _) => data.timestamp,
        yValueMapper: (ATGModel data, _) =>
            data.avgTempCelcius != null ? data.avgTempCelcius! : 0,
        name: 'Average Temperature',
      ),
      StackedBarSeries<ATGModel, String>(
        dataSource: _listData,
        xValueMapper: (ATGModel data, _) => data.timestamp,
        yValueMapper: (ATGModel data, _) =>
            data.waterLevelMeter != null ? data.waterLevelMeter! : 0,
        name: 'Water Level Meter',
      ),
      StackedBarSeries<ATGModel, String>(
        dataSource: _listData,
        xValueMapper: (ATGModel data, _) => data.timestamp,
        yValueMapper: (ATGModel data, _) =>
            data.productTempCelcius != null ? data.productTempCelcius! : 0,
        name: 'Product Temperature',
      ),
    ];
  }

  void updateData() {
    setState(() {
      // Your logic for updating data
      // This could involve updating _listData or any other data-related operations
    });
    _updateChartData();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color chartContainerColor =
        (isDarkMode ? Colors.grey[800] : Colors.white) as Color;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 200,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: chartContainerColor,
              boxShadow: [
                BoxShadow(
                  color: isDarkMode
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SfCartesianChart(
              series: [..._detailedChartData, ..._summaryChartData],
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(
                  color: textColor,
                ),
                majorGridLines: MajorGridLines(
                  color: textColor, // Set color for light mode
                ),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: TextStyle(
                  color: textColor,
                ),
                majorGridLines: MajorGridLines(
                  color: textColor, // Set color for light mode
                ),
              ),
              enableAxisAnimation: true,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: chartContainerColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                dataTextStyle: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                columnSpacing: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDarkMode ? Colors.black : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                columns: [
                  DataColumn(
                    label: Text(
                      'Timestamp',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Alarm',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Level Barrel',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Volume Change Barrel',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Avg Temp Celcius',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Water Level Meter',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Product Temp Celcius',
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ],
                rows: _listData.map((item) {
                  return DataRow(
                    cells: [
                      DataCell(Text(item.timestamp)),
                      DataCell(Text(item.alarm)),
                      DataCell(Text(item.levelBarrel?.toString() ?? "")),
                      DataCell(Text(item.volumeChangeBarrel?.toString() ?? "")),
                      DataCell(Text(item.avgTempCelcius?.toString() ?? "")),
                      DataCell(Text(item.waterLevelMeter?.toString() ?? "")),
                      DataCell(Text(item.productTempCelcius?.toString() ?? "")),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}