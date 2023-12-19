import 'package:flutter/material.dart';
import 'package:imanieye_students/databasemanager.dart';

class PrimaryEditor extends StatefulWidget {
  const PrimaryEditor({super.key, required this.name, required this.id});
  final String name;
  final String id;

  @override
  State<PrimaryEditor> createState() => _PrimaryEditorState();
}

class _PrimaryEditorState extends State<PrimaryEditor> {
  final formKey = GlobalKey<FormState>();
  final kiswahili = TextEditingController();
  final english = TextEditingController();
  final sayansi = TextEditingController();
  final hesabu = TextEditingController();
  final uraia = TextEditingController();
  final maarifa = TextEditingController();
  final ict = TextEditingController();
  final stadi = TextEditingController();
  final position = TextEditingController();
  final total = TextEditingController();

  List<String> semesters = ['first', 'second'];
  String selectedSemester = 'first';
  List<String> level = [
    'Darasa 3',
    'Darasa 4',
    'Darasa 5',
    'Darasa 6',
    'Darasa 7'
  ];
  String selectedLevel = 'Darasa 3';
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
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: uraia,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Uraia (Civics)'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: hesabu,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(labelText: 'Hisabati (Mathematics)'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: maarifa,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Maarifa ya Jamii (Social Studies)'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: english,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'English'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: kiswahili,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Kiswahili'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: sayansi,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Sayansi (Science)'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jaza hii nafasi';
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: stadi,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Stadi za kazi (vocational skills)'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else if (int.parse(value) > 50 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: ict,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'TEHAMA (ICT)'),
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
                        await DatabaseManager().editResultsforPrimary(
                            id: widget.id,
                            ict: ict.text.isEmpty
                                ? null
                                : int.parse(ict.text),
                            stadi: int.parse(stadi.text),
                            position: position.text,
                            totalStudents: total.text,
                            kiswahili: int.parse(kiswahili.text),
                            english: int.parse(english.text),
                            sayansi: int.parse(sayansi.text),
                            uraia: int.parse(uraia.text),
                            maarifa: int.parse(maarifa.text),
                            hesabu: int.parse(hesabu.text),
                            level: selectedLevel,
                            mkondo: selectedMkondo,
                            semester: selectedSemester);

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
