import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/modules/addresults.dart';
import 'package:imanieye_students/modules/admin_dashboard.dart';
import 'package:imanieye_students/main.dart';
import 'package:imanieye_students/modules/members.dart';
import 'package:imanieye_students/Authentication/registration.dart';
import 'package:imanieye_students/modules/results.dart';
import 'package:imanieye_students/modules/studentdata.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.isAdmin,
    required this.isSuperAdmin,
  });
  final bool isAdmin;
  final bool isSuperAdmin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: SizedBox.shrink(), actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacementNamed(context, '/sign-in');
          },
        ),
      ]),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSuperAdmin
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration(
                                    isNewAdmin: true,
                                  )));
                    },
                    // style: btnStyle,
                    child: const Text(
                      'Sajili Msimamizi Mpya',
                    ))
                : SizedBox.shrink(),
            isAdmin
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration(
                                    isNewAdmin: false,
                                  )));
                    },
                    // style: btnStyle,
                    child: const Text(
                      'Sajili Mzazi/ Mlezi',
                    ))
                : SizedBox.shrink(),
            ElevatedButton(
                onPressed: () {
                  if (!isAdmin) {
                    try {
                      Login.studentsIDs.isEmpty
                          ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Hakuna mwanafunzi aliye kwenye akaunti yako')))
                          : Login.studentsIDs.length == 1
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudentData(
                                            studentIndex: 0,
                                          )))
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('Chagua mwanafunzi'),
                                        content: SingleChildScrollView(
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  Login.studentsIDs.length,
                                              itemBuilder: (context, index) =>
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: ListTile(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      dense: true,
                                                      tileColor: Colors.green
                                                          .withOpacity(0.7),
                                                      leading: FutureBuilder(
                                                          future: FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'students')
                                                              .doc(Login
                                                                      .studentsIDs[
                                                                  index])
                                                              .get(),
                                                          builder: (context,
                                                              AsyncSnapshot<
                                                                      DocumentSnapshot>
                                                                  snapshot) {
                                                            Map<String, dynamic>
                                                                data = snapshot
                                                                        .data!
                                                                        .data()
                                                                    as Map<
                                                                        String,
                                                                        dynamic>;

                                                            return Text(
                                                                '${data['Taarifa za mwanafunzi']['name']}');
                                                          }),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        StudentData(
                                                                          studentIndex:
                                                                              index,
                                                                        )));
                                                      },
                                                    ),
                                                  )),
                                        ),
                                      ));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Hakuna mwanafunzi aliye kwenye akaunti yako')));
                    }
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminDashBoard()));
                  }
                },
                // style: btnStyle,
                child: const Text('Maendeleo ya Mwanafunzi')),
            isAdmin
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ResultAdd()));
                    },
                    // style: btnStyle,
                    child: const Text('Matokeo ya Mwanafunzi'))
                : ElevatedButton(
                    onPressed: () {
                      try {
                        Login.studentsIDs.isEmpty
                            ? ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Hakuna mwanafunzi aliye kwenye akaunti yako')))
                            : Login.studentsIDs.length == 1
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Results(id: Login.studentsIDs[0])))
                                : showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text('Chagua mwanafunzi'),
                                          content: SingleChildScrollView(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    Login.studentsIDs.length,
                                                itemBuilder:
                                                    (context, index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          child: ListTile(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            dense: true,
                                                            tileColor: Colors
                                                                .green
                                                                .withOpacity(
                                                                    0.7),
                                                            leading:
                                                                FutureBuilder(
                                                                    future: FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'students')
                                                                        .doc(Login.studentsIDs[
                                                                            index])
                                                                        .get(),
                                                                    builder: (context,
                                                                        AsyncSnapshot<DocumentSnapshot>
                                                                            snapshot) {
                                                                      Map<String,
                                                                          dynamic> data = snapshot
                                                                              .data!
                                                                              .data()
                                                                          as Map<
                                                                              String,
                                                                              dynamic>;

                                                                      return Text(
                                                                          '${data['Taarifa za mwanafunzi']['name']}');
                                                                    }),
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Results(
                                                                              id: Login.studentsIDs[index])));
                                                            },
                                                          ),
                                                        )),
                                          ),
                                        ));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Hakuna mwanafunzi aliye kwenye akaunti yako')));
                      }
                    },
                    // style: btnStyle,
                    child: const Text('Matokeo ya Mwanafunzi')),
            isAdmin
                ? ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Members(
                                    superAdmin: isSuperAdmin,
                                  )));
                    },
                    // style: btnStyle,
                    child: const Text('taarifa za Wanachama'))
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
