import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/marks_calculator.dart';

class PrimaryResultTable extends StatelessWidget {
  const PrimaryResultTable({super.key, required this.marks});
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
            child: Text('MAARIFA YA JAMII(SOCIAL STUDIES)'),
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
            child: Text('URAIA NA MAADILI (CIVICS AND MORAL)'),
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
            child: Text('SAYANSI (SCIENCE)'),
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
            child: Text('KISWAHILI'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[3].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[3].toString())),
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
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[4].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('HESABU (MATHEMATICS)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[5].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[5].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('STADI ZA KAZI (VOCATIONAL SKILLS)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[6].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[6].toString())),
          ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('TEHAMA (ICT)'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(marks[7].toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(MarksCalculator.checkGradeForPrimary(marks[7].toString())),
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
