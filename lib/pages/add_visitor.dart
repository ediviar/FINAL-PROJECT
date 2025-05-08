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
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  final _tujuanController = TextEditingController();
  var typeAbsen = 'Masuk';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _namaController.text = widget.nama ?? '';
    _alamatController.text = widget.alamat ?? '';
    _tujuanController.text = widget.tujuan ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    _tujuanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Visitor Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 16,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 200),
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
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  hintText: widget.nama,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _namaController.clear();
                    },
                  ),
                ),
              ),
              TextField(
                controller: _alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                  hintText: widget.alamat,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _alamatController.clear();
                    },
                  ),
                ),
              ),
              TextField(
                controller: _tujuanController,
                decoration: InputDecoration(
                  labelText: 'Tujuan',
                  hintText: widget.tujuan,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _tujuanController.clear();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: typeAbsen,
                items: const [
                  DropdownMenuItem(
                    value: 'masuk',
                    child: Text('Absen Masuk'),
                  ),
                  DropdownMenuItem(
                    value: 'keluar',
                    child: Text('Absen Keluar'),
                  ),
                ], 
                onChanged: (value) {
                  if(value != null) {
                    typeAbsen = value;
                  }
                }
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  child: Text('Simpan'),
                  onPressed: () {
                    if(_formKey.currentState?.validate() ?? false) {
                      final nama = _namaController.text;
                      final alamat = _alamatController.text;
                      final tujuan = _tujuanController.text;
                      String status = typeAbsen;
                      Navigator.pop(context, {'nama': nama, 'alamat':alamat, 'tujuan':tujuan, 'status':status});
                    }
                  }, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}