import 'package:flutter_local_storage_seminar/data/entities/book.dart';
import 'app_db.dart';

Future<void> seedMockData(AppDb db) async {

  final authors = await db.authorDao.getAuthors();
  if (authors.isNotEmpty) return;

  final tolkienId = await db.authorDao.insertAuthor(
    AuthorCompanion.insert(
      firstName: 'J.R.R.',
      lastName: 'Tolkien'
  ));

  final zoranicId = await db.authorDao.insertAuthor(
    AuthorCompanion.insert(
      firstName: 'Petar',
      lastName: 'Zoranić'
  ));

  final vergilijeId = await db.authorDao.insertAuthor(
    AuthorCompanion.insert(
      firstName: 'Publije',
      lastName: 'Vergilije Maron'
  ));

  await db.bookDao.insertBook(BookCompanion.insert(
    title: 'Hobbit',
    description: 'Prva knjiga J.R.R. Tolkiena.',
    pageCount: 300,
    publishingDate: DateTime(1937, 9, 21),
    language: Language.engleski,
    authorId: tolkienId,
  ));

  await db.bookDao.insertBook(BookCompanion.insert(
    title: 'Planine',
    description: 'Prvi hrvatski roman.',
    pageCount: 328,
    publishingDate: DateTime(1536, 9, 20),
    language: Language.hrvatski,
    authorId: zoranicId,
  ));

  await db.bookDao.insertBook(BookCompanion.insert(
    title: 'Eneida',
    description: 'Rimski nacionalni ep o putovanju Eneje.',
    pageCount: 500,
    publishingDate: DateTime(-19, 1, 1),
    language: Language.latinski,
    authorId: vergilijeId,
  ));
}