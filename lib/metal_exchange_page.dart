import 'package:flutter/material.dart';
import 'exchange_page.dart';

class MetalExchangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Sampah Logam yang Dapat Ditukar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sampah Logam yang Dapat Ditukar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Kaleng Minuman'),
                    subtitle: Text('Dapat ditukar dengan 5 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Kaleng Minuman'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Kardus Logam'),
                    subtitle: Text('Dapat ditukar dengan 4 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Kardus Logam'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Besi Bekas'),
                    subtitle: Text('Dapat ditukar dengan 6 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Besi Bekas'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Logam Lainnya'),
                    subtitle: Text('Dapat ditukar dengan 3 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Logam Lainnya'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              icon: Icon(Icons.arrow_back),
              label: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}