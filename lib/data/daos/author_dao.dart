import 'package:drift/drift.dart';
import 'package:flutter_local_storage_seminar/data/app_db.dart';
import 'package:flutter_local_storage_seminar/data/entities/author.dart';

part 'author_dao.g.dart';

@DriftAccessor(tables: [Author])
class AuthorDao extends DatabaseAccessor<AppDb> with _$AuthorDaoMixin {
  AuthorDao(super.db);

  Stream<List<AuthorData>> watchAuthors() =>
    select(author).watch();

  Future<List<AuthorData>> getAuthors() async {
    return select(author).get(); 
  }

  Future<AuthorData> getEmployeeById(int id) async {
    return (select(author)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<bool> updateEmployee(AuthorCompanion companion) async {
    return update(author).replace(companion);
  }

  Future<int> insertEmployee(AuthorCompanion companion) async {
    return into(author).insert(companion);
  }

  Future<int> deleteEmployee(int id) async {
    return (delete(author)..where((t) => t.id.equals(id))).go();
  }
}