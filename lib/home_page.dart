import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'plastic_exchange_page.dart'; // Import halaman sampah plastik
import 'paper_exchange_page.dart';   // Import halaman sampah kertas
import 'metal_exchange_page.dart';   // Import halaman sampah logam
import 'transaction_status_page.dart'; // Import halaman status transaksi
import 'profil_page.dart';  // Import halaman profil

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Sampah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String userName = 'Ma Ru'; // Ganti dengan nama pengguna
  final String accountType = 'Konsumen'; // Tipe akun

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Sampah'),
        automaticallyImplyLeading: false, // Menghapus tombol arrow
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'settings') {
                // Navigasi ke halaman pengaturan
              } else if (value == 'transaction_status') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionStatusPage(
                      wasteType: 'Plastic', // Ganti dengan data yang sesuai
                      weight: '10',         // Ganti dengan data yang sesuai
                      weightUnit: 'kg',     // Ganti dengan data yang sesuai
                      address: '123 Main St', // Ganti dengan data yang sesuai
                      contact: '08123456789', // Ganti dengan data yang sesuai
                      notes: 'Handle with care', // Ganti dengan data yang sesuai
                      imageName: 'image.png', // Ganti dengan data yang sesuai
                    ),
                  ),
                );
              } else if (value == 'profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              } else if (value == 'logout') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Ganti dengan halaman login Anda
                  (Route<dynamic> route) => false, // Menghapus semua rute sebelumnya
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'settings',
                  child: Text('Pengaturan'),
                ),
                PopupMenuItem<String>(
                  value: 'transaction_status',
                  child: Text('Status Transaksi'),
                ),
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('Profil'),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama pengguna dan foto pengguna
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150', // Ganti dengan URL foto pengguna
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName, // Menampilkan nama pengguna
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$accountType', // Menampilkan tipe akun
                      style: TextStyle(fontSize: 14), // Font lebih kecil
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Keuntungan dari sampah yang ditukar
            Text(
              'Keuntungan dari Sampah yang Ditukar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Total Keuntungan: Rp 500.000'), // Ganti dengan data yang sesuai
            SizedBox(height: 20),

            // Ikon sampah yang dapat ditukar
            Text(
              'Sampah yang Dapat Ditukar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman daftar sampah plastik
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlasticExchangePage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.delete, size: 50),
                      Text('Sampah Plastik'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman daftar sampah kertas
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaperExchangePage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.delete, size: 50),
                      Text('Sampah Kertas'),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman daftar sampah logam
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MetalExchangePage(),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Icon(Icons.delete, size: 50),
                      Text('Sampah Logam'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Info-info terbaru
            Text(
              'Info Terbaru:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Program baru untuk pengumpulan sampah plastik!'),
                    subtitle: Text('Dapatkan poin lebih banyak dengan menukarkan sampah plastik.'),
                  ),
                  ListTile(
                    title: Text('Kegiatan bersih-bersih lingkungan akan diadakan!'),
                    subtitle: Text('Bergabunglah dengan kami untuk menjaga kebersihan lingkungan.'),
                  ),
                  ListTile(
                    title: Text('Diskon khusus untuk penukaran sampah kertas!'),
                    subtitle: Text('Dapatkan diskon 10% untuk setiap penukaran sampah kertas.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}