import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/marks_calculator.dart';

class SecondaryResultTable extends StatelessWidget {
  const SecondaryResultTable({super.key, required this.marks});
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
            child: Text('CIVICS'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[0].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[0].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('HISTORY'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[1].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[1].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('GEOGRAPHY'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[2].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[2].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('KISWAHILI'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[3].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[3].toString())),
          ),
        ]),
        // ENGLISH
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ENGLISH'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[4].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[4].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('PHYSICS'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[5].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[5].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('CHEMISTRY'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[6].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[6].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('BIOLOGY'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[7].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[7].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('BASIC MATHEMATICS'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[8].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[8].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('BOOK-KEEPING'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[8].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[8].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('COMMERCE'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[9].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[9].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('LITERATURE'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[10].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(MarksCalculator.checkGrade(marks[10].toString())),
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
