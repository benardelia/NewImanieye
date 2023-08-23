import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imanieye_students/accessories/graph.dart';
import 'package:imanieye_students/main.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({
    super.key, required this.studentIndex,
  });
  final int studentIndex;
  static late Future<DocumentSnapshot<Map<String, dynamic>>> students;
  static late Map<String, dynamic> data;

  @override
  State<StudentDashboard> createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  void dataSnapshot(String fullName) {
    StudentDashboard.students =
        FirebaseFirestore.instance.collection('students').doc(fullName).get();
  }

  // methode to retrieve data from the firebase to show to user

  Widget showData(String key, String innerKey, Map<String, dynamic> data) {
    var over = 0;
    if (key == 'Kitabia') over = 44;
    if (key == 'kijamii') over = 24;
    if (key == 'Kiakili') over = 16;
    if (key == 'kimwili') over = 16;

    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 2, childAspectRatio: 2),
        itemBuilder: ((context, index) {
          return Card(
              color: Color.fromARGB(255, 112, 238, 98),
              elevation: 2.0,
              child: Center(
                child: Text(
                  '${months[index]}: ${data[key][innerKey][index]}/$over',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ));
        }));
  }

// methode to show the total data from the firebase, values calculated inside class
  Widget showDataTotal(List<double> values) {
    return GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 2, childAspectRatio: 2),
        itemBuilder: ((context, index) {
          return Card(
              color: Color.fromARGB(255, 66, 173, 92),
              elevation: 2.0,
              child: Center(
                child: Text(
                  '${months[index]}: ${values[index].toInt()}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ));
        }));
  }

// text style for the heading
  TextStyle headingStyle = const TextStyle(
      //  backgroundColor: Color.fromARGB(255, 191, 217, 239),
      fontFamily: 'Helvatica',
      fontSize: 15,
      fontWeight: FontWeight.bold);
  // to be deal with indexes
 
  @override
  void initState() {
     String jina = Login.studentsIDs[widget.studentIndex];
    super.initState();
    dataSnapshot(jina);
  }

  List months = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER'
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StudentDashboard.students,
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            try {
              StudentDashboard.data =
                  snapshot.data!.data() as Map<String, dynamic>;
              var data = StudentDashboard.data;
              List<double> jumlaKuu = Graph().jumlaKuu(data);

              return SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' JINA: ${data['Taarifa za mwanafunzi']['name']}',
                      style: headingStyle,
                    ),
                    Text(
                      ' UMRI: ${data['Taarifa za mwanafunzi']['umri']}',
                      style: headingStyle,
                    ),
                    Text(
                      ' DINI: ${data['Taarifa za mwanafunzi']['dini']}',
                      style: headingStyle,
                    ),
                    Text(
                      ' SHULE: ${data['Taarifa za mwanafunzi']['shule']}',
                      style: headingStyle,
                    ),
                    Text(
                      ' TATHMINI: ${data['Taarifa za mwanafunzi']['tahmini']}',
                      style: headingStyle,
                    ),
                    Text(
                      ' TAREHE YA KUSAJILIWA: ${data['Taarifa za mwanafunzi']['tarehe']}',
                      style: headingStyle,
                    ),
                    Text(
                      ' TAREHE YA TATHMINI YA MWISHO: ${data['Taarifa za mwanafunzi']['tareheYaMwisho']}',
                      style: headingStyle,
                    ),
                    Text(
                      ' ALIEPITIA: ${data['Taarifa za mwanafunzi']['aliepitia']}',
                      style: headingStyle,
                    ),
                    Text(
                      'MAONI YA YA MZAZI: ${data['Maoni']}',
                      style: headingStyle,
                    ),
                    const Divider(
                      height: 20,
                      thickness: 2,
                      indent: 1,
                    ),
                    const Text('TAARIFA YA JUMLA'),
                    Text(
                      'MAENDELEO YA KIJAMII, JUMLA',
                      style: headingStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    showData('kijamii', 'MAENDELEO YA KIJAMII, JUMLA', data),
                    const Text('MAENDELEO YA KITABIA, JUMLA'),
                    const SizedBox(
                      height: 10,
                    ),
                    showData('Kitabia', 'MAENDELEO YA TABIA, JUMLA', data),
                    const Text('MAENDELEO YA KIAKILI, JUMLA'),
                    const SizedBox(
                      height: 10,
                    ),
                    showData('Kiakili', 'MAENDELEO YA KIAKILI, JUMLA', data),
                    const Text('MAENDELEO YA KIMWILI, JUMLA'),
                    const SizedBox(
                      height: 10,
                    ),
                    showData('kimwili', 'MAENDELEO YA KIMWILI, JUMLA', data),
                    const Text(
                        'MAENDELEO YA JUMLA (KIAKILI, KIMWILI, KIJAMII, KITABIA)'),
                    const SizedBox(
                      height: 10,
                    ),
                    showDataTotal(jumlaKuu),
                  ],
                ),
              );
            } catch (e) {
              print(e.toString());
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Text(
                    'Tatizo limetokea angalia intanenti yako au wasiliana na wahusika'),
              );
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occured'));
          }
        }

        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(child: Text('Connection Error'));
        }

        return const Center(
          child: Text(
              'An Error occur check If you write correct name and try again'),
        );
      },
    );
  }
}
