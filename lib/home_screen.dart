import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:nasa/earthGlow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<FlSpot>> chartData;
  late Future<List<FlSpot>> chartDataTwo;

  @override
  void initState() {
    super.initState();
    chartData = loadChartData();
    chartDataTwo = loadChartDataTwo();
  }

  Future<List<FlSpot>> loadChartData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final List<dynamic> data = json.decode(response);

    return List<FlSpot>.generate(data.length, (i) {
      final y = data[i]['value'].toDouble();
      return FlSpot(i.toDouble(), y);
    });
  }

  Future<List<FlSpot>> loadChartDataTwo() async {
    final String response = await rootBundle.loadString('assets/datatwo.json');
    final List<dynamic> data = json.decode(response);

    return List<FlSpot>.generate(data.length, (i) {
      final y = data[i]['value'].toDouble();
      return FlSpot(i.toDouble(), y);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'NASA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 13, 19, 55),
      ),
      body: Column(
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FutureBuilder(
                future: chartData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(color: Colors.cyanAccent);
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.red, fontSize: 3),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text(
                      'No data found',
                      style: TextStyle(color: Colors.white),
                    );
                  }
                  return _buildDataCard(
                    "Solar Power",
                    "545 time",
                    Colors.orange,
                    LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: snapshot.data!,
                            isCurved: true,
                            color: Colors.deepOrange,
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.orange.withOpacity(0.4),
                                  Colors.transparent,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              FutureBuilder(
                future: chartDataTwo,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(color: Colors.cyanAccent);
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text(
                      'No data found',
                      style: TextStyle(color: Colors.white),
                    );
                  }
                  return _buildDataCard(
                    "GeoMagnotic",
                    "3 kp",
                    const Color.fromARGB(255, 30, 139, 229),
                    LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: snapshot.data!,
                            isCurved: true,
                            color: const Color.fromARGB(255, 94, 163, 233),
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(
                              show: true,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.cyanAccent.withOpacity(0.4),
                                  Colors.transparent,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 24, 32, 77),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'RECOMMENIZATION',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    'LOW',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 30, 139, 229),
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),

          EarthGlowWidget(),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 24, 32, 77),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Avoid high frequency',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        'Setting config',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 20),
                      ),
                    ],
                  ),
                  Icon(Icons.navigate_next, color: Colors.blueGrey, size: 33),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildDataCard(
  String title,
  String value,
  Color color,
  LineChart chart,
) {
  return Container(
    width: 200,
    padding: EdgeInsets.only(top: 17, bottom: 12, right: 10, left: 10),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 24, 32, 77),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Text(title, style: TextStyle(color: Colors.white)),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(height: 50, width: double.infinity, child: chart),
      ],
    ),
  );
}
