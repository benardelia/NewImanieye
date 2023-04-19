import 'package:flutter/material.dart';

class FieldSum extends StatelessWidget {
  const FieldSum(
      {Key? key,
      this.sum,
      required this.jancont,
      required this.febcont,
      required this.marcont,
      required this.aprcont,
      required this.maycont,
      required this.juncont,
      required this.julcont,
      required this.augcont,
      required this.sepcont,
      required this.octcont,
      required this.novcont,
      required this.deccont, this.color})
      : super(key: key);
  final String? sum;
  final Color? color;
  // textediting controller for sum textfields from january to december
  final TextEditingController jancont;
  final TextEditingController febcont;
  final TextEditingController marcont;
  final TextEditingController aprcont;
  final TextEditingController maycont;
  final TextEditingController juncont;
  final TextEditingController julcont;
  final TextEditingController augcont;
  final TextEditingController sepcont;
  final TextEditingController octcont;
  final TextEditingController novcont;
  final TextEditingController deccont;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: GridView.count(
        controller: ScrollController(keepScrollOffset: false),
        crossAxisCount: 6,
        crossAxisSpacing: 3,
        shrinkWrap: true,
      
        children: [
          TextField(
            controller: jancont,
            readOnly: true,
            decoration: InputDecoration(labelText: 'JAN', hintText: jancont.text),
          ),
          TextField(
            controller: febcont,
            readOnly: true,
            decoration: InputDecoration(labelText: 'FEB', hintText: febcont.text),
          ),
          TextField(
            controller: marcont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'MAR', hintText: marcont.text),
          ),
          TextField(
            controller: aprcont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'APR', hintText: aprcont.text),
          ),
          TextField(
            controller: maycont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'MAY', hintText: maycont.text),
          ),
          TextField(
            controller: juncont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'JUN', hintText: juncont.text),
          ),
          TextField(
            controller: julcont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'JUL', hintText: julcont.text),
          ),
          TextField(
            controller: augcont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'AUG', hintText: augcont.text),
          ),
          TextField(
            controller: sepcont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'SEP', hintText: sepcont.text),
          ),
          TextField(
              controller: octcont,
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'OCT',
                hintText: octcont.text,
              )),
          TextField(
            controller: novcont,
            readOnly: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'NOV', hintText: novcont.text),
          ),
          TextField(
            controller: deccont,
            readOnly: true,
            onChanged: (cont) {},
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'DEC', hintText: deccont.text),
          ),
        ],
      ),
    );
  }
}
