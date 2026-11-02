import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_local_storage_seminar/data/entities/author.dart';
import 'package:flutter_local_storage_seminar/data/entities/book.dart';
import 'package:flutter_local_storage_seminar/data/entities/book_genre.dart';
import 'package:flutter_local_storage_seminar/data/entities/genre.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'library.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Author, Book, Genre, BookGenre])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
