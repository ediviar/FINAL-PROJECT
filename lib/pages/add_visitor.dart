import 'package:drift/drift.dart' as drift;
import 'package:final_project/db/app_db.dart';
import 'package:final_project/db/visitor_db.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';

class AddVisitor extends StatefulWidget {
  final String? kode;
  final String? nama;
  final String? alamat;
  final String? tujuan;
  final String? status;
  
  const AddVisitor({
    super.key,
    this.kode,
    this.nama,
    this.alamat,
    this.tujuan,
    this.status,
  });

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController tujuanController = TextEditingController();
  var typeVisitor = 'Masuk';

  final db = VisitorDb(getIt<AppDatabase>());
  final visitors = <Visitor>[];
  final now = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    namaController.text = widget.nama ?? '';
    alamatController.text = widget.alamat ?? '';
    tujuanController.text = widget.tujuan ?? '';
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

  Future<void> addVisitor({
    String kode = '',
    String nama = '',
    String alamat = '',
    String tujuan = '',
    String status = '',
  }) async {
    try {
      final visitor = VisitorsCompanion(
        kode: drift.Value(kode),
        nama: drift.Value(nama),
        alamat: drift.Value(alamat),
        tujuan: drift.Value(tujuan),
        tglMasuk: drift.Value(now),
        tglKeluar: drift.Value(null),
        status: drift.Value(status),
      );
      await db.addVisitor(visitor);
      await getVisitors();
      print('APA INI : ' + visitor.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    alamatController.dispose();
    tujuanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Visitor Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 16,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Column(
                      children: [
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(0),
                            child: Image.asset(
                              'images/user.png',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    hintText: widget.nama,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        namaController.clear();
                      },
                    ),
                  ),
                ),
                TextFormField(
                  controller: alamatController,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    hintText: widget.alamat,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        alamatController.clear();
                      },
                    ),
                  ),
                ),
                TextFormField(
                  controller: tujuanController,
                  decoration: InputDecoration(
                    labelText: 'Tujuan',
                    hintText: widget.tujuan,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        tujuanController.clear();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    child: Text('Simpan'),
                    onPressed: () {
                      addVisitor(
                        kode: 'A',
                        nama: namaController.text,
                        alamat: alamatController.text,
                        tujuan: tujuanController.text,
                        status: typeVisitor,
                      );
                    }, 
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}