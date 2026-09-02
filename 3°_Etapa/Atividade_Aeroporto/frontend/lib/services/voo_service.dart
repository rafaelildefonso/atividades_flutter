import 'dart:convert';
import 'package:http/http.dart' as http;

class VooService {
  static const String baseUrl = 'http://127.0.0.1:5001';

  Future<Map<String, dynamic>> fetchVoos(String aeroporto, String tipo) async {
    final uri = Uri.parse(
      '$baseUrl/api/voos?aeroporto=$aeroporto&tipo=$tipo',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception(
        'Erro ao buscar voos (status ${response.statusCode})',
      );
    }
  }
}
