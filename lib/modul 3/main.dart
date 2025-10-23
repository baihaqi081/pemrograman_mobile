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
      title: 'Alignment',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Alignment'),
        ),
        body: const Center(
          child: LatihanModul3(),
        ),
      ),
    );
  }
}


class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class LatihanModul3 extends StatelessWidget {
  const LatihanModul3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // bisa diganti sesuai instruksi modul
      crossAxisAlignment: CrossAxisAlignment.center, // coba juga start, end, stretch, baseline
      children: [
        Row(
          mainAxisSize: MainAxisSize.max, // ganti dengan min untuk eksperimen
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // coba variasi lain
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            KotakBiruJempolKecil(),
            SizedBox(width: 20),
            KotakBiruJempol(),
            SizedBox(width: 20),
            KotakBiruJempolKecil(),
          ],
        ),
        const SizedBox(height: 40),
        // 🔹 Contoh tambahan dari modul (teks + icon suhu)
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Suhu:',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '25°C',
              style: TextStyle(fontSize: 75),
            ),
            Icon(
              Icons.sunny,
              color: Colors.amber,
              size: 45,
            ),
          ],
        ),
      ],
    );
  }
}

class TugasCuaca extends StatelessWidget {
  const TugasCuaca({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.sunny, color: Colors.amber, size: 60),
            Icon(Icons.cloudy_snowing, color: Colors.blue, size: 60),
            Icon(Icons.cloud, color: Colors.grey, size: 60),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Prakiraan Cuaca",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
