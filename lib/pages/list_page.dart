import 'package:final_project/db/visitor_db.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          padding: EdgeInsets.all(5),
          itemCount: visitors.length,
          separatorBuilder: (_, __) => SizedBox(height: 16), 
          itemBuilder: (_, index) => Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              leading: CircleAvatar(
                child: Text(
                  visitors[index].nama[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(visitors[index].kode!),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(visitors[index].nama),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Masuk : '),
                      Text(DateFormat('dd-MM-yyyy  hh:mm').format(visitors[index].tglMasuk!)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Keluar : '),
                      Text(
                        visitors[index].tglKeluar == null ? "" : DateFormat('dd-MM-yyyy  hh:mm').format(visitors[index].tglKeluar!)
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    visitors[index].status,
                    style: TextStyle(
                      fontSize: 16,
                      color: visitors[index].status == 'Masuk' ? Colors.green : Colors.red
                    ),
                  )
                ],
              )
            ),
          ), 
        ),
      ),
    );
  }
}
