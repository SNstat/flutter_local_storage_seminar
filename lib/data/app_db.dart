import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_local_storage_seminar/data/daos/author_dao.dart';
import 'package:flutter_local_storage_seminar/data/daos/book_dao.dart';
import 'package:flutter_local_storage_seminar/data/data_seeder.dart';
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

@DriftDatabase(tables: [Author, Book, Genre, BookGenre], daos: [AuthorDao, BookDao])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async => m.createAll(),
    onUpgrade: (m, from, to) async {
      if(from == 1) {
        await m.createTable(genre);
        await m.createTable(bookGenre);
      } else {
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
        }
        await m.createAll();
      }
    },
    beforeOpen:(details) async {
      await seedMockData(this);
    }
  );
}
