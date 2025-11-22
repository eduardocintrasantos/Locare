import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logging/logging.dart';

final log = Logger('ImobiliariaApi');

Future<void> salvarCasa(Map<String, dynamic> casa) async {
  final url = Uri.parse('http://192.168.0.244:8080/casa');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(casa),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // Sucesso
    log.info('Casa salva!');
    log.severe('Status: ${response.statusCode}, Body: ${response.body}');
  } else {
    // Erro
    log.severe('Erro ao salvar: ${response.body}');
    log.severe('Status: ${response.statusCode}, Body: ${response.body}');
  }
}
