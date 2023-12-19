import 'package:flutter/material.dart';
import 'package:imanieye_students/databasemanager.dart';

class KidsClassEditor extends StatefulWidget {
  const KidsClassEditor({super.key, required this.name, required this.id});
  final String name;
  final String id;

  @override
  State<KidsClassEditor> createState() => _KidsClassEditorState();
}

class _KidsClassEditorState extends State<KidsClassEditor> {
  final formKey = GlobalKey<FormState>();
  final kusoma = TextEditingController();
  final kuandika = TextEditingController();
  final kuhesabu = TextEditingController();
  final position = TextEditingController();
  final total = TextEditingController();

  List<String> semesters = ['first', 'second'];
  String selectedSemester = 'first';
  List<String> level = ['Darasa 1', 'Darasa 2'];
  String selectedLevel = 'Darasa 1';
  List<String> mkondo = ['A', 'B', 'C', 'D', 'E'];
  String selectedMkondo = 'A';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                widget.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              DropdownButton(
                  items: semesters
                      .map((e) => DropdownMenuItem(
                            child: Text(e == 'first' ? 'Muhula 1' : 'Muhula 2'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Darasa: '),
                  DropdownButton(
                      items: level
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      value: selectedLevel,
                      focusColor: Colors.grey,
                      underline: SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(5),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value.toString();
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Mkondo: '),
                  DropdownButton(
                      items: mkondo
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      value: selectedMkondo,
                      focusColor: Colors.grey,
                      underline: SizedBox.shrink(),
                      borderRadius: BorderRadius.circular(5),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      onChanged: (value) {
                        setState(() {
                          selectedMkondo = value.toString();
                        });
                      }),
                ],
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: kusoma,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Kusoma (Reading)'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: kuhesabu,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Kuhesabu (Arithmetic)'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: kuandika,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Kuandika (Writing)'),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Jaza hii nafasi';
                          } else if (int.parse(value) < 1) {
                            return 'Namba hii si sahihi';
                          }
                          return null;
                        },
                        controller: position,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Ameshika nafasi ya'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Jaza hii nafasi';
                          } else if (int.parse(value) < 1) {
                            return 'Namba hii si sahihi';
                          }
                          return null;
                        },
                        controller: total,
                        keyboardType: TextInputType.number,
                        decoration:
                            InputDecoration(labelText: 'Kati ya wanafunzi'),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        await DatabaseManager().editResultsforKidsClass(
                            id: widget.id,
                            kusoma: int.parse(kusoma.text),
                            kuandika: int.parse(kuandika.text),
                            semester: selectedSemester,
                            kuhesabu: int.parse(kuhesabu.text),
                            position: position.text,
                            totalStudents: total.text,
                            level: selectedLevel,
                            mkondo: selectedMkondo);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Taarifa imetumwa kikamilifu')));

                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Tatizo! jaza taarifa vizuri kisha angalia intaneti yako')));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.8, 20)),
                  child: Text('Tuma'))
            ],
          ),
        ),
      ),
    );
  }
}
