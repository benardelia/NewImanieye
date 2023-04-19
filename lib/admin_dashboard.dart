import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/databasemanager.dart';
import 'package:imanieye_students/main.dart';
import 'package:imanieye_students/studentdata.dart';
import 'package:imanieye_students/tables.dart';

class AdminDashBoard extends StatefulWidget {
  AdminDashBoard({key}) : super(key: key);

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  Color mainColor = Colors.green;

  // check if data exist in a database and retrieve
  checkPrevious(String name) async {
    try {
      var studentdata = await FirebaseFirestore.instance
          .collection('students')
          .doc(name)
          .get();

      if (studentdata.exists) {
        return studentdata;
      } else {
        null;
      }
    } catch (e) {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle btnStyle = ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Color.fromARGB(255, 78, 237, 117)),
        fixedSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width * 1 / 1.2, 20)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Muongozaji'),
        backgroundColor: mainColor,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('students').get(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: mainColor),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List documents = snapshot.data!.docs;
                if (!Login.superAdmin) {
                  documents = documents
                      .where((element) =>
                          element['Taarifa za mwanafunzi']['adminId'] ==
                          Login.userId)
                      .toList();
                }
                documents = documents.reversed.toList();
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(
                              '${documents[index]['Taarifa za mwanafunzi']['name']}'),
                          subtitle: Text(
                              'ID: ${documents[index]['Taarifa za mwanafunzi']['ID']}'),
                          trailing: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Text(
                                    'Umri: ${documents[index]['Taarifa za mwanafunzi']['umri']}'),
                                // button to delete data form the database
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Futa taarifa zote za mwanafunzi?'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('sitisha')),
                                                TextButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection(
                                                              'students')
                                                          .doc(documents[index][
                                                                  'Taarifa za mwanafunzi']
                                                              ['ID'])
                                                          .delete()
                                                          .then((value) {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {});
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: Text(
                                                                    'ufutaji umekamilika')));
                                                      });
                                                    },
                                                    child: Text('ndiyo'))
                                              ],
                                            );
                                          }));
                                    },
                                    icon: Icon(Icons.delete_forever))
                              ],
                            ),
                          ),
                          onTap: () {
                            Login.studentsIDs = [
                              documents[index]['Taarifa za mwanafunzi']['ID']
                            ];
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('Vipengele vya Mwanafunzi'),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            TextButton(
                                              onPressed: () async {
                                                var personInfo = {
                                                  'ID': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['ID'],
                                                  'name': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['name'],
                                                  'umri': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['umri'],
                                                  'dini': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['dini'],
                                                  'shule': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['shule'],
                                                  'tahmini': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['tahmini'],
                                                  'tarehe': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['tarehe'],
                                                  'tareheYaMwisho':
                                                      '${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}',
                                                  'aliepitia': documents[index][
                                                          'Taarifa za mwanafunzi']
                                                      ['aliepitia']
                                                };

                                                DocumentSnapshot<
                                                    Map<String, dynamic>>? data;
                                                try {
                                                  data = await checkPrevious(
                                                      documents[index][
                                                              'Taarifa za mwanafunzi']
                                                          ['ID']);
                                                  DatabaseManager()
                                                      .storeTemporary(
                                                          'Taarifa za mwanafunzi',
                                                          personInfo);
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Tables(
                                                                studentData:
                                                                    data,
                                                              )));
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Error: ${e.toString()}')));
                                                }
                                              },
                                              child: Text('Jaza Maendeleo'),
                                              style: btnStyle,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StudentData()));
                                              },
                                              child: Text('Tazama Maendeleo'),
                                              style: btnStyle,
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                        ));
              } else {
                return Center(
                  child: Text('No data Found'),
                );
              }
            }

            if (snapshot.connectionState == ConnectionState.none) {
              return Center(child: Text('Connection Error'));
            }

            return Center(
              child: Text('An error occured'),
            );
          }),
    );
  }
}
