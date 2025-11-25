/*import 'package:http/http.dart' as http;
import 'package:locare/src/data/api/post/imobiliaria.dart';
import 'package:locare/src/data/api/post/casa.dart';
import 'package:locare/src/data/sources/isar_source.dart';
import 'package:locare/src/domain/entities/casa.dart';
import 'package:locare/src/domain/entities/imobiliaria.dart';

Future<void> refreshDashboard() async {
  // 1. Verifica conexão
  final pingResponse =
      await http.get(Uri.parse('http://192.168.0.244:8080/ping'));
  if (pingResponse.statusCode == 200) {
    print('API conectada!');

    // 2. Lista de imobiliárias e casas locais
    final imobiliarias =
        await getImobiliariasLocais(); // Função que retorna lista local
    final casas = await getCasasLocais(); // Função que retorna lista local

    // 3. Tenta cadastrar imobiliárias
    for (var im in imobiliarias) {
      if (!await existeImobiliariaNoBackend(im.id)) {
        await salvarImobiliaria(im.toJson());
      }
    }

    // 4. Tenta cadastrar casas
    for (var casa in casas) {
      if (!await existeCasaNoBackend(casa.id)) {
        await salvarCasa(casa.toJson());
      }
    }

    // 5. (Futuro) GET das imobiliárias/casas e salvar no Isar
    // await sincronizarComBackend();
  } else {
    print('API não conectada!');
  }
}

// Exemplo: Retorna lista de imobiliárias do Isar/local
Future<List<Imobiliaria>> getImobiliariasLocais() async {
  // Implemente conforme seu repositório/local
  return await IsarSource().getAllImobiliarias();
}

Future<List<Casa>> getCasasLocais() async {
  // Implemente conforme seu repositório/local
  return await IsarSource().getAllCasas();
}

Future<bool> existeImobiliariaNoBackend(int id) async {
  final url = Uri.parse('http://192.168.0.244:8080/imobiliaria/$id');
  final response = await http.get(url);
  return response.statusCode == 200;
}

Future<bool> existeCasaNoBackend(int id) async {
  final url = Uri.parse('http://192.168.0.244:8080/casa/$id');
  final response = await http.get(url);
  return response.statusCode == 200;
}*/
