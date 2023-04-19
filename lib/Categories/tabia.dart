import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/fields.dart';
import 'package:imanieye_students/accessories/fieldswithheads.dart';
import 'package:imanieye_students/databasemanager.dart';
import '../tables.dart';
import 'dart:core';

class Tabia extends StatefulWidget {
  const Tabia({
    Key? key,
  }) : super(key: key);

  @override
  State<Tabia> createState() => _TabiaState();
}

assignPrevValues() {
  if (Tables.student != null) {
    Map<String, Map<String, dynamic>> map =
        Map<String, Map<String, dynamic>>.from(Tables.student);

    getValues(Map<String, Map<String, dynamic>> map) {
      List tabiaValues = [];
      // assign keys to the keys variable

      List keys = [
        'Bidii ya Maarifa',
        'Ubora wa kazi',
        'Utunzaji wa vifaa',
        'Ushirikiano',
        'Heshima',
        'Utii na kujituma',
        'Uaminifu',
        'Uongozi',
        'Utamaduni',
        'Utafiti na ubunifu',
        'Anahudhuria kanisani/msikitini',
        'MAENDELEO YA TABIA, JUMLA'
      ];
      // get an inner values and add to the list
      if (map['Kitabia'] != null) {
        for (var key in keys) {
          tabiaValues.add(map['Kitabia']![key]);
        }

        for (int i = 0; i < tabiaValues.length - 1; i++) {
          jan[i]!.text = tabiaValues[i][0];
          feb[i]!.text = tabiaValues[i][1];
          mar[i]!.text = tabiaValues[i][2];
          apr[i]!.text = tabiaValues[i][3];
          may[i]!.text = tabiaValues[i][4];
          june[i]!.text = tabiaValues[i][5];
          july[i]!.text = tabiaValues[i][6];
          august[i]!.text = tabiaValues[i][7];
          september[i]!.text = tabiaValues[i][8];
          october[i]!.text = tabiaValues[i][9];
          november[i]!.text = tabiaValues[i][10];
          december[i]!.text = tabiaValues[i][11];
        }
      } else {
        for (int i = 0; i < jan.length; i++) {
          jan[i]!.clear();
          feb[i]!.clear();
          jan[i]!.clear();
          feb[i]!.clear();
          mar[i]!.clear();
          apr[i]!.clear();
          may[i]!.clear();
          june[i]!.clear();
          july[i]!.clear();
          august[i]!.clear();
          september[i]!.clear();
          october[i]!.clear();
          november[i]!.clear();
          december[i]!.clear();
        }
      }
    }

    getValues(map);
  } else {
    for (int i = 0; i < jan.length; i++) {
      jan[i]!.clear();
      feb[i]!.clear();
      jan[i]!.clear();
      feb[i]!.clear();
      mar[i]!.clear();
      apr[i]!.clear();
      may[i]!.clear();
      june[i]!.clear();
      july[i]!.clear();
      august[i]!.clear();
      september[i]!.clear();
      october[i]!.clear();
      november[i]!.clear();
      december[i]!.clear();
    }
  }
}

// code to generate 11 january controller
List<TextEditingController?> jan =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> feb =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> mar =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> apr =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> may =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> june =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> july =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> august =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> september =
    List.generate(11, (index) => TextEditingController());
// code to generate 11 january controller
List<TextEditingController?> october =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> november =
    List.generate(11, (index) => TextEditingController());

// code to generate 11 january controller
List<TextEditingController?> december =
    List.generate(11, (index) => TextEditingController());

// code to generate sum controller of first cotecory MAENDELEO YA TABIA jan to december
List<TextEditingController?> tabiaCategorySum =
    List.generate(12, (index) => TextEditingController());

