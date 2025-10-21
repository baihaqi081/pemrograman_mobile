import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Row and Column"),
        ),
        body: const Center(
          child: GridKotak(),
        ),
      ),
    );
  }
}


class KotakCustom extends StatelessWidget {
  final Color warna;
  final IconData icon;
  final String label;

  const KotakCustom({
    super.key,
    required this.warna,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.red, size: 40),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Widget Grid 2x2 dengan Row + Column
class GridKotak extends StatelessWidget {
  const GridKotak({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KotakCustom(
              warna: Colors.blue,
              icon: Icons.favorite,
              label: "Kotak 1",
            ),
            SizedBox(width: 10),
            KotakCustom(
              warna: Colors.green,
              icon: Icons.favorite,
              label: "Kotak 2",
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            KotakCustom(
              warna: Colors.orange,
              icon: Icons.favorite,
              label: "Kotak 3",
            ),
            SizedBox(width: 10),
            KotakCustom(
              warna: Colors.purple,
              icon: Icons.favorite,
              label: "Kotak 4",
            ),
          ],
        ),
      ],
    );
  }
}
