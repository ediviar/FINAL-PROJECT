import 'package:drift/drift.dart';

class Visitor extends Table {
  @override
  String get tableName => 'visitor';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get kode => text().withLength(min: 1, max: 50)();
  TextColumn get nama => text().withLength(min: 1, max: 50)();
  TextColumn get alamat => text().withLength(min: 1, max: 50)();
  TextColumn get tujuan => text().withLength(min: 1, max: 250)();
  DateTimeColumn get tglMasuk => dateTime().nullable()();
  DateTimeColumn get tglKeluar => dateTime().nullable()();
  TextColumn get status => text().withLength(min: 1, max: 50)();
}