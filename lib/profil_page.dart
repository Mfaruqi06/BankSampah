import 'package:flutter/material.dart';
import 'edit_profile_page.dart'; // Import halaman edit profil
import 'dart:io'; // Import untuk menggunakan File

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Ma Ru'; // Ganti dengan nama pengguna
  String email = 'Kamaru0603@gmail.com'; // Ganti dengan email pengguna
  String phone = '08123456789'; // Ganti dengan nomor telepon pengguna
  String accountType = 'Pengguna'; // Tipe akun
  String? imageUrl; // Variabel untuk menyimpan URL gambar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: imageUrl != null
                    ? FileImage(File(imageUrl!)) // Tampilkan gambar yang dipilih
                    : NetworkImage(
                        'https://via.placeholder.com/150', // Gambar default
                      ) as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nama: $name',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Tipe Akun: $accountType', // Menampilkan tipe akun
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Nomor Telepon: $phone',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigasi ke halaman edit profil dan tunggu hasilnya
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      name: name,
                      email: email,
                      phone: phone,
                      imageUrl: imageUrl, // Kirim URL gambar saat ini
                    ),
                  ),
                );

                // Jika ada data yang diperbarui, perbarui tampilan
                if (updatedData != null) {
                  setState(() {
                    name = updatedData['name'];
                    email = updatedData['email'];
                    phone = updatedData['phone'];
                    imageUrl = updatedData['image']; // Perbarui URL gambar
                    // accountType tidak diubah di sini
                  });
                }
              },
              child: Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}