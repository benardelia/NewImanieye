import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/main.dart';

class Members extends StatefulWidget {
  const Members({super.key, required this.superAdmin});
  final bool superAdmin;

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  Color mainColor = Colors.green;
  // check if data exist in a database and retrieve
  checkPrevious(String name) async {
    try {
      var studentdata =
          await FirebaseFirestore.instance.collection('users').doc(name).get();

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Muongozaji'),
        backgroundColor: mainColor,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').get(),
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
                documents = documents.reversed.toList();
                if (!Login.superAdmin) {
                  documents = documents
                      .where((element) => element['adminId'] == Login.userId)
                      .toList();
                }
                return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      String subtitle =
                         documents[index]['admin'] ? 'Admin' : 'Mzazi';

                      return ListTile(
                        title: Text('${documents[index]['name']}'),
                        subtitle: Text('Status: $subtitle'),
                        trailing: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child:
                                // button to delete data form the database
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            return AlertDialog(
                                              title: Text(
                                                  'Futa taarifa zote za mwanachamai?'),
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
                                                          .collection('users')
                                                          .doc(documents[index]
                                                              ['uid'])
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
                                    icon: Icon(Icons.delete_forever))),
                        onTap: () {
                          final List<TextEditingController> controller =
                              List.generate(
                                  4, (Index) => TextEditingController());
                          controller[0].text = documents[index]['name'] ?? '';
                          controller[1].text = documents[index]['area'] ?? '';
                          controller[2].text = documents[index]['phone'] ?? '';
                          controller[3].text =
                              documents[index]['studentids'][0] ?? '';

                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('Hariri Mwanachama'),
                                    content: SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextFormField(
                                              controller: controller[0],
                                              decoration: InputDecoration(
                                                labelText: 'Name',
                                              ),
                                            ),
                                            TextFormField(
                                              controller: controller[1],
                                              decoration: InputDecoration(
                                                labelText: 'Area',
                                              ),
                                            ),
                                            TextFormField(
                                              controller: controller[2],
                                              decoration: InputDecoration(
                                                labelText: 'Phone',
                                              ),
                                            ),
                                            TextFormField(
                                              controller: controller[3],
                                              decoration: InputDecoration(
                                                labelText: 'Student ID',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Sitisha')),
                                      TextButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(documents[index]['uid'])
                                                .update({
                                              'name': controller[0].text,
                                              'area': controller[1].text,
                                              'phone': controller[2].text,
                                              'studentids': [
                                                controller[3].text
                                              ],
                                            }).then((value) {
                                              Navigator.of(context).pop();
                                              setState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Ume hariri kikamilifu')));
                                            });
                                          },
                                          child: Text('Hariri'))
                                    ],
                                  ));
                        },
                      );
                    });
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
