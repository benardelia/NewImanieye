import 'package:flutter/material.dart';
import 'package:imanieye_students/databasemanager.dart';

class SecondaryEditor extends StatefulWidget {
  const SecondaryEditor({super.key, required this.name, required this.id});
  final String name;
  final String id;

  @override
  State<SecondaryEditor> createState() => _SecondaryEditorState();
}

class _SecondaryEditorState extends State<SecondaryEditor> {
  final formKey = GlobalKey<FormState>();
  final kiswahili = TextEditingController();
  final english = TextEditingController();
  final history = TextEditingController();
  final geography = TextEditingController();
  final civics = TextEditingController();
  final physics = TextEditingController();
  final chemistry = TextEditingController();
  final biology = TextEditingController();
  final bam = TextEditingController();
  final bookkeeping = TextEditingController();
  final commerce = TextEditingController();
  final literature = TextEditingController();
  final position = TextEditingController();
  final total = TextEditingController();

  List<String> semesters = ['first', 'second'];
  String selectedSemester = 'first';
  List<String> level = ['Kidato 1', 'Kidato 2', 'Kidato 3', 'Kidato 4'];
  String selectedLevel = 'Kidato 1';
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
                controller: civics,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Civics'),
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
                controller: geography,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Geography'),
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
                controller: history,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'History'),
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
                controller: english,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'English'),
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
                controller: kiswahili,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Kiswahili'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: physics,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Physics'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: chemistry,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Chemistry'),
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
                controller: biology,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Biology'),
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
                controller: bam,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Basic Mathematics'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: bookkeeping,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Book-Keeping'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: commerce,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Commerce'),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else if (int.parse(value) > 100 || int.parse(value) < 0) {
                    return 'Marks hii si sahihi';
                  }
                  return null;
                },
                controller: literature,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Literature'),
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
                        await DatabaseManager().editStudentResult(
                            level: selectedLevel,
                            mkondo: selectedMkondo,
                            id: widget.id,
                            position: position.text,
                            totalStudents: total.text,
                            kiswahili: int.parse(kiswahili.text),
                            english: int.parse(english.text),
                            history: int.parse(history.text),
                            geography: int.parse(geography.text),
                            biology: int.parse(biology.text),
                            bam: int.parse(bam.text),
                            physics: physics.text.isEmpty
                                ? null
                                : int.parse(physics.text),
                            chemistry: chemistry.text.isEmpty
                                ? null
                                : int.parse(chemistry.text),
                            civics: int.parse(civics.text),
                            bookkeeping: bookkeeping.text.isEmpty
                                ? null
                                : int.parse(bookkeeping.text),
                            commerce: commerce.text.isEmpty
                                ? null
                                : int.parse(commerce.text),
                            literature: literature.text.isEmpty
                                ? null
                                : int.parse(literature.text),
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