void sumFirstCategory() {
  int januarySum = 0;
  int februarySum = 0;
  int marchSum = 0;
  int aprilSum = 0;
  int maySum = 0;
  int juneSum = 0;
  int julySum = 0;
  int augustSum = 0;
  int septemberSum = 0;
  int octoberSum = 0;
  int novemberSum = 0;
  int decemberSum = 0;
  for (int i = 0; i <= 10; i++) {
    jan[i]!.text.isNotEmpty ? januarySum += int.parse(jan[i]!.text) : null;
  }
  tabiaCategorySum[0]!.text = januarySum.toString();
  for (int i = 0; i <= 10; i++) {
    feb[i]!.text.isNotEmpty ? februarySum += int.parse(feb[i]!.text) : null;
  }
  tabiaCategorySum[1]!.text = februarySum.toString();
  for (int i = 0; i <= 10; i++) {
    mar[i]!.text.isNotEmpty ? marchSum += int.parse(mar[i]!.text) : null;
  }
  tabiaCategorySum[2]!.text = marchSum.toString();
  for (int i = 0; i <= 10; i++) {
    apr[i]!.text.isNotEmpty ? aprilSum += int.parse(apr[i]!.text) : null;
  }
  tabiaCategorySum[3]!.text = aprilSum.toString();
  for (int i = 0; i <= 10; i++) {
    may[i]!.text.isNotEmpty ? maySum += int.parse(may[i]!.text) : null;
  }
  tabiaCategorySum[4]!.text = maySum.toString();
  for (int i = 0; i <= 10; i++) {
    june[i]!.text.isNotEmpty ? juneSum += int.parse(june[i]!.text) : null;
  }
  tabiaCategorySum[5]!.text = juneSum.toString();
  for (int i = 0; i <= 10; i++) {
    july[i]!.text.isNotEmpty ? julySum += int.parse(july[i]!.text) : null;
  }
  tabiaCategorySum[6]!.text = julySum.toString();
  for (int i = 0; i <= 10; i++) {
    august[i]!.text.isNotEmpty ? augustSum += int.parse(august[i]!.text) : null;
  }
  tabiaCategorySum[7]!.text = augustSum.toString();
  for (int i = 0; i <= 10; i++) {
    september[i]!.text.isNotEmpty
        ? septemberSum += int.parse(september[i]!.text)
        : null;
  }
  tabiaCategorySum[8]!.text = septemberSum.toString();
  for (int i = 0; i <= 10; i++) {
    october[i]!.text.isNotEmpty
        ? octoberSum += int.parse(october[i]!.text)
        : null;
  }
  tabiaCategorySum[9]!.text = octoberSum.toString();
  for (int i = 0; i <= 10; i++) {
    november[i]!.text.isNotEmpty
        ? novemberSum += int.parse(november[i]!.text)
        : null;
  }
  tabiaCategorySum[10]!.text = novemberSum.toString();
  for (int i = 0; i <= 10; i++) {
    december[i]!.text.isNotEmpty
        ? decemberSum += int.parse(december[i]!.text)
        : null;
  }
  tabiaCategorySum[11]!.text = decemberSum.toString();
}

