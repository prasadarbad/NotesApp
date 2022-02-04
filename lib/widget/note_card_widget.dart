// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:notes_app2/model/note.dart';
import 'package:notes_app2/utils/savecheckbox.dart';
import 'package:objectid/objectid.dart';
import 'package:notes_app2/widget/note_form_widget.dart';

final _lightColors = [
  Colors.amber.shade300,
  Colors.lightGreen.shade300,
  Colors.lightBlue.shade300,
  Colors.orange.shade300,
  Colors.pinkAccent.shade100,
  Colors.tealAccent.shade100
];

class NoteCardWidget extends StatefulWidget {
  const NoteCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Note note;
  final int index;

  @override
  State<NoteCardWidget> createState() => _NoteCardWidgetState();
}

class _NoteCardWidgetState extends State<NoteCardWidget> {
  bool? isChecked = false;
  String? index1;
  @override
  void initState() {
    super.initState();
    showPriority(context);

    index1 = CheckBox1.getIndex();

    isChecked = CheckBox1.getCheckbox();
  }

  @override
  Widget build(BuildContext context) {
    final color = _lightColors[widget.index % _lightColors.length];
    final id = ObjectId();

    final time = DateFormat.yMMMd().format(widget.note.createdTime);
    final minHeight = getMinHeight(widget.index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showPriority(context),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                        print(id);

                        getCheckBox();
                      });
                    },
                  ),
                ]),

            Text(
              time,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 4),
            Text(
              widget.note.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              widget.note.description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            // ignore: unnecessary_null_comparison
          ],
        ),
      ),
    );
  }

  void getCheckBox() async {
    await CheckBox1.setCheckBox(isChecked!);
  }

  showPriority(BuildContext context) {
    if (index1 != null && index1!.contains('Low')) {
      return Text(
        'Low',
        style: TextStyle(
          color: Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      );
    } else if (index1 != null && index1!.contains('Medium')) {
      return Text(
        'Medium',
        style: TextStyle(
          color: Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        'High',
        style: TextStyle(
          color: Colors.red,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.right,
      );
    }
  }

  /// To return different height for different widgets
  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 170;
      case 2:
        return 170;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
