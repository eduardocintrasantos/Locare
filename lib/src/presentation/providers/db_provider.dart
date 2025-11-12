// src/presentation/providers/db_provider.dart
// Expõe FutureProvider<Isar> e seed opcional.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../data/sources/isar_source.dart';

final isarSourceProvider = Provider<IsarSource>((ref) => IsarSource());

final isarProvider = FutureProvider<Isar>((ref) async {
  final src = ref.read(isarSourceProvider);
  // Ative o seed se desejar dados iniciais:
  await src.seedIfEmpty();
  return src.db;
});
