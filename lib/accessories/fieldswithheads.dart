import 'package:flutter/material.dart';

class FieldsHeader extends StatelessWidget {
  const FieldsHeader({
    Key? key,
    required this.heading,
    this.headcolor,
  }) : super(key: key);
  final String heading;
  final Color? headcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: headcolor,
      child: Text(
        heading,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

class Fields extends StatelessWidget {
  const Fields(
      {Key? key,
      this.maxLines,
      this.aprContl,
      this.augContl,
      this.decContl,
      this.febContl,
      this.janContl,
      this.julContl,
      this.junContl,
      this.marContl,
      this.mayContl,
      this.novContl,
      this.octContl,
      this.sepContl,
      this.onchange,
      this.color})
      : super(key: key);
  final void Function(String value)? onchange;
  final int? maxLines;
  final Color? color;
  final TextEditingController? janContl;
  final TextEditingController? febContl;
  final TextEditingController? marContl;
  final TextEditingController? aprContl;
  final TextEditingController? mayContl;
  final TextEditingController? junContl;
  final TextEditingController? julContl;
  final TextEditingController? augContl;
  final TextEditingController? sepContl;
  final TextEditingController? octContl;
  final TextEditingController? novContl;
  final TextEditingController? decContl;

  dynamic validator(String? input) {
    if (input!.contains(RegExp(r'^[0-4]$'))) {
      return null;
    } else if (input.isEmpty) {
      return null;
    } else {
      input = '4';
      return "invalid";
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      onChanged: () {
        formKey.currentState!.validate();
      },
      key: formKey,
      child: Container(
        color: color,
        child: GridView.count(
          controller: ScrollController(keepScrollOffset: false),
          crossAxisCount: 6,
          crossAxisSpacing: 3,
          shrinkWrap: true,
          children: [
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'JAN',
              ),
              controller: janContl,
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: febContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'FEB'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: marContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'MAR'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: aprContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'APR'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: mayContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'MAY'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: junContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'JUN'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: julContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'JUL'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: augContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'AUG'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: sepContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'SEP'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: octContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'OCT'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: novContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'NOV'),
            ),
            TextFormField(
              validator: (val) {
                return validator(val);
              },
              onChanged: onchange,
              controller: decContl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'DEC'),
            ),
          ],
        ),
      ),
    );
  }
}
