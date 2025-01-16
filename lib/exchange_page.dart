import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'confirmation_page.dart'; // Import halaman konfirmasi

class ExchangePage extends StatefulWidget {
  final String wasteType; // Menyimpan jenis sampah yang dipilih

  ExchangePage({required this.wasteType});

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final _formKey = GlobalKey<FormState>();
  String _weightUnit = 'kg'; // Default unit
  String _address = '';
  String _contact = '';
  String _notes = '';
  String _weight = '';
  XFile? _image; // Variable to hold the image

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Penukaran Sampah ${widget.wasteType}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dropdown untuk berat
              DropdownButtonFormField<String>(
                value: _weightUnit,
                decoration: InputDecoration(labelText: 'Pilih Satuan Berat'),
                items: <String>['kg', 'pcs', 'ton']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _weightUnit = newValue!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Berat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan berat';
                  }
                  return null;
                },
                onChanged: (value) {
                  _weight = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan alamat';
                  }
                  return null;
                },
                onChanged: (value) {
                  _address = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Kontak'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan kontak';
                  }
                  return null;
                },
                onChanged: (value) {
                  _contact = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Catatan'),
                onChanged: (value) {
                  _notes = value;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pilih Foto'),
              ),
              if (_image != null) ...[
                SizedBox(height: 10),
                Text('Foto terpilih: ${_image!.name}'),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationPage(
                          wasteType: widget.wasteType,
                          weight: _weight,
                          weightUnit: _weightUnit,
                          address: _address,
                          contact: _contact,
                          notes: _notes,
                          imageName: _image?.name,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Konfirmasi Penukaran'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}