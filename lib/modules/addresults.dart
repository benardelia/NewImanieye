import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/main.dart';
import 'package:imanieye_students/modules/resulteditor.dart';
import 'package:imanieye_students/modules/results.dart';

class ResultAdd extends StatefulWidget {
  const ResultAdd({super.key});

  @override
  State<ResultAdd> createState() => _ResultAddState();
}

class _ResultAddState extends State<ResultAdd> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle btnStyle = ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 78, 237, 117),
        fixedSize: Size(MediaQuery.of(context).size.width * 1 / 1.2, 20),
        foregroundColor: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: Text('Listi ya wanafunzi'),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('students').get(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs;

              if (!Login.superAdmin) {
                data = data
                    .where((element) =>
                        element['Taarifa za mwanafunzi']['adminId'] ==
                        Login.userId)
                    .toList();
              }

              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(data[index]['Taarifa za mwanafunzi']['name']),
                      subtitle:
                          Text(data[index]['Taarifa za mwanafunzi']['ID']),
                      trailing: Text(
                          data[index]['Taarifa za mwanafunzi']['shule'] ?? ''),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('Vipengele vya Mwanafunzi'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultEditor(
                                                          id: data[index][
                                                                  'Taarifa za mwanafunzi']
                                                              ['ID'],
                                                          name: data[index][
                                                                  'Taarifa za mwanafunzi']
                                                              ['name'],
                                                        )));
                                          },
                                          child: Text('Jaza Matokeo'),
                                          style: btnStyle,
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Results(
                                                          id: data[index][
                                                                  'Taarifa za mwanafunzi']
                                                              ['ID'],
                                                          name: data[index][
                                                                  'Taarifa za mwanafunzi']
                                                              ['name'],
                                                          school: data[index][
                                                                  'Taarifa za mwanafunzi']
                                                              ['shule'],
                                                        )));
                                          },
                                          child: Text('Tazama Matokeo'),
                                          style: btnStyle,
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                    );
                  });
            } else {
              return Center(
                child: Text('Hakuna taarifa iliyo patikana'),
              );
            }
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.green),
            );
          }
          return Center(child: Text('Angalia intaneti yako kisha jaribu tena'));
        },
      ),
    );
  }
}
