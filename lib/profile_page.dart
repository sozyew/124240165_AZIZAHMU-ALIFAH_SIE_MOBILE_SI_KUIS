import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/aliexpress.jpeg'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'AZIZAH MU\'ALIFAH', 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Pelanggan fotocopy',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Card(
              elevation: 1,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFFFF3E0),
                  child: Icon(Icons.restaurant_menu, color: Colors.orange),
                ),
                title: const Text('FOTOCOPY', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('pesan alat tulis Anda dengan mudah.'),
              ),
            ),
            Card(
              elevation: 1,
              color: Colors.white,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFFFF3E0),
                  child: Icon(Icons.receipt_long, color: Colors.orange),
                ),
                title: const Text('Pemesanan', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('Jumlah dan harga dihitung otomatis.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}