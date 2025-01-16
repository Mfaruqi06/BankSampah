import 'package:flutter/material.dart';

class TransactionStatusPage extends StatelessWidget {
  final String wasteType;
  final String weight;
  final String weightUnit;
  final String address;
  final String contact;
  final String notes;
  final String? imageName;

  TransactionStatusPage({
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
        title: Text('Status Transaksi'),
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
            Text(
              'Status Proses Transaksi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildStatusStep('Pengajuan', true),
            _buildStatusStep('Menunggu Konfirmasi', true),
            _buildStatusStep('Diterima', false),
            _buildStatusStep('Selesai', false),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusStep(String step, bool isCompleted) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.circle,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
        SizedBox(width: 10),
        Text(step),
      ],
    );
  }
}