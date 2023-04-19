import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/fields.dart';
import 'package:imanieye_students/accessories/fieldswithheads.dart';
import 'package:imanieye_students/databasemanager.dart';

import '../tables.dart';

class Kijamii extends StatefulWidget {
  const Kijamii({
    Key? key,
  }) : super(key: key);

  @override
  State<Kijamii> createState() => _KijamiiState();
}

assignPrevValues() {
  if (Tables.student != null) {
    Map<String, Map<String, dynamic>>? map =
        Map<String, Map<String, dynamic>>.from(Tables.student);

    getValues(Map<String, Map<String, dynamic>> map) {
      List kijamiiValues = [];
      // assign keys to the keys variable

      List keys = [
        'Anaonyesha kujitawala',
        'Anafanya maamuzi sahihi ya maisha kwa kuzingatia maadili binafsi na yale ya jamii',
        'Anadhalilisha stadi za kuhusiana na wengine',
        'Anaonyesha kukubalika na jamii inayomzunguka',
      ];

      if (map['kijamii'] != null) {
        // get an inner values and add to the list
        for (var key in keys) {
          kijamiiValues.add(map['kijamii']![key]);
        }

        for (int i = 0; i < kijamiiValues.length; i++) {
          jan[i]!.text = kijamiiValues[i][0];
          feb[i]!.text = kijamiiValues[i][1];
          mar[i]!.text = kijamiiValues[i][2];
          apr[i]!.text = kijamiiValues[i][3];
          may[i]!.text = kijamiiValues[i][4];
          june[i]!.text = kijamiiValues[i][5];
          july[i]!.text = kijamiiValues[i][6];
          august[i]!.text = kijamiiValues[i][7];
          september[i]!.text = kijamiiValues[i][8];
          october[i]!.text = kijamiiValues[i][9];
          november[i]!.text = kijamiiValues[i][10];
          december[i]!.text = kijamiiValues[i][11];
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

// code to generate 4 january controller
List<TextEditingController?> jan =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> feb =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> mar =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> apr =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> may =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> june =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> july =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> august =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> september =
    List.generate(4, (index) => TextEditingController());
// code to generate 4 january controller
List<TextEditingController?> october =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> november =
    List.generate(4, (index) => TextEditingController());

// code to generate 4 january controller
List<TextEditingController?> december =
    List.generate(4, (index) => TextEditingController());

// code to generate sum controller of first cotecory MAENDELEO YA TABIA jan to december
List<TextEditingController?> kijamiiCategorySum =
    List.generate(12, (index) => TextEditingController());

void kijamiiCategorySummation() {
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

  for (int i = 0; i <= 3; i++) {
    jan[i]!.text.isNotEmpty ? januarySum += int.parse(jan[i]!.text) : null;
  }
  kijamiiCategorySum[0]!.text = januarySum.toString();
  for (int i = 0; i <= 3; i++) {
    feb[i]!.text.isNotEmpty ? februarySum += int.parse(feb[i]!.text) : null;
  }
  kijamiiCategorySum[1]!.text = februarySum.toString();
  for (int i = 0; i <= 3; i++) {
    mar[i]!.text.isNotEmpty ? marchSum += int.parse(mar[i]!.text) : null;
  }
  kijamiiCategorySum[2]!.text = marchSum.toString();
  for (int i = 0; i <= 3; i++) {
    apr[i]!.text.isNotEmpty ? aprilSum += int.parse(apr[i]!.text) : null;
  }
  kijamiiCategorySum[3]!.text = aprilSum.toString();
  for (int i = 0; i <= 3; i++) {
    may[i]!.text.isNotEmpty ? maySum += int.parse(may[i]!.text) : null;
  }
  kijamiiCategorySum[4]!.text = maySum.toString();
  for (int i = 0; i <= 3; i++) {
    june[i]!.text.isNotEmpty ? juneSum += int.parse(june[i]!.text) : null;
  }
  kijamiiCategorySum[5]!.text = juneSum.toString();
  for (int i = 0; i <= 3; i++) {
    july[i]!.text.isNotEmpty ? julySum += int.parse(july[i]!.text) : null;
  }
  kijamiiCategorySum[6]!.text = julySum.toString();
  for (int i = 0; i <= 3; i++) {
    august[i]!.text.isNotEmpty ? augustSum += int.parse(august[i]!.text) : null;
  }
  kijamiiCategorySum[7]!.text = augustSum.toString();
  for (int i = 0; i <= 3; i++) {
    september[i]!.text.isNotEmpty
        ? septemberSum += int.parse(september[i]!.text)
        : null;
  }
  kijamiiCategorySum[8]!.text = septemberSum.toString();
  for (int i = 0; i <= 3; i++) {
    october[i]!.text.isNotEmpty
        ? octoberSum += int.parse(october[i]!.text)
        : null;
  }
  kijamiiCategorySum[9]!.text = octoberSum.toString();
  for (int i = 0; i <= 3; i++) {
    november[i]!.text.isNotEmpty
        ? novemberSum += int.parse(november[i]!.text)
        : null;
  }
  kijamiiCategorySum[10]!.text = novemberSum.toString();
  for (int i = 0; i <= 3; i++) {
    december[i]!.text.isNotEmpty
        ? decemberSum += int.parse(december[i]!.text)
        : null;
  }
  kijamiiCategorySum[11]!.text = decemberSum.toString();
}

class _KijamiiState extends State<Kijamii> {
  @override
  void initState() {
    super.initState();
    assignPrevValues();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('MAENDELEO YA KIJAMII'),
          const FieldsHeader(
            heading: 'Kiashiria #1: Anaonyesha kujitawala',
            headcolor: Colors.greenAccent,
          ),
          Fields(
            color: Colors.greenAccent,
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
              kijamiiCategorySummation();
            },
          ),
          const FieldsHeader(
            heading:
                'Kiashiria #2: Anafanya maamuzi sahihi ya maisha kwa kuzingatia maadili binafsi na yale ya jamii',
            headcolor: Color.fromARGB(115, 205, 219, 205),
          ),
          Fields(
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
              kijamiiCategorySummation();
            },
          ),
          const FieldsHeader(
            heading:
                'Kiashiria #3: Anadhalilisha stadi za kuhusiana na wengine ',
            headcolor: Colors.greenAccent,
          ),
          Fields(
            color: Colors.greenAccent,
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
              kijamiiCategorySummation();
            },
          ),
          const FieldsHeader(
            heading:
                'Kiashiria #4: Anaonyesha kukubalika na jamii inayomzunguka',
            headcolor: Color.fromARGB(115, 205, 219, 205),
          ),
          Fields(
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
              kijamiiCategorySummation();
            },
          ),
          const FieldsHeader(
            heading: 'MAENDELEO YA KIJAMII, JUMLA',
            headcolor: Color.fromARGB(255, 47, 174, 33),
          ),
          FieldSum(
              color: Color.fromARGB(255, 47, 174, 33),
              jancont: kijamiiCategorySum[0]!,
              febcont: kijamiiCategorySum[1]!,
              marcont: kijamiiCategorySum[2]!,
              aprcont: kijamiiCategorySum[3]!,
              maycont: kijamiiCategorySum[4]!,
              juncont: kijamiiCategorySum[5]!,
              julcont: kijamiiCategorySum[6]!,
              augcont: kijamiiCategorySum[7]!,
              sepcont: kijamiiCategorySum[8]!,
              octcont: kijamiiCategorySum[9]!,
              novcont: kijamiiCategorySum[10]!,
              deccont: kijamiiCategorySum[11]!),
          ElevatedButton(
              onPressed: () {
                var kijamii = {
                  'Anaonyesha kujitawala': [
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
                  'Anafanya maamuzi sahihi ya maisha kwa kuzingatia maadili binafsi na yale ya jamii':
                      [
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
                  'Anadhalilisha stadi za kuhusiana na wengine': [
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
                  'Anaonyesha kukubalika na jamii inayomzunguka': [
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
                  'MAENDELEO YA KIJAMII, JUMLA': [
                    kijamiiCategorySum[0]!.text,
                    kijamiiCategorySum[1]!.text,
                    kijamiiCategorySum[2]!.text,
                    kijamiiCategorySum[3]!.text,
                    kijamiiCategorySum[4]!.text,
                    kijamiiCategorySum[5]!.text,
                    kijamiiCategorySum[6]!.text,
                    kijamiiCategorySum[7]!.text,
                    kijamiiCategorySum[8]!.text,
                    kijamiiCategorySum[9]!.text,
                    kijamiiCategorySum[10]!.text,
                    kijamiiCategorySum[11]!.text,
                  ]
                };
                try {
                  DatabaseManager().storeTemporary('kijamii', kijamii);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Imehifadhiwa kikamilifu'),
                      duration: Duration(seconds: 8)));
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            content: Text(e.toString()),
                          ));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 78, 237, 117)),
              ),
              child: const Text('Hifadhi')),
          ElevatedButton(
              onPressed: () async {
                try {
                  await DatabaseManager().studentInfo();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Taarifa zimetumwa Kikamilifu'),
                    duration: Duration(seconds: 8),
                  ));
                  Navigator.pop(context);
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                            content: Text(e.toString()),
                            title: const Text('ERROR'),
                          )));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 78, 237, 117)),
              ),
              child: const Text('Tuma')),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
