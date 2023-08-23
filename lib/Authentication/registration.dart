import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imanieye_students/homepage.dart';
import '../databasemanager.dart';
import 'dart:math';

class Registration extends StatefulWidget {
  Registration({Key? key, required this.isNewAdmin}) : super(key: key);
  final bool isNewAdmin;
  static final TextEditingController StudentID = TextEditingController();

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final formkey = GlobalKey<FormState>();

  final Color mainColor = Colors.green;

  final Color textcolor = Colors.black;

  final TextEditingController emailController = TextEditingController();

  final TextEditingController area = TextEditingController();

  final TextEditingController name = TextEditingController();

  final TextEditingController phone = TextEditingController();

// methode to generate random passwords
  String generatePassword() {
    var characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
    var password = '';
    var random = Random();

    for (var i = 0; i < 6; i++) {
      password += characters[random.nextInt(characters.length)];
    }

    return password;
  }

  @override
  Widget build(BuildContext context) {
    // returned by build method instead of scaffold
    return Form(
      key: formkey,
      child: GestureDetector(
        onTap: (() {
          FocusScope.of(context).requestFocus(FocusNode());
        }),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('IMANIEYE STUDENTS'),
              backgroundColor: mainColor,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const Text(
                      'SAJILI MZAZI/MLEZI',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                    ),
                    TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tafadhali jaza eneo hili';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Jina Kamili',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains("@")) {
                          return 'Tafadhali jaza eneo hili/ husisha "@" kwenye barua pepe';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Barua Pepe',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (!RegExp(
                                r'^\+?\d{1,3}[- ]?\d{3}[- ]?\d{3}[- ]?\d{3,4}$')
                            .hasMatch(value!)) {
                          return 'tumia 0783672635 / +255 783 345 345';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Namba ya Simu',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      controller: area,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tafadhali jaza eneo hili';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Anwani/Makazi',
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    widget.isNewAdmin
                        ? SizedBox.shrink()
                        : TextFormField(
                            controller: Registration.StudentID,
                            keyboardType: TextInputType.number,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('TAARIFA ZA MWANAFUNZI'),
                                        content: Homepage(),
                                      ));
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Tafadhali jaza eneo hili';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Taarifa za mwanafunzi',
                              labelStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            var pass = generatePassword();
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: pass);
                              User? user = FirebaseAuth.instance.currentUser;
                              final userId = user!.uid;

                              DatabaseManager().userProfile(
                                  userId,
                                  name.text,
                                  phone.text.trim(),
                                  area.text,
                                  Registration.StudentID.text.split(' '),
                                  widget.isNewAdmin);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Registration successful'),
                                duration: Duration(seconds: 5),
                              ));
                              Registration.StudentID.clear();
                              Navigator.pop(context);
                            } on FirebaseAuthException catch (e) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Error"),
                                      content: Text(e.toString()),
                                      actions: [
                                        TextButton(
                                          child: const Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(e.toString()),
                                      duration: const Duration(seconds: 10)));
                            }
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(mainColor)),
                        child: const Text(
                          'Tuma',
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
