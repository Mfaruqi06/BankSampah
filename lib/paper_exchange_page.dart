import 'package:flutter/material.dart';
import 'package:flutter_application_1/exchange_page.dart';

class PaperExchangePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Sampah Kertas yang Dapat Ditukar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sampah Kertas yang Dapat Ditukar:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Koran'),
                    subtitle: Text('Dapat ditukar dengan 3 poin'),onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Koran'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Kardus'),
                    subtitle: Text('Dapat ditukar dengan 5 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Kardus'),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Kertas HVS'),
                    subtitle: Text('Dapat ditukar dengan 2 poin'),
                    onTap: () {
                      // Navigasi ke halaman penukaran untuk Kemasan Plastik
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExchangePage(wasteType: 'Kertas HVS'),
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