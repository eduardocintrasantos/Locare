import 'package:flutter/material.dart';
import 'package:locare/src/main_app.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Supabase
  await Supabase.initialize(
    url: 'https://emboqceskqauqhmactde.supabase.co',
    anonKey: 'sb_publishable_EJz0uijlI3Y-AYL3sOgacg_y9SGp5wJ',
  );

  runApp(const MainApp());
}
