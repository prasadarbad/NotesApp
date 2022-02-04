import 'package:flutter/material.dart';
import 'package:notes_app2/utils/savecheckbox.dart';

class NoteFormWidget extends StatefulWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;

  const NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
  }) : super(key: key);

  @override
  State<NoteFormWidget> createState() => _NoteFormWidgetState();
}

class _NoteFormWidgetState extends State<NoteFormWidget> {
  final items = ['Low', 'Medium', 'High'];
  String? index1 = '';
  String? value;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blueAccent, width: 2)),
                    child: Center(
                      child: DropdownButton<String>(
                        value: value,
                        iconSize: 36,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blueAccent,
                        ),
                        isExpanded: true,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(() {
                          this.value = value;
                          this.index1 = this.value;
                          getIndex();

                          print(index1);
                        }),
                      ),
                    ),
                  ),
                  // Switch(
                  //   value: widget.isImportant ?? false,
                  //   onChanged: widget.onChangedImportant,
                  // ),
                  // Expanded(
                  //   child: Slider(
                  //     value: (widget.number ?? 0).toDouble(),
                  //     min: 0,
                  //     max: 5,
                  //     divisions: 5,
                  //     onChanged: (number) =>
                  //         widget.onChangedNumber(number.toInt()),
                  //   ),
                  // )
                ],
              ),
              buildTitle(),
              const SizedBox(height: 8),
              buildDescription(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      );
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
  void getIndex() async {
    await CheckBox1.setIndex(index1!);
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: widget.title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The title cannot be empty' : null,
        onChanged: widget.onChangedTitle,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: widget.description,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Type something...',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The description cannot be empty'
            : null,
        onChanged: widget.onChangedDescription,
      );
}
