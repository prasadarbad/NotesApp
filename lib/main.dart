import 'package:flutter/material.dart';
import 'package:notes_app2/page/edit_note_page.dart';
import 'package:notes_app2/page/notes_page.dart';
import 'package:notes_app2/utils/savecheckbox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CheckBox1.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotesPage(),
    );
  }
}
