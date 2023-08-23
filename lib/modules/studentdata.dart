import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/graph.dart';
import 'package:imanieye_students/main.dart';
import 'package:imanieye_students/modules/maoni.dart';
import 'package:imanieye_students/modules/studentdashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentData extends StatelessWidget {
  StudentData({
    super.key, required this.studentIndex,
  });
  final int studentIndex;

  final TextEditingController maoni = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('TAARIFA YA MWANAFUNZI'),
          bottom: const TabBar(
              tabs: [Text('Takwimu'), Text('Grafu'), Text('Maoni')]),
        ),
        body:
             TabBarView(children: [StudentDashboard(studentIndex: studentIndex,), Graph(), Maoni()]),
        floatingActionButton: Login.isAdmin
            ? SizedBox.shrink()
            : FloatingActionButton.extended(
                backgroundColor: Color.fromARGB(255, 3, 41, 4),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            contentPadding: EdgeInsets.all(10.0),
                            titlePadding: EdgeInsets.all(10.0),
                            title: Text('Toa maoni'),
                            content: TextField(
                              controller: maoni,
                              decoration: InputDecoration(
                                  labelText: 'Maoni yako hapa...'),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Rudi')),
                              TextButton(
                                  onPressed: () async {
                                    try {
                                      final CollectionReference studentData =
                                          await FirebaseFirestore.instance
                                              .collection('students');
                                      DocumentReference student =
                                          await studentData
                                              .doc(Login.studentsIDs[0]);
                                      await student
                                          .update({'Maoni': maoni.text});
                                      
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(e.toString())));
                                    }

                                    Navigator.pop(context);
                                  },
                                  child: Text('Tuma'))
                            ],
                          ));
                },
                label: Text('Toa maoni')),
      ),
    );
  }
}
