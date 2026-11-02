// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dao.dart';

// ignore_for_file: type=lint
mixin _$BookDaoMixin on DatabaseAccessor<AppDb> {
  $AuthorTable get author => attachedDatabase.author;
  $BookTable get book => attachedDatabase.book;
  BookDaoManager get managers => BookDaoManager(this);
}

class BookDaoManager {
  final _$BookDaoMixin _db;
  BookDaoManager(this._db);
  $$AuthorTableTableManager get author =>
      $$AuthorTableTableManager(_db.attachedDatabase, _db.author);
  $$BookTableTableManager get book =>
      $$BookTableTableManager(_db.attachedDatabase, _db.book);
}
