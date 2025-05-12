import 'package:drift/drift.dart' as drift;
import 'package:final_project/db/app_db.dart';
import 'package:final_project/db/visitor_db.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  List<BluetoothDevice> devices = [];
  BluetoothDevice? selectedDevice;
  BlueThermalPrinter printer = BlueThermalPrinter.instance;
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController tujuanController = TextEditingController();
  var typeVisitor = 'Masuk';
  var nomor = 'A' + DateFormat('yyMMdd').format(DateTime.now()) + DateFormat('mmss').format(DateTime.now());

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
    getDevices();
    super.initState();
  }

  void getDevices() async {
    devices = await printer.getBondedDevices();
    setState(() {});
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
      print('APA INI : ' + visitors.toString());
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
                        SizedBox(height: 10),
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
                SizedBox(height: 6),
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
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: FilledButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.save
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Simpan',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.print
                        ),
                        SizedBox(width: 5,),
                        Text(
                          'Print',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async {
                      if ((await printer.isConnected)!) {
                        printer.printNewLine();
                        printer.printCustom('Aplikasi Buku Tamu', 2, 1);
                        printer.printNewLine();
                        printer.printQRcode(nomor, 250, 250, 1);
                        printer.printCustom(nomor, 2, 1);
                        printer.printNewLine();
                        printer.printNewLine();
                        printer.printCustom('Nama   : IAL23100030', 1, 0);
                        printer.printCustom('Alamat : IAL23100030', 1, 0);
                        printer.printCustom('Tujuan : IAL23100030', 1, 0);
                        printer.printNewLine();
                        printer.printNewLine();
                        printer.printNewLine();
                        printer.printNewLine();
                      }
                      addVisitor(
                        kode: nomor,
                        nama: namaController.text,
                        alamat: alamatController.text,
                        tujuan: tujuanController.text,
                        status: typeVisitor,
                      );
                      namaController.clear();
                      alamatController.clear();
                      tujuanController.clear();
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