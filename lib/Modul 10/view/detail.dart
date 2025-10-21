import 'package:flutter/material.dart';
import 'package:viewmodel/fetchgame.dart';
import 'package:modul10/model/detailgame.dart';
import 'package:readmore/readmore.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;
  const Detail({super.key, required this.gameTerpilih});

  Future<DetailGame> fetchData() async {
    final jsonData = await fetchDataFromAPI(gameTerpilih);
    return DetailGame.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak tersedia'));
          } else {
            final game = snapshot.data!;
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        child: Image.network(
                          game.thumbnail,
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                      ),
                      Positioned(
                        top: 25,
                        left: 10,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _requirementBox(game),
                        const SizedBox(height: 15),
                        _screenshotList(game),
                        const SizedBox(height: 15),
                        _descriptionBox(game.description),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _requirementBox(DetailGame game) {
  final req = game.minimum_system_requirements;
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Minimum System Requirements',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        _reqRow('OS', req.os),
        _reqRow('Processor', req.processor),
        _reqRow('Memory', req.memory),
        _reqRow('Graphics', req.graphics),
        _reqRow('Storage', req.storage),
      ],
    ),
  );
}

Row _reqRow(String title, String value) {
  return Row(
    children: [
      Expanded(flex: 3, child: Text(title)),
      const Expanded(flex: 1, child: Text(':')),
      Expanded(flex: 8, child: Text(value)),
    ],
  );
}

Widget _screenshotList(DetailGame game) {
  return SizedBox(
    height: 200,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: game.screenshots.length,
      separatorBuilder: (_, __) => const SizedBox(width: 15),
      itemBuilder: (context, index) => SizedBox(
        width: 250,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            game.screenshots[index].image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}

Widget _descriptionBox(String text) {
  return ReadMoreText(
    text,
    trimLines: 2,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'more',
    trimExpandedText: 'less',
    colorClickableText: Colors.amberAccent.shade400,
    style: const TextStyle(color: Colors.black54, height: 1.5),
  );
}
