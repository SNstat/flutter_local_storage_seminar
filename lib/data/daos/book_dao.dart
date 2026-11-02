import 'package:drift/drift.dart';
import 'package:flutter_local_storage_seminar/data/app_db.dart';
import 'package:flutter_local_storage_seminar/data/entities/book.dart';

part 'book_dao.g.dart';

@DriftAccessor(tables: [Book])
class BookDao extends DatabaseAccessor<AppDb> with _$BookDaoMixin {
  BookDao(super.db);

  Stream<List<BookData>> watchBooks () =>
    select(book).watch();

  Future<List<BookData>> getBooks() async {
    return select(book).get(); 
  }

  Future<BookData?> getBookById(int id) async {
    return (select(book)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<bool> updateBook(BookCompanion companion) async {
    return update(book).replace(companion);
  }

  Future<int> insertBook(BookCompanion companion) async {
    return into(book).insert(companion);
  }

  Future<int> deleteBook(int id) async {
    return (delete(book)..where((t) => t.id.equals(id))).go();
  }
}

