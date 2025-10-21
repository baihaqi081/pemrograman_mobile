import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/destination.dart';
import '../widgets/destination_card.dart';
import 'destination_detail_page.dart';

class DestinationListPage extends StatefulWidget {
  final String category;
  const DestinationListPage({super.key, required this.category});

  @override
  State<DestinationListPage> createState() => _DestinationListPageState();
}

class _DestinationListPageState extends State<DestinationListPage> {
  late Future<List<Destination>> _futureDestinations;

  @override
  void initState() {
    super.initState();
    _futureDestinations = _loadData();
  }

  Future<List<Destination>> _loadData() async {
    final jsonString =
    await rootBundle.loadString('lib/travelgo/assets/data/destination.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    final allDestinations =
    jsonData.map((e) => Destination.fromJson(e)).toList();
    return allDestinations
        .where((d) => d.category.toLowerCase() ==
        widget.category.toLowerCase())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: FutureBuilder<List<Destination>>(
        future: _futureDestinations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data ditemukan.'));
          }

          final destinations = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              final dest = destinations[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DestinationDetailPage(destination: dest),
                    ),
                  );
                },
                child: DestinationCard(destination: dest),
              );
            },
          );
        },
      ),
    );
  }
}
