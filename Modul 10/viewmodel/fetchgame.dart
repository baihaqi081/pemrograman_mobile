import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modul10/model/game.dart';
import 'package:modul10/model/detailgame.dart';

Future<List<Game>> fetchGames() async {
  final response =
  await http.get(Uri.parse('https://www.freetogame.com/api/games'));

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    return jsonData.map((item) => Game.fromJson(item)).toList();
  } else {
    throw Exception('Gagal mengambil data game');
  }
}

Future<Map<String, dynamic>> fetchDataFromAPI(int idGame) async {
  final response =
  await http.get(Uri.parse('https://www.freetogame.com/api/game?id=$idGame'));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    if (jsonData != null && jsonData is Map<String, dynamic>) {
      return jsonData;
    } else {
      throw Exception('Data dari API tidak sesuai');
    }
  } else {
    throw Exception('Gagal mengambil data dari API');
  }
}
