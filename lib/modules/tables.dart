import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/Categories/kiakili.dart';
import 'package:imanieye_students/Categories/kijamii.dart';
import 'package:imanieye_students/Categories/kimwili.dart';
import 'package:imanieye_students/Categories/tabia.dart';

class Tables extends StatelessWidget {
  Tables({Key? key, this.studentData}) : super(key: key);
  final DocumentSnapshot<Map<String, dynamic>>? studentData;
  static var student;
  

  @override
  Widget build(BuildContext context) {
   
    //  student data can be null its better to look if its null or not before use it,
    // use it only when data is not null to prevent possible errors.
    student = studentData != null ? studentData!.data() : null;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MAENDELEO'),
          backgroundColor: Colors.green,
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Kitabia',
            ),
            Tab(
              text: 'Kiakili',
            ),
            Tab(
              text: 'Kimwili',
            ),
            Tab(
              text: 'Kijamii',
            )
          ]),
        ),
        body: const TabBarView(children: [
          Tabia(),
          Kiakili(),
          Kimwili(),
          Kijamii(),
        ]),
      ),
    );
  }
}
