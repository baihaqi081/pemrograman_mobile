import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationDetailPage extends StatelessWidget {
  final Destination destination;
  const DestinationDetailPage({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Image.network(
            destination.imageUrl,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
          // Overlay gelap agar teks terbaca
          Container(
            height: 350,
            color: Colors.black.withOpacity(0.3),
          ),
          // Tombol back
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Konten bawah
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 280),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.place, color: Colors.redAccent, size: 18),
                      const SizedBox(width: 5),
                      Text(destination.location),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(destination.rating.toString()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    destination.description,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                    ),
                    icon: const Icon(Icons.map),
                    label: const Text('Lihat di Peta'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
