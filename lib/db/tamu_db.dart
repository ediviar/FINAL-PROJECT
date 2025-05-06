import 'package:final_project/db/app_db.dart';

class VisitorDb {

  final AppDatabase db;

  VisitorDb(this.db);

  Future<void> addVisitor(VisitorCompanion data) async {
    await db.into(db.visitor).insert(data);
  }

  Future<List<VisitorData>> getAllVisitor() async {
    return await db.select(db.visitor).get();
  }

  Future<VisitorData?> getVisitor(String kode) async {
    final result = await (db.select(db.visitor)..where((tbl) => tbl.kode.equals(kode))).get();
    return result.isNotEmpty ? result.first : null;
  }

  Future<void> deleteVisitor(int id) async {
    await (db.delete(db.visitor)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateVisitor(VisitorCompanion data) async {
    await (db.update(db.visitor)..where((tbl) => tbl.id.equals(data.id.value))).write(data);
  }

}