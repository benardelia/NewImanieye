import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:imanieye_students/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    fixedSize:
                        Size(MediaQuery.of(context).size.width * 0.8, 20)))),
        home: Login());
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static late List studentsIDs;
  static late String userName;
  static late String userId;
  static late bool superAdmin;
  static late bool isAdmin;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Color mainColor = Colors.green;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                ),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/student.png'),
                    fit: BoxFit.fill,
                    opacity: 0.5,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'IMANIEYE STUDENTS',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              const Text(
                'INGIA',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Barua Pepe',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: TextFormField(
                  obscureText: hidePassword,
                  controller: _password,
                  decoration: InputDecoration(
                    suffix: InkWell(
                      focusColor: Colors.black,
                      child: Icon(Icons.remove_red_eye),
                      onTap: () {
                        setState(() {
                          hidePassword = !hidePassword;
                          // hidepassword icon state
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: 'Nywila(Password)',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () async {
                    FirebaseAuth authInstance = FirebaseAuth.instance;
                    try {
                      await authInstance.signInWithEmailAndPassword(
                          email: _email.text.trim(),
                          password: _password.text.trim());
                      User? currentUser = authInstance.currentUser!;

                      DocumentSnapshot<Map<String, dynamic>> docsnap =
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(currentUser.uid)
                              .get();

                      bool admin = docsnap.data()!['admin'] ?? false;
                      bool superAdmin = docsnap.data()!['superadmin'] ?? false;
                      Login.studentsIDs = docsnap.data()!['studentids'] ?? [];
                      Login.userName = docsnap.data()!['name'] ?? '';
                      Login.userId = FirebaseAuth.instance.currentUser!.uid;
                      Login.superAdmin = docsnap.data()!['superadmin'] ?? false;
                      Login.isAdmin = admin;

                      if (!mounted) return;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPage(
                                    isAdmin: admin,
                                    isSuperAdmin: superAdmin,
                                  )));
                      _password.clear();
                      _email.clear();
                    } on FirebaseException catch (e) {
                      showDialog(
                          context: context,
                          builder: ((context) {
                            return AlertDialog(
                              title: const Text('ERROR'),
                              content: Text(e.toString()),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok'))
                              ],
                            );
                          }));
                    }
                  },
                  // style: ElevatedButton.styleFrom(backgroundColor: mainColor,
                  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),

                  child: const Text('Ingia'),
                ),
              ),
              TextButton(
                  onPressed: () {
                    TextEditingController resetEmail = TextEditingController();
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(
                                  'Ingiza anwani ya Barua Pepe, \n\nutatumiwa link ya kubadili Nywila kwenye hii barua pepe tafadhali ingiza anwani sahihi'),
                              content: TextField(
                                controller: resetEmail,
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      try {
                                        await FirebaseAuth.instance
                                            .sendPasswordResetEmail(
                                                email: resetEmail.text.trim());
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    'Check your Inbox to Email sent')));
                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text('An Error ${e.toString()}'),
                                          duration: Duration(seconds: 10),
                                        ));
                                      }
                                    },
                                    child: Text('Tuma'))
                              ],
                            ));
                  },
                  child: Text(
                    'Badili Nywila(Password)',
                    style: TextStyle(color: Color.fromARGB(255, 18, 86, 20)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
