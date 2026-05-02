import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/seed.dart';
import 'state/providers.dart';
import 'ui/pages/tree_home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: CharacterSheetApp()));
}

class CharacterSheetApp extends ConsumerStatefulWidget {
  const CharacterSheetApp({super.key});

  @override
  ConsumerState<CharacterSheetApp> createState() => _CharacterSheetAppState();
}

class _CharacterSheetAppState extends ConsumerState<CharacterSheetApp> {
  late final Future<void> _seedFuture;

  @override
  void initState() {
    super.initState();
    _seedFuture = seedDefaultUniversesIfEmpty(ref.read(databaseProvider));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Character Sheet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<void>(
        future: _seedFuture,
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return const TreeHomePage();
        },
      ),
    );
  }
}
