import 'package:flutter/material.dart';
import 'exchange_page.dart'; // Import halaman penukaran

class PlasticExchangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Sampah Plastik yang Dapat Ditukar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sampah Plastik yang Dapat Ditukar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Botol Plastik'),
                    subtitle: Text('Dapat ditukar dengan 5 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Botol Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Botol Plastik'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Kantong Plastik'),
                    subtitle: Text('Dapat ditukar dengan 3 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kantong Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Kantong Plastik'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Kemasan Plastik'),
                    subtitle: Text('Dapat ditukar dengan 4 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Kemasan Plastik'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Sedotan Plastik'),
                    subtitle: Text('Dapat ditukar dengan 2 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Sedotan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Sedotan Plastik'),
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