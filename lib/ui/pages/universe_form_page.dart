import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository.dart';
import '../../state/providers.dart';
import '../widgets/confirm_dialogs.dart';

class UniverseFormPage extends ConsumerStatefulWidget {
  final String? universeId;
  const UniverseFormPage({super.key, this.universeId});

  @override
  ConsumerState<UniverseFormPage> createState() => _UniverseFormPageState();
}

class _UniverseFormPageState extends ConsumerState<UniverseFormPage> {
  final _formKey = GlobalKey<FormState>();
  late UniverseDraft _draft;
  bool _loading = true;
  int _formRevision = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    if (widget.universeId == null) {
      _draft = UniverseDraft();
      setState(() => _loading = false);
      return;
    }
    final repo = ref.read(repositoryProvider);
    final u = await repo.getUniverseWithDefs(widget.universeId!);
    if (u == null) {
      if (mounted) Navigator.of(context).pop();
      return;
    }
    _draft = UniverseDraft(
      name: u.universe.name,
      playGroup: u.universe.playGroup,
      stats: u.stats
          .map((s) => StatDraft(
              id: s.id, name: s.name, abbreviation: s.abbreviation))
          .toList(),
      tracks: u.resourceTracks
          .map((t) => TrackDraft(id: t.id, name: t.name))
          .toList(),
      currencies: u.currencies
          .map((c) => TrackDraft(id: c.id, name: c.name))
          .toList(),
      skills: u.skills
          .map((s) => SkillDraft(
              id: s.id, name: s.name, linkedStatId: s.linkedStatId))
          .toList(),
    );
    setState(() => _loading = false);
  }

  Future<void> _importFromJson() async {
    final jsonStr = await pickJsonFile();
    if (jsonStr == null) return;
    try {
      final draft = universeDraftFromJson(jsonStr);
      setState(() {
        _draft = draft;
        _formRevision++;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not parse JSON: $e')),
      );
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final repo = ref.read(repositoryProvider);
    if (widget.universeId == null) {
      await repo.createUniverseFromDraft(_draft);
    } else {
      await repo.updateUniverseFromDraft(widget.universeId!, _draft);
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.universeId == null ? 'New Universe' : 'Edit Universe'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _save,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          key: ValueKey(_formRevision),
          padding: const EdgeInsets.all(16),
          children: [
            if (widget.universeId == null) ...[
              OutlinedButton.icon(
                icon: const Icon(Icons.file_download_outlined),
                label: const Text('Import from JSON'),
                onPressed: _importFromJson,
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
            ],
            TextFormField(
              initialValue: _draft.name,
              decoration: const InputDecoration(labelText: 'Universe name'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
              onChanged: (v) => _draft.name = v,
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _draft.playGroup,
              decoration: const InputDecoration(labelText: 'Play group'),
              onChanged: (v) => _draft.playGroup = v,
            ),
            const SizedBox(height: 24),
            _StatsSection(draft: _draft, onChanged: () => setState(() {})),
            const SizedBox(height: 24),
            _TracksSection(
              title: 'Resource tracks',
              hint: 'e.g. Hit Points, Sanity, Mana',
              list: _draft.tracks,
              onChanged: () => setState(() {}),
            ),
            const SizedBox(height: 24),
            _TracksSection(
              title: 'Currencies',
              hint: 'e.g. Gold, Credits, Eurodollars',
              list: _draft.currencies,
              onChanged: () => setState(() {}),
            ),
            const SizedBox(height: 24),
            _SkillsSection(draft: _draft, onChanged: () => setState(() {})),
            const SizedBox(height: 32),
            FilledButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save universe'),
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsSection extends StatelessWidget {
  final UniverseDraft draft;
  final VoidCallback onChanged;
  const _StatsSection({required this.draft, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Stats',
      onAdd: () {
        draft.stats.add(StatDraft());
        onChanged();
      },
      children: [
        for (var i = 0; i < draft.stats.length; i++)
          Padding(
            key: ValueKey('stat-${draft.stats[i].id}'),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    initialValue: draft.stats[i].name,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (v) => draft.stats[i].name = v,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: draft.stats[i].abbreviation,
                    decoration: const InputDecoration(labelText: 'Abbr'),
                    onChanged: (v) => draft.stats[i].abbreviation = v,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    final removedId = draft.stats[i].id;
                    draft.stats.removeAt(i);
                    for (final s in draft.skills) {
                      if (s.linkedStatId == removedId) s.linkedStatId = null;
                    }
                    onChanged();
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _TracksSection extends StatelessWidget {
  final String title;
  final String hint;
  final List<TrackDraft> list;
  final VoidCallback onChanged;
  const _TracksSection({
    required this.title,
    required this.hint,
    required this.list,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: title,
      subtitle: hint,
      onAdd: () {
        list.add(TrackDraft());
        onChanged();
      },
      children: [
        for (var i = 0; i < list.length; i++)
          Padding(
            key: ValueKey('track-${list[i].id}'),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: list[i].name,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (v) => list[i].name = v,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    list.removeAt(i);
                    onChanged();
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _SkillsSection extends StatelessWidget {
  final UniverseDraft draft;
  final VoidCallback onChanged;
  const _SkillsSection({required this.draft, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: 'Skills / proficiencies',
      onAdd: () {
        draft.skills.add(SkillDraft());
        onChanged();
      },
      children: [
        for (var i = 0; i < draft.skills.length; i++)
          Padding(
            key: ValueKey('skill-${draft.skills[i].id}'),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    initialValue: draft.skills[i].name,
                    decoration: const InputDecoration(labelText: 'Name'),
                    onChanged: (v) => draft.skills[i].name = v,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String?>(
                    initialValue: draft.skills[i].linkedStatId,
                    decoration: const InputDecoration(labelText: 'Linked stat'),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('—')),
                      for (final s in draft.stats)
                        DropdownMenuItem(value: s.id, child: Text(s.name)),
                    ],
                    onChanged: (v) {
                      draft.skills[i].linkedStatId = v;
                      onChanged();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () {
                    draft.skills.removeAt(i);
                    onChanged();
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback onAdd;
  final List<Widget> children;
  const _SectionCard({
    required this.title,
    this.subtitle,
    required this.onAdd,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleMedium),
                      if (subtitle != null)
                        Text(subtitle!,
                            style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  onPressed: onAdd,
                ),
              ],
            ),
            ...children,
          ],
        ),
      ),
    );
  }
}
