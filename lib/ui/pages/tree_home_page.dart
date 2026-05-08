import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../state/providers.dart';
import '../widgets/confirm_dialogs.dart';
import 'character_detail_page.dart';
import 'character_form_page.dart';
import 'universe_detail_page.dart';
import 'universe_form_page.dart';

class TreeHomePage extends ConsumerWidget {
  const TreeHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeUniversesProvider);
    final archived = ref.watch(archivedUniversesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Sheet'),
        actions: [
          IconButton(
            tooltip: 'Import universe from JSON',
            icon: const Icon(Icons.file_download_outlined),
            onPressed: () => _importUniverse(context, ref),
          ),
          IconButton(
            tooltip: 'New universe',
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const UniverseFormPage()),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          active.when(
            loading: () => const Center(child: Padding(
              padding: EdgeInsets.all(32), child: CircularProgressIndicator())),
            error: (e, _) => _Error(message: '$e'),
            data: (list) => Column(
              children: [
                if (list.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('No universes yet. Tap + to create one.'),
                  ),
                for (final u in list) _UniverseBlock(universe: u),
              ],
            ),
          ),
          archived.when(
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
            data: (list) {
              if (list.isEmpty) return const SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Divider(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Orphaned Characters',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  for (final u in list) _UniverseBlock(universe: u, archived: true),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _importUniverse(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final repo = ref.read(repositoryProvider);
    final picked = await pickJsonFile();
    if (picked == null) return;
    try {
      await repo.importUniverseFromJson(picked);
      messenger.showSnackBar(const SnackBar(content: Text('Universe imported.')));
    } catch (e) {
      messenger.showSnackBar(SnackBar(content: Text('Import failed: $e')));
    }
  }
}

class _UniverseBlock extends ConsumerStatefulWidget {
  final Universe universe;
  final bool archived;
  const _UniverseBlock({required this.universe, this.archived = false});

  @override
  ConsumerState<_UniverseBlock> createState() => _UniverseBlockState();
}

class _UniverseBlockState extends ConsumerState<_UniverseBlock> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final u = widget.universe;
    final characters = ref.watch(charactersByUniverseProvider(u.id));
    final scheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: widget.archived
                ? null
                : () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => UniverseDetailPage(universeId: u.id),
                      ),
                    ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(_expanded ? Icons.expand_more : Icons.chevron_right),
                    onPressed: () => setState(() => _expanded = !_expanded),
                  ),
                  Icon(
                    widget.archived ? Icons.archive_outlined : Icons.public,
                    color: scheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          u.name +
                              (widget.archived ? '  (archived)' : ''),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (u.playGroup.isNotEmpty)
                          Text(
                            u.playGroup,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                  if (widget.archived) ...[
                    TextButton.icon(
                      icon: const Icon(Icons.unarchive_outlined),
                      label: const Text('Restore'),
                      onPressed: () => _restore(context),
                    ),
                  ] else ...[
                    PopupMenuButton<String>(
                      onSelected: (v) => _handleAction(context, v),
                      itemBuilder: (_) => const [
                        PopupMenuItem(value: 'edit', child: Text('Edit universe')),
                        PopupMenuItem(value: 'export', child: Text('Export to JSON')),
                        PopupMenuItem(value: 'delete', child: Text('Delete universe')),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (_expanded)
            characters.when(
              loading: () => const Padding(
                padding: EdgeInsets.all(8),
                child: LinearProgressIndicator(),
              ),
              error: (e, _) => _Error(message: '$e'),
              data: (chars) => Column(
                children: [
                  for (final c in chars)
                    _CharacterRow(character: c, archivedUniverse: widget.archived),
                  if (!widget.archived)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(56, 0, 12, 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          icon: const Icon(Icons.add),
                          label: const Text('Add character'),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CharacterFormPage(universeId: u.id),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _handleAction(BuildContext context, String action) async {
    final repo = ref.read(repositoryProvider);
    final messenger = ScaffoldMessenger.of(context);
    final u = widget.universe;
    switch (action) {
      case 'edit':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => UniverseFormPage(universeId: u.id)),
        );
      case 'export':
        try {
          final jsonStr = await repo.exportUniverseToJson(u.id);
          await saveJsonFile(
            suggestedName: '${u.name}.universe.json',
            contents: jsonStr,
          );
          messenger.showSnackBar(const SnackBar(content: Text('Universe exported.')));
        } catch (e) {
          messenger.showSnackBar(SnackBar(content: Text('Export failed: $e')));
        }
      case 'delete':
        if (!context.mounted) return;
        await confirmDeleteUniverse(context, ref, u);
    }
  }

  Future<void> _restore(BuildContext context) async {
    final repo = ref.read(repositoryProvider);
    await repo.unarchiveUniverse(widget.universe.id);
  }
}

class _CharacterRow extends ConsumerWidget {
  final Character character;
  final bool archivedUniverse;
  const _CharacterRow({required this.character, this.archivedUniverse = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    Color statusColor() => switch (character.status) {
          'retired' => Colors.orange,
          'deceased' => Colors.redAccent,
          _ => scheme.primary,
        };
    return Padding(
      padding: const EdgeInsets.fromLTRB(56, 0, 8, 0),
      child: ListTile(
        dense: true,
        leading: Icon(Icons.person_outline, color: statusColor()),
        title: Text(character.name),
        subtitle: Text(
          [
            if (character.race.isNotEmpty) character.race,
            'Level ${character.level}',
            if (character.status != 'active') character.status,
          ].join(' • '),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (v) async {
            final repo = ref.read(repositoryProvider);
            final messenger = ScaffoldMessenger.of(context);
            switch (v) {
              case 'edit':
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CharacterFormPage(
                      universeId: character.universeId,
                      characterId: character.id,
                    ),
                  ),
                );
              case 'duplicate':
                await repo.duplicateCharacter(character.id);
                messenger.showSnackBar(
                    const SnackBar(content: Text('Character duplicated.')));
              case 'delete':
                if (!context.mounted) return;
                await confirmDeleteCharacter(context, ref, character);
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'edit', child: Text('Edit')),
            PopupMenuItem(value: 'duplicate', child: Text('Duplicate')),
            PopupMenuItem(value: 'delete', child: Text('Delete')),
          ],
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => CharacterDetailPage(characterId: character.id),
          ),
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  final String message;
  const _Error({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(message, style: TextStyle(color: Theme.of(context).colorScheme.error)),
    );
  }
}
