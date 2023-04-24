import 'package:flutter/material.dart';
import 'package:imanieye_students/graph.dart';
import 'package:imanieye_students/studentdashboard.dart';

class Maoni extends StatelessWidget {
  const Maoni({super.key});
  final List<String> Months = const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  @override
  Widget build(BuildContext context) {
    try {
      List<String> comment = [];
      List<double> jumla = Graph().jumlaKuu(StudentDashboard.data);

      for (int i = 0; i < jumla.length; i++) {
        // check the value of total and assingn comment respective
        if (jumla[i] > 80) {
          comment.add('ANAFANYA VIZURI, AONGEZE BIDII ZAID');
        } else if (jumla[i] > 60) {
          comment.add('AMEJITAHIDI, AZIDI KUONGEZA BIDII');
        } else if (jumla[i] > 40) {
          comment.add('WASTANI, ATILIE MKAZO ZAIDI');
        } else {
          comment.add('SI YA KURIDHISHA , BADO ANAHITAJI BIDII ZAIDI');
        }
      }

      return ListView.builder(
          itemCount: 12,
          itemBuilder: ((context, index) {
            return Padding(
                padding: const EdgeInsets.all(1.0),
                child: jumla[index].toInt() > 0
                    ? ListTile(
                        tileColor: Color.fromARGB(255, 85, 212, 130),
                        minVerticalPadding: 10,
                        dense: true,
                        title: Text(comment[index]),
                        subtitle: Text(Months[index]),
                        leading: Text('Alama \n${jumla[index].toInt()}'),
                      )
                    : SizedBox.shrink());
          }));
    } catch (e) {
      return Center(child: Text('Something went wrong'));
    }
  }
}
