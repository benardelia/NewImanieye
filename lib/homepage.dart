import 'package:flutter/material.dart';
import 'package:imanieye_students/databasemanager.dart';
import 'package:imanieye_students/main.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

TextEditingController _umri = TextEditingController();
TextEditingController _jina = TextEditingController();
TextEditingController _dini = TextEditingController();
TextEditingController _tathmini = TextEditingController();
TextEditingController _tarTathmini = TextEditingController();
TextEditingController _tarTathminiYaMwisho = TextEditingController();
TextEditingController _aliepitia = TextEditingController();
TextEditingController _school = TextEditingController();

final key = GlobalKey<FormState>();

class _HomepageState extends State<Homepage> {
  Color mainColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    _aliepitia.text = Login.userName;
    // make the first evaluation date as now
    _tarTathmini.text =
        '${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}';
    _tarTathminiYaMwisho.text = _tarTathmini.text;
    Login.studentsIDs = [null];
    return SingleChildScrollView(
      child: Column(
        children: [
          // const Text('FOMU YA TATHMINI YA MWANAFUNZI'),
          Form(
              key: key,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _jina,
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Jina La Mwanafunzi'),
                    ),
                    TextFormField(
                      controller: _umri,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Umri wa mwanafunzi'),
                    ),
                    TextFormField(
                      controller: _dini,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: 'Dini'),
                    ),
                    TextFormField(
                      controller: _school,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Shule',
                      ),
                    ),
                    TextFormField(
                      controller: _tathmini,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Tathmini wakati wa kusajiliwa',
                      ),
                    ),
                    TextFormField(
                      controller: _tarTathmini,
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Tarehe ya tathmini wakati wa kusajiliwa'),
                    ),
                    TextFormField(
                      controller: _tarTathminiYaMwisho,
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Tarehe ya tathmini ya mwisho'),
                    ),
                    TextFormField(
                      controller: _aliepitia,
                      readOnly: true,
                      keyboardType: TextInputType.name,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Tafadhali jaza nafasi hii';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(hintText: 'Imepitiwa Na:'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (key.currentState!.validate()) {
                          var personInfo = {
                            'name': _jina.text.toUpperCase().trim(),
                            'umri': _umri.text,
                            'dini': _dini.text,
                            'shule': _school.text,
                            'tahmini': _tathmini.text,
                            'tarehe': _tarTathmini.text,
                            'tareheYaMwisho': _tarTathminiYaMwisho.text,
                            'aliepitia': _aliepitia.text,
                            'adminId': Login.userId,
                          };

                          try {
                            await DatabaseManager().addStudent(personInfo);
                            
                            

                            Navigator.of(context).pop();
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('ERROR'),
                                      content: Text(e.toString()),
                                    ));
                          }
                        }
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(Size.fromWidth(
                              MediaQuery.of(context).size.width / 1.25)),
                          backgroundColor:
                              MaterialStateProperty.all(mainColor)),
                      child: const Text('Tuma'),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
