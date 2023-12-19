import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/marks_calculator.dart';

class KidsClassTable extends StatelessWidget {
  const KidsClassTable({super.key, required this.marks});
  final List marks;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
          top: BorderSide(),
          bottom: BorderSide(),
          right: BorderSide(),
          left: BorderSide(),
          horizontalInside: BorderSide(),
          verticalInside: BorderSide(),
          borderRadius: BorderRadius.circular(10)),
      children: [
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Somo'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Alama'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Daraja'),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('KUSOMA (READING)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[0].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[0].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('KUANDIKA (WRITTING)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[1].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[1].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('KUHESABU (ARITHMETIC)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[2].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[2].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('WASTANI'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.calculateAverage(marks).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(''),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('JUMLA'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.totalMarsk(marks).toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(''),
          ),
        ]),
      ],
    );
  }
}
