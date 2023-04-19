import 'package:flutter/material.dart';
import 'package:imanieye_students/admin_dashboard.dart';
import 'package:imanieye_students/main.dart';
import 'package:imanieye_students/members.dart';
import 'package:imanieye_students/registration.dart';
import 'package:imanieye_students/studentdata.dart';
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
    Color mainColor = Colors.green;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: mainColor,
          leading: SizedBox.shrink(),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
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
                              builder: (context) =>  Registration(
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
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentData()));
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
