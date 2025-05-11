// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $VisitorsTable extends Visitors with TableInfo<$VisitorsTable, Visitor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _kodeMeta = const VerificationMeta('kode');
  @override
  late final GeneratedColumn<String> kode = GeneratedColumn<String>(
    'kode',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alamatMeta = const VerificationMeta('alamat');
  @override
  late final GeneratedColumn<String> alamat = GeneratedColumn<String>(
    'alamat',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tujuanMeta = const VerificationMeta('tujuan');
  @override
  late final GeneratedColumn<String> tujuan = GeneratedColumn<String>(
    'tujuan',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tglMasukMeta = const VerificationMeta(
    'tglMasuk',
  );
  @override
  late final GeneratedColumn<DateTime> tglMasuk = GeneratedColumn<DateTime>(
    'tgl_masuk',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tglKeluarMeta = const VerificationMeta(
    'tglKeluar',
  );
  @override
  late final GeneratedColumn<DateTime> tglKeluar = GeneratedColumn<DateTime>(
    'tgl_keluar',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kode,
    nama,
    alamat,
    tujuan,
    tglMasuk,
    tglKeluar,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visitors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Visitor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kode')) {
      context.handle(
        _kodeMeta,
        kode.isAcceptableOrUnknown(data['kode']!, _kodeMeta),
      );
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('alamat')) {
      context.handle(
        _alamatMeta,
        alamat.isAcceptableOrUnknown(data['alamat']!, _alamatMeta),
      );
    } else if (isInserting) {
      context.missing(_alamatMeta);
    }
    if (data.containsKey('tujuan')) {
      context.handle(
        _tujuanMeta,
        tujuan.isAcceptableOrUnknown(data['tujuan']!, _tujuanMeta),
      );
    } else if (isInserting) {
      context.missing(_tujuanMeta);
    }
    if (data.containsKey('tgl_masuk')) {
      context.handle(
        _tglMasukMeta,
        tglMasuk.isAcceptableOrUnknown(data['tgl_masuk']!, _tglMasukMeta),
      );
    }
    if (data.containsKey('tgl_keluar')) {
      context.handle(
        _tglKeluarMeta,
        tglKeluar.isAcceptableOrUnknown(data['tgl_keluar']!, _tglKeluarMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Visitor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visitor(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      kode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kode'],
      ),
      nama:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}nama'],
          )!,
      alamat:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}alamat'],
          )!,
      tujuan:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}tujuan'],
          )!,
      tglMasuk: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tgl_masuk'],
      ),
      tglKeluar: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tgl_keluar'],
      ),
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $VisitorsTable createAlias(String alias) {
    return $VisitorsTable(attachedDatabase, alias);
  }
}

class Visitor extends DataClass implements Insertable<Visitor> {
  final int id;
  final String? kode;
  final String nama;
  final String alamat;
  final String tujuan;
  final DateTime? tglMasuk;
  final DateTime? tglKeluar;
  final String status;
  const Visitor({
    required this.id,
    this.kode,
    required this.nama,
    required this.alamat,
    required this.tujuan,
    this.tglMasuk,
    this.tglKeluar,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || kode != null) {
      map['kode'] = Variable<String>(kode);
    }
    map['nama'] = Variable<String>(nama);
    map['alamat'] = Variable<String>(alamat);
    map['tujuan'] = Variable<String>(tujuan);
    if (!nullToAbsent || tglMasuk != null) {
      map['tgl_masuk'] = Variable<DateTime>(tglMasuk);
    }
    if (!nullToAbsent || tglKeluar != null) {
      map['tgl_keluar'] = Variable<DateTime>(tglKeluar);
    }
    map['status'] = Variable<String>(status);
    return map;
  }

  VisitorsCompanion toCompanion(bool nullToAbsent) {
    return VisitorsCompanion(
      id: Value(id),
      kode: kode == null && nullToAbsent ? const Value.absent() : Value(kode),
      nama: Value(nama),
      alamat: Value(alamat),
      tujuan: Value(tujuan),
      tglMasuk:
          tglMasuk == null && nullToAbsent
              ? const Value.absent()
              : Value(tglMasuk),
      tglKeluar:
          tglKeluar == null && nullToAbsent
              ? const Value.absent()
              : Value(tglKeluar),
      status: Value(status),
    );
  }

  factory Visitor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visitor(
      id: serializer.fromJson<int>(json['id']),
      kode: serializer.fromJson<String?>(json['kode']),
      nama: serializer.fromJson<String>(json['nama']),
      alamat: serializer.fromJson<String>(json['alamat']),
      tujuan: serializer.fromJson<String>(json['tujuan']),
      tglMasuk: serializer.fromJson<DateTime?>(json['tglMasuk']),
      tglKeluar: serializer.fromJson<DateTime?>(json['tglKeluar']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kode': serializer.toJson<String?>(kode),
      'nama': serializer.toJson<String>(nama),
      'alamat': serializer.toJson<String>(alamat),
      'tujuan': serializer.toJson<String>(tujuan),
      'tglMasuk': serializer.toJson<DateTime?>(tglMasuk),
      'tglKeluar': serializer.toJson<DateTime?>(tglKeluar),
      'status': serializer.toJson<String>(status),
    };
  }

