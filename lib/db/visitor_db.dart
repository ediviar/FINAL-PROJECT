import 'package:final_project/db/app_db.dart';

class VisitorDb {

  final AppDatabase db;

  VisitorDb(this.db);

  Future<void> addVisitor(VisitorsCompanion data) async {
    await db.into(db.visitors).insertReturning(data);
  }

  Future<List<Visitor>> getAllVisitors() async {
    return await db.select(db.visitors).get();
  }

  Future<void> deleteVisitor(int id) async {
    await (db.delete(db.visitors)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> updateVisitor(VisitorsCompanion data) async {
    await (db.update(db.visitors)..where((tbl) => tbl.id.equals(data.id.value))).write(data);
  }

}