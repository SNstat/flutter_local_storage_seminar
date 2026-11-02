import 'package:drift/drift.dart';

import 'author.dart';

enum Language { croatian, german, english }

class Book extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().unique()();
  TextColumn get description => text()();
  IntColumn get pageCount => integer().check(pageCount.isBiggerThanValue(0))();
  DateTimeColumn get publishingDate => dateTime()();
  TextColumn get language => textEnum<Language>()();

  IntColumn get authorId =>
      integer().references(Author, #id, onDelete: KeyAction.cascade)();
}


