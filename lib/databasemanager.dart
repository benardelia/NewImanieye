import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:imanieye_students/main.dart';
import 'package:imanieye_students/Authentication/registration.dart';

class DatabaseManager {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late Box box;

  Future fetchAllstudents(BuildContext context) async {
    List studentsList = [];
    try {
      await _firebaseFirestore
          .collection('students')
          .get()
          .then((dataSnapshot) {
        for (var element in dataSnapshot.docs) {
          studentsList.add(element.data());
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()), duration: const Duration(seconds: 10)));
    }
    return studentsList;
  }

  // Settings user profile
  userProfile(String? uid, String name, String phone, String area,
      List studentid, bool admin) async {
    await _firebaseFirestore.collection('users').doc(uid!).set({
      'name': name,
      'phone': phone,
      'uid': uid,
      'area': area,
      'studentids': studentid,
      'admin': admin,
      'adminId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  // create new student data with new ID in database during register parent
  // data parameter take students data as argument, such as name, age, religion...
  Future<void> addStudent(var data) async {
    CollectionReference students = _firebaseFirestore.collection('students');
    DocumentReference idsRef = _firebaseFirestore.collection('ids').doc('ids');
    int lastid;
    String studentId = 'Angalia internet yako';

    // method get last updated id value on firebase, then use it to creat new student id
    // by increment the last id
    try {
      await idsRef.get().then((value) async {
        lastid = value['lastId'] + 1;
        idsRef.set({'lastId': lastid});
        studentId = 'I${DateTime.now().year}${lastid}';
        data['ID'] = studentId;
        await students.doc(studentId).set({'Taarifa za mwanafunzi': data});
      });
      if (Registration.StudentID.text.isNotEmpty) {
        Registration.StudentID.text =
            Registration.StudentID.text + " " + studentId;
      } else {
        Registration.StudentID.text = studentId;
      }
    } catch (e) {
      // Registration.StudentID.text = 'Tatizo! Angalia intaneti yako';
    }
  }

// post student data on a firebase and clear the hivebox
  Future<void> studentInfo() async {
    CollectionReference students = _firebaseFirestore.collection('students');

    var data = <String, dynamic>{};
    box = await Hive.openBox('StudentData');
    for (int i = 0; i < box.keys.length; i++) {
      data[box.keyAt(i).toString()] = box.getAt(i);
    }

    try {
      await students.doc(Login.studentsIDs[0]).set(data);
      box.clear();
      box.close();
    } on FirebaseException catch (e) {
      e.toString();
    }
    return;
  }

  Future<void> storeTemporary(String key, var value) async {
    box = await Hive.openBox('StudentData');
    try {
      box.put(key, value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  editStudentResult(
      {required String id,
      required position,
      required totalStudents,
      required int kiswahili,
      required int english,
      required int history,
      required int geography,
      int? physics,
      required int biology,
      int? chemistry,
      required int bam,
      required semester,
      required int civics,
      required String level,
      required String mkondo,
      int? commerce,
      int? bookkeeping,
      int? literature}) async {
    var year = DateTime.now().year;
    await _firebaseFirestore
        .collection('results')
        .doc(id)
        .collection('$year')
        .doc(semester)
        .set({
      'kiswahili': kiswahili,
      'english': english,
      'history': history,
      'geography': geography,
      'physics': physics,
      'biology': biology,
      'bam': bam,
      'chemistry': chemistry,
      'civics': civics,
      'commerce': commerce,
      'bookkeeping': bookkeeping,
      'literature': literature,
      'position': position,
      'total': totalStudents,
      'darasa': level,
      'mkondo': mkondo,
      'level': 'secondary',
      'adminId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  editResultsforPrimary({
    required String id,
    required int kiswahili,
    required int english,
    required semester,
    required int hesabu,
    required int sayansi,
    required int maarifa,
    required int uraia,
    int? stadi,
    int? ict,
    required String level,
    required String mkondo,
    required position,
    required totalStudents,
  }) async {
    var year = DateTime.now().year;
    await _firebaseFirestore
        .collection('results')
        .doc(id)
        .collection('$year')
        .doc(semester)
        .set({
      'kiswahili': kiswahili,
      'english': english,
      'uraia': uraia,
      'maarifa': maarifa,
      'sayansi': sayansi,
      'hesabu': hesabu,
      'level': 'primary',
      'position': position,
      'total': totalStudents,
      'darasa': level,
      'mkondo': mkondo,
      'stadi': stadi,
      'ict': ict,
      'adminId': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  editResultsforKidsClass({
    required String id,
    required int kusoma,
    required int kuandika,
    required semester,
    required int kuhesabu,
    required position,
    required totalStudents,
    required String level,
    required String mkondo,
  }) async {
    var year = DateTime.now().year;
    await _firebaseFirestore
        .collection('results')
        .doc(id)
        .collection('$year')
        .doc(semester)
        .set({
      'kusoma': kusoma,
      'kuandika': kuandika,
      'kuhesabu': kuhesabu,
      'position': position,
      'total': totalStudents,
      'level': 'kids',
      'darasa': level,
      'mkondo': mkondo,
      'adminId': FirebaseAuth.instance.currentUser!.uid,
    });
  }
}
