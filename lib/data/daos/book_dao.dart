import 'package:drift/drift.dart';
import 'package:flutter_local_storage_seminar/data/app_db.dart';
import 'package:flutter_local_storage_seminar/data/entities/author.dart';
import 'package:flutter_local_storage_seminar/data/entities/book.dart';

part 'book_dao.g.dart';

@DriftAccessor(tables: [Book, Author])
class BookDao extends DatabaseAccessor<AppDb> with _$BookDaoMixin {
  BookDao(super.db);

  Stream<List<BookData>> watchBooks () =>
    select(book).watch();

  Stream<List<BookData>> watchBooksByAuthorId (int authorId) =>
    (select(book)..where((tbl) => tbl.authorId.equals(authorId))).watch();

  Future<List<BookData>> getBooks() async {
    return select(book).get(); 
  }

  Future<List<Map<String, dynamic>>> getCrossJoinWithAuthor() async {
    final result = await customSelect(
      'SELECT '
      'b.id AS bookId, '
      'b.title AS bookTitle, '
      'a.id AS authorId, '
      'a.first_name AS authorFirstName, '
      'a.last_name AS authorLastName '
      'FROM book b CROSS JOIN author a;'
    ).get();
    
    return result.map((row) => row.data).toList();
  }

  Future<BookData?> getBookById(int id) async {
    return (select(book)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<bool> updateBook(BookCompanion companion) async {
    return update(book).replace(companion);
  }

  Future<int> insertBook(BookCompanion companion) async {
    return into(book).insert(companion);
  }

  Future<int> deleteBook(int id) async {
    return (delete(book)..where((tbl) => tbl.id.equals(id))).go();
  }
}

