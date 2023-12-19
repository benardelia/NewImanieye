import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/results_table.dart';

class Results extends StatefulWidget {
  const Results({super.key, required this.id, this.name, this.school});
  final String id;
  final String? name;
  final String? school;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  Color mainColor = Colors.green;
  List<String> semesters = ['first', 'second'];
  String selectedSemester = 'first';

  @override
  Widget build(BuildContext context) {
    var year = DateTime.now().year;
    return Scaffold(
      appBar: AppBar(
        title: Text('Matokeo'),
        backgroundColor: mainColor,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('results')
              .doc(widget.id)
              .collection('$year')
              .doc(selectedSemester)
              .get(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshots) {
            if (snapshots.connectionState == ConnectionState.done) {
              if (snapshots.data!.exists) {
                var data = snapshots.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          widget.name ?? '',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Shule: ${widget.school ?? ''}'.toUpperCase(),
                              style: TextStyle(fontSize: 18),
                            ),
                            DropdownButton(
                                items: semesters
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e == 'first'
                                              ? 'MUHULA 1'
                                              : 'MUHULA 2'),
                                          value: e,
                                        ))
                                    .toList(),
                                value: selectedSemester,
                                focusColor: Colors.grey,
                                underline: SizedBox.shrink(),
                                borderRadius: BorderRadius.circular(5),
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                onChanged: (value) {
                                  setState(() {
                                    selectedSemester = value.toString();
                                  });
                                }),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Darasa: ${data!['darasa'] ?? ''}'.toUpperCase()),
                          Text('Mkondo: ${data['mkondo'] ?? ''}'.toUpperCase()),
                        ],
                      ),
                      ResultsTable(
                        position: data['position'],
                        total: data['total'],
                        level: data['level'],
                        marks: data['level'] == 'secondary'
                            ? [
                                data['civics'] ?? '-',
                                data['history'] ?? '-',
                                data['geography'] ?? '-',
                                data['kiswahili'] ?? '-',
                                data['english'] ?? '-',
                                data['physics'] ?? '-',
                                data['chemistry'] ?? '-',
                                data['biology'] ?? '-',
                                data['bam'] ?? '-',
                                data['bookkeeping'] ?? '-',
                                data['commerce'] ?? '-',
                                data['literature'] ?? '-',
                              ]
                            : data['level'] == 'primary'
                                ? [
                                    data['maarifa'] ?? '-',
                                    data['uraia'] ?? '-',
                                    data['sayansi'] ?? '-',
                                    data['kiswahili'] ?? '-',
                                    data['english'] ?? '-',
                                    data['hesabu'] ?? '-',
                                    data['stadi'] ?? '-',
                                    data['ict'] ?? '-',
                                  ]
                                : [
                                    data['kusoma'] ?? '-',
                                    data['kuandika'] ?? '-',
                                    data['kuhesabu'] ?? '-'
                                  ],
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    children: [
                      DropdownButton(
                          items: semesters
                              .map((e) => DropdownMenuItem(
                                    child: Text(
                                        e == 'first' ? 'Muhula 1' : 'Muhula 2'),
                                    value: e,
                                  ))
                              .toList(),
                          value: selectedSemester,
                          focusColor: Colors.grey,
                          underline: SizedBox.shrink(),
                          borderRadius: BorderRadius.circular(5),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          onChanged: (value) {
                            setState(() {
                              selectedSemester = value.toString();
                            });
                          }),
                      Text('Hakuna taarifa za matokeo'),
                    ],
                  ),
                );
              }
            }
            if (snapshots.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: Text('Angalia internet yako kisha jaribu tena'),
            );
          }),
    );
  }
}
