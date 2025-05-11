import 'package:drift/drift.dart';

@DataClassName('Visitor')
class Visitors extends Table {
  @override
  String get tableName => 'visitors';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get kode => text().withLength(max: 50).nullable()();
  TextColumn get nama => text().withLength(max: 50)();
  TextColumn get alamat => text().withLength(max: 255)();
  TextColumn get tujuan => text().withLength(max: 255)();
  DateTimeColumn get tglMasuk => dateTime().nullable()();
  DateTimeColumn get tglKeluar => dateTime().nullable()();
  TextColumn get status => text().withLength(max: 50)();
}