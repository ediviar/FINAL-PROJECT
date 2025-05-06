import 'package:flutter/material.dart';

class AddVisitor extends StatefulWidget {
  
  final String? name;
  final String? status;
  final String? project;
  
  const AddVisitor({
    super.key,
    this.name,
    this.status,
    this.project
    });

  @override
  State<AddVisitor> createState() => _AddVisitorState();
}

class _AddVisitorState extends State<AddVisitor> {
final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final _nameController = TextEditingController();
  final _projectController = TextEditingController();
  var typeAbsen = 'masuk';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController.text = widget.name ?? '';
    _projectController.text = widget.status ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _projectController.dispose();
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
              TextField(
                controller: _projectController,
                decoration: InputDecoration(
                  labelText: 'Project Name',
                  hintText: widget.name,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _projectController.clear();
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
                      final name = _nameController.text;
                      final project = _projectController.text;
                      String type = typeAbsen;
                      Navigator.pop(context, {'name': name, 'status':type , 'project': project});
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