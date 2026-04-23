import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart';
import '../data/repository.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final repositoryProvider = Provider<CharacterRepository>((ref) {
  return CharacterRepository(ref.watch(databaseProvider));
});

final activeUniversesProvider = StreamProvider<List<Universe>>((ref) {
  return ref.watch(repositoryProvider).watchActiveUniverses();
});

final archivedUniversesProvider = StreamProvider<List<Universe>>((ref) {
  return ref.watch(repositoryProvider).watchArchivedUniverses();
});

final charactersByUniverseProvider =
    StreamProvider.family<List<Character>, String>((ref, universeId) {
  return ref.watch(repositoryProvider).watchCharactersByUniverse(universeId);
});

final universeWithDefsProvider =
    FutureProvider.family<UniverseWithDefs?, String>((ref, id) {
  return ref.watch(repositoryProvider).getUniverseWithDefs(id);
});

final characterFullProvider =
    FutureProvider.family<CharacterFull?, String>((ref, id) {
  return ref.watch(repositoryProvider).getCharacterFull(id);
});
