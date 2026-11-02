import 'package:drift/drift.dart';
import 'book.dart';
import 'genre.dart';

class BookGenre extends Table {
  IntColumn get bookId =>
      integer().references(Book, #id, onDelete: KeyAction.cascade)();
  IntColumn get genreId =>
      integer().references(Genre, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {bookId, genreId};
}