import 'package:flutter/material.dart';
import 'package:imanieye_students/accessories/kidsclass_results_editor.dart';
import 'package:imanieye_students/accessories/primary_results_editor.dart';
import 'package:imanieye_students/accessories/secondary_results_editor.dart';

class ResultEditor extends StatefulWidget {
  const ResultEditor({super.key, required this.id, required this.name});
  final String id;
  final String name;

  @override
  State<ResultEditor> createState() => _ResultEditorState();
}

class _ResultEditorState extends State<ResultEditor> {
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

  List<String> semesters = ['first', 'second'];
  String selectedSemester = 'first';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Jaza Matokeo'),
            backgroundColor: Colors.green,
            bottom: TabBar(indicatorColor: Colors.black, tabs: [
              Tab(text: 'Secondary'),
              Tab(
                text: 'Primary',
              ),
              Tab(
                text: 'Early Primary',
              )
            ]),
          ),
          body: TabBarView(
            children: [
              SecondaryEditor(name: widget.name, id: widget.id),
              PrimaryEditor(name: widget.name, id: widget.id),
              KidsClassEditor(name: widget.name, id: widget.id)
            ],
          )),
    );
  }
}