  Visitor copyWith({
    int? id,
    Value<String?> kode = const Value.absent(),
    String? nama,
    String? alamat,
    String? tujuan,
    Value<DateTime?> tglMasuk = const Value.absent(),
    Value<DateTime?> tglKeluar = const Value.absent(),
    String? status,
  }) => Visitor(
    id: id ?? this.id,
    kode: kode.present ? kode.value : this.kode,
    nama: nama ?? this.nama,
    alamat: alamat ?? this.alamat,
    tujuan: tujuan ?? this.tujuan,
    tglMasuk: tglMasuk.present ? tglMasuk.value : this.tglMasuk,
    tglKeluar: tglKeluar.present ? tglKeluar.value : this.tglKeluar,
    status: status ?? this.status,
  );
  Visitor copyWithCompanion(VisitorsCompanion data) {
    return Visitor(
      id: data.id.present ? data.id.value : this.id,
      kode: data.kode.present ? data.kode.value : this.kode,
      nama: data.nama.present ? data.nama.value : this.nama,
      alamat: data.alamat.present ? data.alamat.value : this.alamat,
      tujuan: data.tujuan.present ? data.tujuan.value : this.tujuan,
      tglMasuk: data.tglMasuk.present ? data.tglMasuk.value : this.tglMasuk,
      tglKeluar: data.tglKeluar.present ? data.tglKeluar.value : this.tglKeluar,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Visitor(')
          ..write('id: $id, ')
          ..write('kode: $kode, ')
          ..write('nama: $nama, ')
          ..write('alamat: $alamat, ')
          ..write('tujuan: $tujuan, ')
          ..write('tglMasuk: $tglMasuk, ')
          ..write('tglKeluar: $tglKeluar, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, kode, nama, alamat, tujuan, tglMasuk, tglKeluar, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visitor &&
          other.id == this.id &&
          other.kode == this.kode &&
          other.nama == this.nama &&
          other.alamat == this.alamat &&
          other.tujuan == this.tujuan &&
          other.tglMasuk == this.tglMasuk &&
          other.tglKeluar == this.tglKeluar &&
          other.status == this.status);
}

class VisitorsCompanion extends UpdateCompanion<Visitor> {
  final Value<int> id;
  final Value<String?> kode;
  final Value<String> nama;
  final Value<String> alamat;
  final Value<String> tujuan;
  final Value<DateTime?> tglMasuk;
  final Value<DateTime?> tglKeluar;
  final Value<String> status;
  const VisitorsCompanion({
    this.id = const Value.absent(),
    this.kode = const Value.absent(),
    this.nama = const Value.absent(),
    this.alamat = const Value.absent(),
    this.tujuan = const Value.absent(),
    this.tglMasuk = const Value.absent(),
    this.tglKeluar = const Value.absent(),
    this.status = const Value.absent(),
  });
  VisitorsCompanion.insert({
    this.id = const Value.absent(),
    this.kode = const Value.absent(),
    required String nama,
    required String alamat,
    required String tujuan,
    this.tglMasuk = const Value.absent(),
    this.tglKeluar = const Value.absent(),
    required String status,
  }) : nama = Value(nama),
       alamat = Value(alamat),
       tujuan = Value(tujuan),
       status = Value(status);
  static Insertable<Visitor> custom({
    Expression<int>? id,
    Expression<String>? kode,
    Expression<String>? nama,
    Expression<String>? alamat,
    Expression<String>? tujuan,
    Expression<DateTime>? tglMasuk,
    Expression<DateTime>? tglKeluar,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kode != null) 'kode': kode,
      if (nama != null) 'nama': nama,
      if (alamat != null) 'alamat': alamat,
      if (tujuan != null) 'tujuan': tujuan,
      if (tglMasuk != null) 'tgl_masuk': tglMasuk,
      if (tglKeluar != null) 'tgl_keluar': tglKeluar,
      if (status != null) 'status': status,
    });
  }

  VisitorsCompanion copyWith({
    Value<int>? id,
    Value<String?>? kode,
    Value<String>? nama,
    Value<String>? alamat,
    Value<String>? tujuan,
    Value<DateTime?>? tglMasuk,
    Value<DateTime?>? tglKeluar,
    Value<String>? status,
  }) {
    return VisitorsCompanion(
      id: id ?? this.id,
      kode: kode ?? this.kode,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      tujuan: tujuan ?? this.tujuan,
      tglMasuk: tglMasuk ?? this.tglMasuk,
      tglKeluar: tglKeluar ?? this.tglKeluar,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kode.present) {
      map['kode'] = Variable<String>(kode.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (alamat.present) {
      map['alamat'] = Variable<String>(alamat.value);
    }
    if (tujuan.present) {
      map['tujuan'] = Variable<String>(tujuan.value);
    }
    if (tglMasuk.present) {
      map['tgl_masuk'] = Variable<DateTime>(tglMasuk.value);
    }
    if (tglKeluar.present) {
      map['tgl_keluar'] = Variable<DateTime>(tglKeluar.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitorsCompanion(')
          ..write('id: $id, ')
          ..write('kode: $kode, ')
          ..write('nama: $nama, ')
          ..write('alamat: $alamat, ')
          ..write('tujuan: $tujuan, ')
          ..write('tglMasuk: $tglMasuk, ')
          ..write('tglKeluar: $tglKeluar, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VisitorsTable visitors = $VisitorsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [visitors];
}

typedef $$VisitorsTableCreateCompanionBuilder =
    VisitorsCompanion Function({
      Value<int> id,
      Value<String?> kode,
      required String nama,
      required String alamat,
      required String tujuan,
      Value<DateTime?> tglMasuk,
      Value<DateTime?> tglKeluar,
      required String status,
    });
typedef $$VisitorsTableUpdateCompanionBuilder =
    VisitorsCompanion Function({
      Value<int> id,
      Value<String?> kode,
      Value<String> nama,
      Value<String> alamat,
      Value<String> tujuan,
      Value<DateTime?> tglMasuk,
      Value<DateTime?> tglKeluar,
      Value<String> status,
    });

class $$VisitorsTableFilterComposer
    extends Composer<_$AppDatabase, $VisitorsTable> {
  $$VisitorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kode => $composableBuilder(
    column: $table.kode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tujuan => $composableBuilder(
    column: $table.tujuan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tglMasuk => $composableBuilder(
    column: $table.tglMasuk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tglKeluar => $composableBuilder(
    column: $table.tglKeluar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$VisitorsTableOrderingComposer
    extends Composer<_$AppDatabase, $VisitorsTable> {
  $$VisitorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kode => $composableBuilder(
    column: $table.kode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tujuan => $composableBuilder(
    column: $table.tujuan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tglMasuk => $composableBuilder(
    column: $table.tglMasuk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tglKeluar => $composableBuilder(
    column: $table.tglKeluar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VisitorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisitorsTable> {
  $$VisitorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kode =>
      $composableBuilder(column: $table.kode, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get alamat =>
      $composableBuilder(column: $table.alamat, builder: (column) => column);

  GeneratedColumn<String> get tujuan =>
      $composableBuilder(column: $table.tujuan, builder: (column) => column);

  GeneratedColumn<DateTime> get tglMasuk =>
      $composableBuilder(column: $table.tglMasuk, builder: (column) => column);

  GeneratedColumn<DateTime> get tglKeluar =>
      $composableBuilder(column: $table.tglKeluar, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$VisitorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VisitorsTable,
          Visitor,
          $$VisitorsTableFilterComposer,
          $$VisitorsTableOrderingComposer,
          $$VisitorsTableAnnotationComposer,
          $$VisitorsTableCreateCompanionBuilder,
          $$VisitorsTableUpdateCompanionBuilder,
          (Visitor, BaseReferences<_$AppDatabase, $VisitorsTable, Visitor>),
          Visitor,
          PrefetchHooks Function()
        > {
  $$VisitorsTableTableManager(_$AppDatabase db, $VisitorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$VisitorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$VisitorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$VisitorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> kode = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<String> alamat = const Value.absent(),
                Value<String> tujuan = const Value.absent(),
                Value<DateTime?> tglMasuk = const Value.absent(),
                Value<DateTime?> tglKeluar = const Value.absent(),
                Value<String> status = const Value.absent(),
              }) => VisitorsCompanion(
                id: id,
                kode: kode,
                nama: nama,
                alamat: alamat,
                tujuan: tujuan,
                tglMasuk: tglMasuk,
                tglKeluar: tglKeluar,
                status: status,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> kode = const Value.absent(),
                required String nama,
                required String alamat,
                required String tujuan,
                Value<DateTime?> tglMasuk = const Value.absent(),
                Value<DateTime?> tglKeluar = const Value.absent(),
                required String status,
              }) => VisitorsCompanion.insert(
                id: id,
                kode: kode,
                nama: nama,
                alamat: alamat,
                tujuan: tujuan,
                tglMasuk: tglMasuk,
                tglKeluar: tglKeluar,
                status: status,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$VisitorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VisitorsTable,
      Visitor,
      $$VisitorsTableFilterComposer,
      $$VisitorsTableOrderingComposer,
      $$VisitorsTableAnnotationComposer,
      $$VisitorsTableCreateCompanionBuilder,
      $$VisitorsTableUpdateCompanionBuilder,
      (Visitor, BaseReferences<_$AppDatabase, $VisitorsTable, Visitor>),
      Visitor,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VisitorsTableTableManager get visitors =>
      $$VisitorsTableTableManager(_db, _db.visitors);
}
