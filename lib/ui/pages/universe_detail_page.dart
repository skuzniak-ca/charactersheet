import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/providers.dart';
import '../widgets/confirm_dialogs.dart';
import 'character_form_page.dart';
import 'universe_form_page.dart';

class UniverseDetailPage extends ConsumerWidget {
  final String universeId;
  const UniverseDetailPage({super.key, required this.universeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defs = ref.watch(universeWithDefsProvider(universeId));
    final chars = ref.watch(charactersByUniverseProvider(universeId));

    return Scaffold(
      appBar: AppBar(
        title: defs.maybeWhen(
          data: (d) => Text(d?.universe.name ?? 'Universe'),
          orElse: () => const Text('Universe'),
        ),
        actions: [
          IconButton(
            tooltip: 'Edit',
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => UniverseFormPage(universeId: universeId),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Delete',
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              final u = await ref
                  .read(repositoryProvider)
                  .getUniverseWithDefs(universeId);
              if (u == null || !context.mounted) return;
              final deleted = await confirmDeleteUniverse(context, ref, u.universe);
              if (deleted && context.mounted) Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: defs.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (d) {
          if (d == null) return const Center(child: Text('Universe not found.'));
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (d.universe.playGroup.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text('Play group: ${d.universe.playGroup}',
                      style: Theme.of(context).textTheme.titleSmall),
                ),
              _DefList(title: 'Stats', items: [
                for (final s in d.stats)
                  '${s.name}${s.abbreviation.isNotEmpty ? ' (${s.abbreviation})' : ''}',
              ]),
              _DefList(
                title: 'Resource tracks',
                items: d.resourceTracks.map((t) => t.name).toList(),
              ),
              _DefList(
                title: 'Currencies',
                items: d.currencies.map((c) => c.name).toList(),
              ),
              _DefList(
                title: 'Skills / proficiencies',
                items: d.skills.map((s) {
                  if (s.linkedStatId == null) return s.name;
                  final stat = d.stats.where((x) => x.id == s.linkedStatId);
                  if (stat.isEmpty) return s.name;
                  return '${s.name} (${stat.first.abbreviation.isNotEmpty ? stat.first.abbreviation : stat.first.name})';
                }).toList(),
              ),
              const SizedBox(height: 16),
              Text('Characters', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              chars.when(
                loading: () => const LinearProgressIndicator(),
                error: (e, _) => Text('$e'),
                data: (list) {
                  if (list.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text('No characters yet.'),
                    );
                  }
                  return Column(
                    children: [
                      for (final c in list)
                        ListTile(
                          leading: const Icon(Icons.person_outline),
                          title: Text(c.name),
                          subtitle: Text(
                            [
                              if (c.race.isNotEmpty) c.race,
                              'Level ${c.level}',
                            ].join(' • '),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CharacterFormPage(
                                universeId: universeId,
                                characterId: c.id,
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add character'),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CharacterFormPage(universeId: universeId),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DefList extends StatelessWidget {
  final String title;
  final List<String> items;
  const _DefList({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
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
