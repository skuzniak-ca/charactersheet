import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository.dart';
import '../../state/providers.dart';
import '../widgets/confirm_dialogs.dart';
import 'character_form_page.dart';

class CharacterDetailPage extends ConsumerWidget {
  final String characterId;
  const CharacterDetailPage({super.key, required this.characterId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(characterFullProvider(characterId));
    return Scaffold(
      appBar: AppBar(
        title: async.maybeWhen(
          data: (f) => Text(f?.character.name ?? 'Character'),
          orElse: () => const Text('Character'),
        ),
        actions: [
          IconButton(
            tooltip: 'Edit',
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final full = await ref
                  .read(repositoryProvider)
                  .getCharacterFull(characterId);
              if (full == null || !context.mounted) return;
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CharacterFormPage(
                    universeId: full.universe.id,
                    characterId: characterId,
                  ),
                ),
              );
              ref.invalidate(characterFullProvider(characterId));
            },
          ),
          IconButton(
            tooltip: 'Duplicate',
            icon: const Icon(Icons.copy_outlined),
            onPressed: () async {
              await ref.read(repositoryProvider).duplicateCharacter(characterId);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Character duplicated.')));
              }
            },
          ),
          IconButton(
            tooltip: 'Delete',
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final full = await ref
                  .read(repositoryProvider)
                  .getCharacterFull(characterId);
              if (full == null || !context.mounted) return;
              final deleted =
                  await confirmDeleteCharacter(context, ref, full.character);
              if (deleted && context.mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (f) {
          if (f == null) return const Center(child: Text('Character not found.'));
          return _Body(full: f);
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final CharacterFull full;
  const _Body({required this.full});

  @override
  Widget build(BuildContext context) {
    final c = full.character;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: c.imagePath != null
                  ? FileImage(File(c.imagePath!))
                  : null,
              child: c.imagePath == null
                  ? const Icon(Icons.person, size: 40)
                  : null,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(c.name,
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text(
                    [
                      if (c.race.isNotEmpty) c.race,
                      'Level ${c.level}',
                      if (c.status != 'active') c.status,
                    ].join(' • '),
                  ),
                  Text('Universe: ${full.universe.name}',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
        if (full.classes.isNotEmpty) ...[
          const SizedBox(height: 12),
          _section(context, 'Classes',
              full.classes.map((c) => '${c.className} ${c.classLevel}').join(', ')),
        ],
        if (full.statDefs.isNotEmpty)
          _wrapStats(
            context,
            'Stats',
            full.statDefs.map((s) {
              final label = s.abbreviation.isNotEmpty ? s.abbreviation : s.name;
              return '$label: ${full.statValues[s.id] ?? 0}';
            }).toList(),
          ),
        if (full.resourceDefs.isNotEmpty)
          _wrapStats(
            context,
            'Resource tracks',
            full.resourceDefs.map((t) {
              final v = full.resourceValues[t.id];
              return '${t.name}: ${v?.current ?? 0} / ${v?.maximum ?? 0}';
            }).toList(),
          ),
        if (full.currencyDefs.isNotEmpty)
          _wrapStats(
            context,
            'Currency',
            full.currencyDefs
                .map((cu) => '${cu.name}: ${full.currencyValues[cu.id] ?? 0}')
                .toList(),
          ),
        if (full.skillDefs.isNotEmpty)
          _wrapStats(
            context,
            'Skills',
            full.skillDefs.map((s) {
              final v = full.skillValues[s.id];
              final prof = v?.proficient == true ? '★ ' : '';
              return '$prof${s.name}: ${v?.value ?? 0}';
            }).toList(),
          ),
        if (full.inventory.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text('Inventory', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Card(
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Quality')),
                DataColumn(label: Text('Qty'), numeric: true),
                DataColumn(label: Text('Category')),
                DataColumn(label: Text('Eq.')),
              ],
              rows: [
                for (final i in full.inventory)
                  DataRow(cells: [
                    DataCell(Text(i.name)),
                    DataCell(Text(i.quality)),
                    DataCell(Text('${i.quantity}')),
                    DataCell(Text(i.category)),
                    DataCell(Icon(
                      i.equipped ? Icons.check_box : Icons.check_box_outline_blank,
                      size: 18,
                    )),
                  ]),
              ],
            ),
          ),
        ],
        if (c.backstory.isNotEmpty) ...[
          const SizedBox(height: 16),
          _section(context, 'Backstory', c.backstory),
        ],
        if (c.notes.isNotEmpty) ...[
          const SizedBox(height: 12),
          _section(context, 'Notes', c.notes),
        ],
      ],
    );
  }

  Widget _section(BuildContext context, String title, String body) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(body),
        ],
      ),
    );
  }

  Widget _wrapStats(BuildContext context, String title, List<String> items) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [for (final i in items) Chip(label: Text(i))],
          ),
        ],
      ),
    );
  }
}
