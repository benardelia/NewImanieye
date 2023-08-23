import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/fields.dart';
import 'package:imanieye_students/accessories/fieldswithheads.dart';
import 'package:imanieye_students/databasemanager.dart';
import '../modules/tables.dart';

class Kiakili extends StatefulWidget {
  const Kiakili({Key? key}) : super(key: key);

  @override
  State<Kiakili> createState() => _KiakiliState();
}

assignPrevValues() {
  if (Tables.student != null) {
    Map<String, Map<String, dynamic>>? map =
        Map<String, Map<String, dynamic>>.from(Tables.student);

    getValues(Map<String, Map<String, dynamic>> map) {
      List kiakiliValues = [];
      // assign keys to the keys variable

      List keys = [
        'Uwezo wa kuandika, kusoma na kuhesabu',
        'Ufanyaji wa mazoezi ya darasani na mitihani',
        'Ufaulu',
        'Ushiriki darasani',
        'Ratiba binafsi',
        'Kuzingatia muda',
      ];

      if (map['Kiakili'] != null) {
        // get an inner values and add to the list
        for (var key in keys) {
          kiakiliValues.add(map['Kiakili']![key]);
        }

        for (int i = 0; i < kiakiliValues.length; i++) {
          jan[i]!.text = kiakiliValues[i][0];
          feb[i]!.text = kiakiliValues[i][1];
          mar[i]!.text = kiakiliValues[i][2];
          apr[i]!.text = kiakiliValues[i][3];
          may[i]!.text = kiakiliValues[i][4];
          june[i]!.text = kiakiliValues[i][5];
          july[i]!.text = kiakiliValues[i][6];
          august[i]!.text = kiakiliValues[i][7];
          september[i]!.text = kiakiliValues[i][8];
          october[i]!.text = kiakiliValues[i][9];
          november[i]!.text = kiakiliValues[i][10];
          december[i]!.text = kiakiliValues[i][11];
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

// code to generate 6 january controller
List<TextEditingController?> jan =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> feb =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> mar =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> apr =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> may =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> june =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> july =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> august =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> september =
    List.generate(6, (index) => TextEditingController());
// code to generate 6 january controller
List<TextEditingController?> october =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> november =
    List.generate(6, (index) => TextEditingController());

// code to generate 6 january controller
List<TextEditingController?> december =
    List.generate(6, (index) => TextEditingController());

// code to generate sum controller of first cotecory MAENDELEO YA TABIA jan to december
List<TextEditingController?> kiakiliCategorySum =
    List.generate(12, (index) => TextEditingController());

class _KiakiliState extends State<Kiakili> {
  void sumSecondCategory() {
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

    for (int i = 0; i <= 5; i++) {
      jan[i]!.text.isNotEmpty ? januarySum += int.parse(jan[i]!.text) : null;
    }
    kiakiliCategorySum[0]!.text = januarySum.toString();
    for (int i = 0; i <= 5; i++) {
      feb[i]!.text.isNotEmpty ? februarySum += int.parse(feb[i]!.text) : null;
    }
    kiakiliCategorySum[1]!.text = februarySum.toString();
    for (int i = 0; i <= 5; i++) {
      mar[i]!.text.isNotEmpty ? marchSum += int.parse(mar[i]!.text) : null;
    }
    kiakiliCategorySum[2]!.text = marchSum.toString();
    for (int i = 0; i <= 5; i++) {
      apr[i]!.text.isNotEmpty ? aprilSum += int.parse(apr[i]!.text) : null;
    }
    kiakiliCategorySum[3]!.text = aprilSum.toString();
    for (int i = 0; i <= 5; i++) {
      may[i]!.text.isNotEmpty ? maySum += int.parse(may[i]!.text) : null;
    }
    kiakiliCategorySum[4]!.text = maySum.toString();
    for (int i = 0; i <= 5; i++) {
      june[i]!.text.isNotEmpty ? juneSum += int.parse(june[i]!.text) : null;
    }
    kiakiliCategorySum[5]!.text = juneSum.toString();
    for (int i = 0; i <= 5; i++) {
      july[i]!.text.isNotEmpty ? julySum += int.parse(july[i]!.text) : null;
    }
    kiakiliCategorySum[6]!.text = julySum.toString();
    for (int i = 0; i <= 5; i++) {
      august[i]!.text.isNotEmpty
          ? augustSum += int.parse(august[i]!.text)
          : null;
    }
    kiakiliCategorySum[7]!.text = augustSum.toString();
    for (int i = 0; i <= 5; i++) {
      september[i]!.text.isNotEmpty
          ? septemberSum += int.parse(september[i]!.text)
          : null;
    }
    kiakiliCategorySum[8]!.text = septemberSum.toString();
    for (int i = 0; i <= 5; i++) {
      october[i]!.text.isNotEmpty
          ? octoberSum += int.parse(october[i]!.text)
          : null;
    }
    kiakiliCategorySum[9]!.text = octoberSum.toString();
    for (int i = 0; i <= 5; i++) {
      november[i]!.text.isNotEmpty
          ? novemberSum += int.parse(november[i]!.text)
          : null;
    }
    kiakiliCategorySum[10]!.text = novemberSum.toString();
    for (int i = 0; i <= 5; i++) {
      december[i]!.text.isNotEmpty
          ? decemberSum += int.parse(december[i]!.text)
          : null;
    }
    kiakiliCategorySum[11]!.text = decemberSum.toString();
  }

  @override
  void initState() {
    super.initState();
    assignPrevValues();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('MAENDELEO YA KIAKILI'),
          const FieldsHeader(
            heading: 'Kiashiria #1: Uwezo wa kuandika, kusoma na kuhesabu',
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
              sumSecondCategory();
            },
          ),
          const FieldsHeader(
            heading:
                'Kiashiria #2: Ufanyaji wa mazoezi ya darasani na mitihani',
            headcolor: Color.fromARGB(255, 216, 221, 216),
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
              sumSecondCategory();
            },
          ),
          const FieldsHeader(
            heading: 'Kiashiria #3: Ufaulu ',
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
              sumSecondCategory();
            },
          ),
          const FieldsHeader(
            heading: 'Kiashiria #4: Ushiriki darasani',
            headcolor: Color.fromARGB(255, 216, 221, 216),
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
              sumSecondCategory();
            },
          ),
          const FieldsHeader(
            heading: 'Kiashiria #5: Ratiba binafsi',
            headcolor: Colors.greenAccent,
          ),
          Fields(
            color: Colors.greenAccent,
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
              sumSecondCategory();
            },
          ),
          const FieldsHeader(
            heading: 'Kiashiria #6: Kuzingatia muda',
            headcolor: Color.fromARGB(255, 216, 221, 216),
          ),
          Fields(
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
              sumSecondCategory();
            },
          ),
          const FieldsHeader(
            heading: 'MAENDELEO YA KIAKILI, JUMLA',
            headcolor: Color.fromARGB(255, 55, 189, 28),
          ),
          FieldSum(
              color: Color.fromARGB(255, 81, 192, 33),
              jancont: kiakiliCategorySum[0]!,
              febcont: kiakiliCategorySum[1]!,
              marcont: kiakiliCategorySum[2]!,
              aprcont: kiakiliCategorySum[3]!,
              maycont: kiakiliCategorySum[4]!,
              juncont: kiakiliCategorySum[5]!,
              julcont: kiakiliCategorySum[6]!,
              augcont: kiakiliCategorySum[7]!,
              sepcont: kiakiliCategorySum[8]!,
              octcont: kiakiliCategorySum[9]!,
              novcont: kiakiliCategorySum[10]!,
              deccont: kiakiliCategorySum[11]!),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                var kiakili = {
                  'Uwezo wa kuandika, kusoma na kuhesabu': [
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
                  'Ufanyaji wa mazoezi ya darasani na mitihani': [
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
                  'Ufaulu': [
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
                  'Ushiriki darasani': [
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
                  'Ratiba binafsi': [
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
                  'Kuzingatia muda': [
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
                  'MAENDELEO YA KIAKILI, JUMLA': [
                    kiakiliCategorySum[0]!.text,
                    kiakiliCategorySum[1]!.text,
                    kiakiliCategorySum[2]!.text,
                    kiakiliCategorySum[3]!.text,
                    kiakiliCategorySum[4]!.text,
                    kiakiliCategorySum[5]!.text,
                    kiakiliCategorySum[6]!.text,
                    kiakiliCategorySum[7]!.text,
                    kiakiliCategorySum[8]!.text,
                    kiakiliCategorySum[9]!.text,
                    kiakiliCategorySum[10]!.text,
                    kiakiliCategorySum[11]!.text,
                  ]
                };

                try {
                  DatabaseManager().storeTemporary('Kiakili', kiakili);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Imehifadhiwa kikamilifu'),
                      duration: Duration(seconds: 8)));
                } catch (e) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text('ERROR'),
                            content: Text(e.toString()),
                          ));
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 78, 237, 117)),
              ),
              child: const Text('Hifadhi'))
        ],
      ),
    );
  }
}
