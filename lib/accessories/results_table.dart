import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/kidsclass_results_table.dart';
import 'package:imanieye_students/accessories/primary_result_table.dart';
import 'package:imanieye_students/accessories/secondary_result_table.dart';

class ResultsTable extends StatelessWidget {
  const ResultsTable(
      {super.key,
      required this.marks,
      required this.level,
      required this.position,
      required this.total});
  final List marks;
  final String level;
  final String position;
  final String total;

  catculateDivision() {
    int point = 0;
    List<int> pointsList = [];
    String division;

    if (level == 'secondary') {
      for (var i in marks) {
        try {
          if (i >= 75) {
            pointsList.add(1);
          } else if (i >= 65) {
            pointsList.add(2);
          } else if (i >= 45) {
            pointsList.add(3);
          } else if (i >= 30) {
            pointsList.add(4);
          } else {
            pointsList.add(5);
          }
        } catch (e) {}
      }

// sort points from most passed subjects to less passed subjects to get most seven scored subjects
      pointsList.sort();

      // sum first seven points of most passed subjects
      for (int i = 0; i < 7; i++) {
        point += pointsList[i];
      }

      // determine division
      if (point < 18) {
        division = '1';
      } else if (point < 22) {
        division = '2';
      } else if (point < 26) {
        division = '3';
      } else {
        division = '4';
      }
      return [point, division];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: level == 'secondary'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Division: ${catculateDivision()[1]}'),
                    Text('Points: ${catculateDivision()[0]}'),
                  ],
                )
              : SizedBox.shrink(),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Ameshika nafasi ya : $position'),
                Text('Kati ya wanafunzi: $total'),
              ],
            )),
        level == 'secondary'
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SecondaryResultTable(marks: marks),
              )
            : level == 'primary'
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryResultTable(marks: marks),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: KidsClassTable(marks: marks),
                  )
      ],
    );
  }
}
