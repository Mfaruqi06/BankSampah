import 'package:flutter/material.dart';
import 'transaction_status_page.dart'; // Import halaman status transaksi

class ConfirmationPage extends StatelessWidget {
  final String wasteType;
  final String weight;
  final String weightUnit;
  final String address;
  final String contact;
  final String notes;
  final String? imageName;

  ConfirmationPage({
    required this.wasteType,
    required this.weight,
    required this.weightUnit,
    required this.address,
    required this.contact,
    required this.notes,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Penukaran Sampah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jenis Sampah: $wasteType',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Berat: $weight $weightUnit'),
            SizedBox(height: 10),
            Text('Alamat: $address'),
            SizedBox(height: 10),
            Text('Kontak: $contact'),
            SizedBox(height: 10),
            Text('Catatan: $notes'),
            if (imageName != null) ...[
              SizedBox(height: 10),
              Text('Foto: $imageName'),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman status transaksi
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionStatusPage(
                      wasteType: wasteType,
                      weight: weight,
                      weightUnit: weightUnit,
                      address: address,
                      contact: contact,
                      notes: notes,
                      imageName: imageName,
                    ),
                  ),
                );
              },
              child: Text('Lihat Status Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}