class _TabiaState extends State<Tabia> {
  @override
  void initState() {
    super.initState();
    assignPrevValues();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Text('MAENDELEO YA TABIA'),
            Container(
              color: const Color.fromARGB(115, 205, 219, 205),
              child: Column(
                children: [
                  const Text(
                    'Kiashiria #1: Bidii ya Maarifa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Fields(
                    janContl: jan[0],
                    febContl: feb[0],
                    marContl: mar[0],
                    aprContl: apr[0],
                    mayContl: may[0],
                    junContl: june[0],
                    julContl: july[0],
                    augContl: august[0],
                    sepContl: september[0],
                    octContl: october[0],
                    novContl: november[0],
                    decContl: december[0],
                    onchange: (value) {
                      sumFirstCategory();
                    },
                  ),
                ],
              ),
            ),
            const FieldsHeader(
              heading: 'Kiashiria #2: Ubora wa kazi',
              headcolor: Colors.greenAccent,
            ),
            Fields(
              color: Colors.greenAccent,
              janContl: jan[1],
              febContl: feb[1],
              marContl: mar[1],
              aprContl: apr[1],
              mayContl: may[1],
              junContl: june[1],
              julContl: july[1],
              augContl: august[1],
              sepContl: september[1],
              octContl: october[1],
              novContl: november[1],
              decContl: december[1],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #3: Utunzaji wa vifaa',
              headcolor: Color.fromARGB(115, 205, 219, 205),
            ),
            Fields(
              janContl: jan[2],
              febContl: feb[2],
              marContl: mar[2],
              aprContl: apr[2],
              mayContl: may[2],
              junContl: june[2],
              julContl: july[2],
              augContl: august[2],
              sepContl: september[2],
              octContl: october[2],
              novContl: november[2],
              decContl: december[2],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #4: Ushirikiano ',
              headcolor: Colors.greenAccent,
            ),
            Fields(
              color: Colors.greenAccent,
              janContl: jan[3],
              febContl: feb[3],
              marContl: mar[3],
              aprContl: apr[3],
              mayContl: may[3],
              junContl: june[3],
              julContl: july[3],
              augContl: august[3],
              sepContl: september[3],
              octContl: october[3],
              novContl: november[3],
              decContl: december[3],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #5: Heshima',
              headcolor: Color.fromARGB(115, 205, 219, 205),
            ),
            Fields(
              janContl: jan[4],
              febContl: feb[4],
              marContl: mar[4],
              aprContl: apr[4],
              mayContl: may[4],
              junContl: june[4],
              julContl: july[4],
              augContl: august[4],
              sepContl: september[4],
              octContl: october[4],
              novContl: november[4],
              decContl: december[4],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #6: Utii na kujituma',
              headcolor: Colors.greenAccent,
            ),
            Fields(
              color: Colors.greenAccent,
              janContl: jan[5],
              febContl: feb[5],
              marContl: mar[5],
              aprContl: apr[5],
              mayContl: may[5],
              junContl: june[5],
              julContl: july[5],
              augContl: august[5],
              sepContl: september[5],
              octContl: october[5],
              novContl: november[5],
              decContl: december[5],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #7: Uaminifu',
              headcolor: Color.fromARGB(115, 205, 219, 205),
            ),
            Fields(
              janContl: jan[6],
              febContl: feb[6],
              marContl: mar[6],
              aprContl: apr[6],
              mayContl: may[6],
              junContl: june[6],
              julContl: july[6],
              augContl: august[6],
              sepContl: september[6],
              octContl: october[6],
              novContl: november[6],
              decContl: december[6],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #8: Uongozi',
              headcolor: Colors.greenAccent,
            ),
            Fields(
              color: Colors.greenAccent,
              janContl: jan[7],
              febContl: feb[7],
              marContl: mar[7],
              aprContl: apr[7],
              mayContl: may[7],
              junContl: june[7],
              julContl: july[7],
              augContl: august[7],
              sepContl: september[7],
              octContl: october[7],
              novContl: november[7],
              decContl: december[7],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #9: Utamaduni',
              headcolor: Color.fromARGB(115, 205, 219, 205),
            ),
            Fields(
              janContl: jan[8],
              febContl: feb[8],
              marContl: mar[8],
              aprContl: apr[8],
              mayContl: may[8],
              junContl: june[8],
              julContl: july[8],
              augContl: august[8],
              sepContl: september[8],
              octContl: october[8],
              novContl: november[8],
              decContl: december[8],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #10: Utafiti na ubunifu',
              headcolor: Colors.greenAccent,
            ),
            Fields(
              color: Colors.greenAccent,
              janContl: jan[9],
              febContl: feb[9],
              marContl: mar[9],
              aprContl: apr[9],
              mayContl: may[9],
              junContl: june[9],
              julContl: july[9],
              augContl: august[9],
              sepContl: september[9],
              octContl: october[9],
              novContl: november[9],
              decContl: december[9],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading: 'Kiashiria #11: Anahudhuria kanisani/msikitini',
              headcolor: Color.fromARGB(115, 141, 231, 141),
            ),
            Fields(
              janContl: jan[10],
              febContl: feb[10],
              marContl: mar[10],
              aprContl: apr[10],
              mayContl: may[10],
              junContl: june[10],
              julContl: july[10],
              augContl: august[10],
              sepContl: september[10],
              octContl: october[10],
              novContl: november[10],
              decContl: december[10],
              onchange: (value) {
                sumFirstCategory();
              },
            ),
            const FieldsHeader(
              heading:
                  'MAENDELEO YA TABIA, JUMLA', //first category sum fieldes goes below
              headcolor: Colors.greenAccent,
            ),
            // fields of sum of the first category
            FieldSum(
              color: Color.fromARGB(255, 22, 194, 27),
              jancont: tabiaCategorySum[0]!,
              febcont: tabiaCategorySum[1]!,
              marcont: tabiaCategorySum[2]!,
              aprcont: tabiaCategorySum[3]!,
              maycont: tabiaCategorySum[4]!,
              juncont: tabiaCategorySum[5]!,
              julcont: tabiaCategorySum[6]!,
              augcont: tabiaCategorySum[7]!,
              sepcont: tabiaCategorySum[8]!,
              octcont: tabiaCategorySum[9]!,
              novcont: tabiaCategorySum[10]!,
              deccont: tabiaCategorySum[11]!,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var tabia = {
                      'Bidii ya Maarifa': [
                        jan[0]!.text,
                        feb[0]!.text,
                        mar[0]!.text,
                        apr[0]!.text,
                        may[0]!.text,
                        june[0]!.text,
                        july[0]!.text,
                        august[0]!.text,
                        september[0]!.text,
                        october[0]!.text,
                        november[0]!.text,
                        december[0]!.text
                      ],
                      'Ubora wa kazi': [
                        jan[1]!.text,
                        feb[1]!.text,
                        mar[1]!.text,
                        apr[1]!.text,
                        may[1]!.text,
                        june[1]!.text,
                        july[1]!.text,
                        august[1]!.text,
                        september[1]!.text,
                        october[1]!.text,
                        november[1]!.text,
                        december[1]!.text
                      ],
                      'Utunzaji wa vifaa': [
                        jan[2]!.text,
                        feb[2]!.text,
                        mar[2]!.text,
                        apr[2]!.text,
                        may[2]!.text,
                        june[2]!.text,
                        july[2]!.text,
                        august[2]!.text,
                        september[2]!.text,
                        october[2]!.text,
                        november[2]!.text,
                        december[2]!.text
                      ],
                      'Ushirikiano': [
                        jan[3]!.text,
                        feb[3]!.text,
                        mar[3]!.text,
                        apr[3]!.text,
                        may[3]!.text,
                        june[3]!.text,
                        july[3]!.text,
                        august[3]!.text,
                        september[3]!.text,
                        october[3]!.text,
                        november[3]!.text,
                        december[3]!.text
                      ],
                      'Heshima': [
                        jan[4]!.text,
                        feb[4]!.text,
                        mar[4]!.text,
                        apr[4]!.text,
                        may[4]!.text,
                        june[4]!.text,
                        july[4]!.text,
                        august[4]!.text,
                        september[4]!.text,
                        october[4]!.text,
                        november[4]!.text,
                        december[4]!.text
                      ],
                      'Utii na kujituma': [
                        jan[5]!.text,
                        feb[5]!.text,
                        mar[5]!.text,
                        apr[5]!.text,
                        may[5]!.text,
                        june[5]!.text,
                        july[5]!.text,
                        august[5]!.text,
                        september[5]!.text,
                        october[5]!.text,
                        november[5]!.text,
                        december[5]!.text
                      ],
                      'Uaminifu': [
                        jan[6]!.text,
                        feb[6]!.text,
                        mar[6]!.text,
                        apr[6]!.text,
                        may[6]!.text,
                        june[6]!.text,
                        july[6]!.text,
                        august[6]!.text,
                        september[6]!.text,
                        october[6]!.text,
                        november[6]!.text,
                        december[6]!.text
                      ],
                      'Uongozi': [
                        jan[7]!.text,
                        feb[7]!.text,
                        mar[7]!.text,
                        apr[7]!.text,
                        may[7]!.text,
                        june[7]!.text,
                        july[7]!.text,
                        august[7]!.text,
                        september[7]!.text,
                        october[7]!.text,
                        november[7]!.text,
                        december[7]!.text
                      ],
                      'Utamaduni': [
                        jan[8]!.text,
                        feb[8]!.text,
                        mar[8]!.text,
                        apr[8]!.text,
                        may[8]!.text,
                        june[8]!.text,
                        july[8]!.text,
                        august[8]!.text,
                        september[8]!.text,
                        october[8]!.text,
                        november[8]!.text,
                        december[8]!.text
                      ],
                      'Utafiti na ubunifu': [
                        jan[9]!.text,
                        feb[9]!.text,
                        mar[9]!.text,
                        apr[9]!.text,
                        may[9]!.text,
                        june[9]!.text,
                        july[9]!.text,
                        august[9]!.text,
                        september[9]!.text,
                        october[9]!.text,
                        november[9]!.text,
                        december[9]!.text
                      ],
                      'Anahudhuria kanisani/msikitini': [
                        jan[10]!.text,
                        feb[10]!.text,
                        mar[10]!.text,
                        apr[10]!.text,
                        may[10]!.text,
                        june[10]!.text,
                        july[10]!.text,
                        august[10]!.text,
                        september[10]!.text,
                        october[10]!.text,
                        november[10]!.text,
                        december[10]!.text
                      ],
                      'MAENDELEO YA TABIA, JUMLA': [
                        tabiaCategorySum[0]!.text,
                        tabiaCategorySum[1]!.text,
                        tabiaCategorySum[2]!.text,
                        tabiaCategorySum[3]!.text,
                        tabiaCategorySum[4]!.text,
                        tabiaCategorySum[5]!.text,
                        tabiaCategorySum[6]!.text,
                        tabiaCategorySum[7]!.text,
                        tabiaCategorySum[8]!.text,
                        tabiaCategorySum[9]!.text,
                        tabiaCategorySum[10]!.text,
                        tabiaCategorySum[11]!.text,
                      ]
                    };

                    try {
                      DatabaseManager().storeTemporary('Kitabia', tabia);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Imehifadhiwa kikamilifu'),
                        duration: Duration(seconds: 8),
                      ));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Text('ERROR'),
                                content: Text(e.toString()),
                              )));
                    }
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 78, 237, 117)),
                ),
                child: const Text('Hifadhi'))
          ],
        ),
      ),
    );
  }
}
