import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/main.dart';
import 'package:imanieye_students/modules/studentdashboard.dart';

class Graph extends StatefulWidget {
  const Graph({
    super.key,
  });

  List<double> jumlaKuu(data) {
    List<double> values = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    ];
    for (int i = 0; i < 12; i++) {
      values[i] =
          double.parse(data['kijamii']['MAENDELEO YA KIJAMII, JUMLA'][i]) +
              double.parse(data['kimwili']['MAENDELEO YA KIMWILI, JUMLA'][i]) +
              double.parse(data['Kitabia']['MAENDELEO YA TABIA, JUMLA'][i]) +
              double.parse(data['Kiakili']['MAENDELEO YA KIAKILI, JUMLA'][i]);
    }
    return values;
  }

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  String jina = Login.studentsIDs[0];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: StudentDashboard.students,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshots) {
          if (snapshots.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.black45,
            );
          }

          if (snapshots.connectionState == ConnectionState.done) {
            if (snapshots.hasData) {
              try {
                Map<String, dynamic> data =
                    snapshots.data!.data() as Map<String, dynamic>;
                List<double> graphValues = widget.jumlaKuu(data);

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: LineChart(LineChartData(
                      minX: 0,
                      minY: 0,
                      maxX: 11,
                      maxY: 100,
                      titlesData: FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(
                              axisNameWidget: const Text(
                                'ALAMA',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20),
                              ),
                              axisNameSize: 20,
                              sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 10,
                                  reservedSize: 35)),
                          rightTitles: AxisTitles(axisNameSize: 0),
                          topTitles: AxisTitles(
                              axisNameWidget: const Text(
                                  '       GRAFU YA MAENDELEO YA MWANAFUNZI'),
                              axisNameSize: 30),
                          bottomTitles: AxisTitles(
                              axisNameWidget: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'MIEZI',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    height: 2,
                                  ),
                                  const Text(
                                    'UFUNGUO',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.green,
                                      ),
                                      const Text('NZURI SANA')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.greenAccent,
                                      ),
                                      const Text('NZURI            ')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.redAccent,
                                      ),
                                      const Text('WASTANI      ')
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.red,
                                      ),
                                      const Text('HAFIFU          ')
                                    ],
                                  )
                                ],
                              ),
                              axisNameSize: 120,
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 1,
                                getTitlesWidget: (month, name) {
                                  switch (month.toInt()) {
                                    case 0:
                                      return const Text('J');
                                    case 1:
                                      return const Text('F');

                                    case 2:
                                      return const Text('M');

                                    case 3:
                                      return const Text('A');

                                    case 4:
                                      return const Text('M');

                                    case 5:
                                      return const Text('J');

                                    case 6:
                                      return const Text('J');

                                    case 7:
                                      return const Text('A');

                                    case 8:
                                      return const Text('S');

                                    case 9:
                                      return const Text('O');

                                    case 10:
                                      return const Text('N');

                                    case 11:
                                      return const Text('D');
                                  }
                                  return const Text('');
                                },
                              ))),
                      rangeAnnotations:
                          RangeAnnotations(horizontalRangeAnnotations: [
                        HorizontalRangeAnnotation(
                            y1: 0,
                            y2: 40,
                            color: const Color.fromARGB(255, 243, 31, 16)),
                        HorizontalRangeAnnotation(
                            y1: 40,
                            y2: 60,
                            color: const Color.fromARGB(255, 216, 104, 102)),
                        HorizontalRangeAnnotation(
                            y1: 60, y2: 80, color: Colors.greenAccent),
                        HorizontalRangeAnnotation(
                            y1: 80, y2: 100, color: Colors.green)
                      ]),
                      borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.white, width: 2)),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, graphValues[0]),
                            FlSpot(1, graphValues[1]),
                            FlSpot(2, graphValues[2]),
                            FlSpot(3, graphValues[3]),
                            FlSpot(4, graphValues[4]),
                            FlSpot(5, graphValues[5]),
                            FlSpot(6, graphValues[6]),
                            FlSpot(7, graphValues[7]),
                            FlSpot(8, graphValues[8]),
                            FlSpot(9, graphValues[9]),
                            FlSpot(10, graphValues[10]),
                            FlSpot(11, graphValues[11]),
                          ],
                          lineChartStepData:
                              LineChartStepData(stepDirection: 10),
                          isCurved: true,
                        )
                      ])),
                );
              } catch (e) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Text(
                      'An error occur Make sure you enter correct name And try Again'),
                );
              }
            }
          }

          return const Text('An Error occur');
        });
  }
}
