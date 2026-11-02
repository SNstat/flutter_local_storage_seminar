import 'package:flutter/material.dart';
import 'package:flutter_local_storage_seminar/data/app_db.dart';
import 'package:flutter_local_storage_seminar/screens/author_list_screen.dart';

void main() {
  
  final db = AppDb();

  runApp(MaterialApp(
    theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
    home: AuthorListScreen(db: db),
  ));
}
