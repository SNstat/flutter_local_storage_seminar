// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_dao.dart';

// ignore_for_file: type=lint
mixin _$AuthorDaoMixin on DatabaseAccessor<AppDb> {
  $AuthorTable get author => attachedDatabase.author;
  AuthorDaoManager get managers => AuthorDaoManager(this);
}

class AuthorDaoManager {
  final _$AuthorDaoMixin _db;
  AuthorDaoManager(this._db);
  $$AuthorTableTableManager get author =>
      $$AuthorTableTableManager(_db.attachedDatabase, _db.author);
}
