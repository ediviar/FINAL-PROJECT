import 'package:drift/drift.dart';
import 'package:final_project/db/visitor_db.dart';
import 'package:final_project/db/app_db.dart';
import 'package:final_project/main.dart';
import 'package:final_project/pages/add_visitor.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final db = VisitorDb(getIt<AppDatabase>());
  final visitors = <Visitor>[];
  final now = DateTime.now();

  @override
  void initState() {
    getVisitors();
    super.initState();
  }

  Future<void> getVisitors() async {
    try {
      final result = await db.getAllVisitors();
      setState(() {
        visitors.clear();
        visitors.addAll(result);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      await db.deleteVisitor(id);
      await getVisitors();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addVisitor({
    String kode = '',
    String nama = '',
    String alamat = '',
    String tujuan = '',
    String status = 'Masuk',
  }) async {
    try {
      final visitor = VisitorsCompanion(
        kode: Value(kode),
        nama: Value(nama),
        alamat: Value(alamat),
        tujuan: Value(tujuan),
        tglMasuk: Value(now),
        tglKeluar: Value(null),
        status: Value(status),
      );
      await db.addVisitor(visitor);
      await getVisitors();
    } catch (e) {
      print(e);
    }
  }

  Future<void> editVisitor({
    required int id,
    String kode = '',
    String nama = '',
    String alamat = '',
    String tujuan = '',
    String status = 'Masuk',
  }) async {
    try {
      final visitor = VisitorsCompanion(
        id: Value(id),
        kode: Value(kode),
        nama: Value(nama),
        alamat: Value(alamat),
        tujuan: Value(tujuan),
        tglMasuk: Value(now),
        tglKeluar: Value(null),
        status: Value(status),
      );
      await db.updateVisitor(visitor);
      await getVisitors();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          padding: EdgeInsets.all(16),
          itemCount: visitors.length,
          separatorBuilder: (_, __) => SizedBox(height: 16), 
          itemBuilder: (_, index) => Card(
            child: ListTile(
              title: Text(visitors[index].kode!),
              subtitle: Text(visitors[index].nama),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddVisitor(),
                        ),
                      );
                      if(result != null) {
                        editVisitor(
                          id: visitors[index].id,
                          kode: result['kode'],
                          nama: result['nama'],
                          alamat: result['alamat'],
                          tujuan: result['tujuan'],
                        );
                      }
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      delete(visitors[index].id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              )
            ),
          ), 
        ),
      ),
    );
  }
}
