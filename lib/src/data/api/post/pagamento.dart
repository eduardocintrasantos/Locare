import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:logging/logging.dart';

final log = Logger('PagamentoApi');

Future<void> salvarPagamento(Map<String, dynamic> pagamento) async {
  print('🔵 salvarPagamento iniciado com: $pagamento');

  final url = Uri.parse('http://192.168.0.244:8080/pagamento');
  print('🔵 URL: $url');

  try {
    print('🔵 Enviando requisição POST...');
    final response = await http
        .post(
          url,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(pagamento),
        )
        .timeout(const Duration(seconds: 3));

    print('🔵 Status code: ${response.statusCode}');
    print('🔵 Response body: ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      log.info('Pagamento salvo!');
      print('✅ Pagamento salvo com sucesso!');
    } else {
      log.severe('Erro ao salvar: ${response.body}');
      log.severe('Status: ${response.statusCode}, Body: ${response.body}');
      print('❌ Erro ao salvar: ${response.statusCode}');
    }
  } catch (e, st) {
    print('❌ EXCEÇÃO em salvarPagamento: $e');
    print('Stack: $st');
    rethrow;
  }
}
