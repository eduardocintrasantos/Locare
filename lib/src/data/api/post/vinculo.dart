import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logging/logging.dart';

final log = Logger('ImobiliariaApi');

Future<void> salvarVinculo(Map<String, dynamic> vinculo) async {
  final url = Uri.parse('http://192.168.0.244:8080/vinculo');
  final response = await http
      .post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(vinculo),
      )
      .timeout(const Duration(seconds: 3));

  if (response.statusCode == 201 || response.statusCode == 200) {
    log.info('Vínculo salvo!');
  } else {
    log.severe('Erro ao salvar: ${response.body}');
    log.severe('Status: ${response.statusCode}, Body: ${response.body}');
  }
}
