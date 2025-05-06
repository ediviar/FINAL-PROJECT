import 'package:drift/drift.dart';
// import 'package:final_project/db/tabel/tamu_tabel.dart';
import 'package:final_project/db/tamu_db.dart';
import 'package:final_project/db/app_db.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final db = VisitorDb(getIt<AppDatabase>());
  final Visitor = <VisitorData>[];
  final now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getVisitors() async {
    try {
      final result = await db.getAllVisitor();
      setState(() {
        Visitor.clear();
        Visitor.addAll(result);
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
    String status = 'Masuk',
  }) async {
    try {
      final visitor = VisitorCompanion(
        kode: Value(kode),
        nama: Value(nama),
        alamat: Value(alamat),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: Visitor.length,
        separatorBuilder: (_, __) => SizedBox(height: 10), 
        itemBuilder: (_, index) => 
        Card(
          child: ListTile(
            title: Text(DateFormat('dd MMMM y hh:mm:ss').format(Visitor[index].tglMasuk!)),
            subtitle: Text(Visitor[index].status.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
              IconButton(
                  onPressed: () async {
                    // final result = await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AbsensiFormPage(
                    //       name: Absensi[index].name,
                    //       status: Absensi[index].status,
                    //       project: Absensi[index].project,
                    //     ),
                    //   ),
                    // );
                    // if(result != null) {
                    //   editAbsensi(
                    //     id: Absensi[index].id,
                    //     name: result['name'], 
                    //   );
                    // }
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    delete(Visitor[index].id);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],  
            ),
          ),
        ), 
      ),
    );
  }
}
