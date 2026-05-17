import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../data/repository.dart';
import '../../state/providers.dart';

const _uuid = Uuid();

class _ClassEntry {
  String className;
  int level;
  _ClassEntry({this.className = '', this.level = 1});
}

class _InventoryEntry {
  final String id;
  String name;
  String quality;
  int quantity;
  String description;
  bool equipped;
  String category;
  double weight;
  double value;
  _InventoryEntry({
    String? id,
    this.name = '',
    this.quality = '',
    this.quantity = 1,
    this.description = '',
    this.equipped = false,
    this.category = '',
    this.weight = 0,
    this.value = 0,
  }) : id = id ?? _uuid.v4();
}

class CharacterFormPage extends ConsumerStatefulWidget {
  final String universeId;
  final String? characterId;
  const CharacterFormPage({super.key, required this.universeId, this.characterId});

  @override
  ConsumerState<CharacterFormPage> createState() => _CharacterFormPageState();
}

class _CharacterFormPageState extends ConsumerState<CharacterFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = true;
  bool _saving = false;

  UniverseWithDefs? _defs;

  String _name = '';
  String _race = '';
  int _level = 1;
  String _backstory = '';
  String _notes = '';
  String _status = 'active';
  String? _imagePath;

  final List<_ClassEntry> _classes = [];
  final Map<String, int> _statValues = {};
  final Map<String, (int current, int maximum)> _resourceValues = {};
  final Map<String, int> _currencyValues = {};
  final Map<String, (int value, bool prof)> _skillValues = {};
  final List<_InventoryEntry> _inventory = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(repositoryProvider);
    final defs = await repo.getUniverseWithDefs(widget.universeId);
    if (defs == null) {
      if (mounted) Navigator.of(context).pop();
      return;
    }
    _defs = defs;

    if (widget.characterId != null) {
      final full = await repo.getCharacterFull(widget.characterId!);
      if (full == null) {
        if (mounted) Navigator.of(context).pop();
        return;
      }
      _name = full.character.name;
      _race = full.character.race;
      _level = full.character.level;
      _backstory = full.character.backstory;
      _notes = full.character.notes;
      _status = full.character.status;
      _imagePath = full.character.imagePath;
      for (final c in full.classes) {
        _classes.add(_ClassEntry(className: c.className, level: c.classLevel));
      }
      _statValues.addAll(full.statValues);
      for (final e in full.resourceValues.entries) {
        _resourceValues[e.key] = (e.value.current, e.value.maximum);
      }
      _currencyValues.addAll(full.currencyValues);
      for (final e in full.skillValues.entries) {
        _skillValues[e.key] = (e.value.value, e.value.proficient);
      }
      for (final i in full.inventory) {
        _inventory.add(_InventoryEntry(
          id: i.id,
          name: i.name,
          quality: i.quality,
          quantity: i.quantity,
          description: i.description,
          equipped: i.equipped,
          category: i.category,
          weight: i.weight,
          value: i.itemValue,
        ));
      }
    }

    for (final s in defs.stats) {
      _statValues.putIfAbsent(s.id, () => 10);
    }
    for (final t in defs.resourceTracks) {
      _resourceValues.putIfAbsent(t.id, () => (0, 0));
    }
    for (final c in defs.currencies) {
      _currencyValues.putIfAbsent(c.id, () => 0);
    }
    for (final s in defs.skills) {
      _skillValues.putIfAbsent(s.id, () => (0, false));
    }

    setState(() => _loading = false);
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
    );
    if (result == null || result.files.isEmpty) return;
    final src = result.files.single.path;
    if (src == null) return;
    final dir = await getApplicationSupportDirectory();
    final imagesDir = Directory(p.join(dir.path, 'character_images'));
    if (!await imagesDir.exists()) await imagesDir.create(recursive: true);
    final ext = p.extension(src);
    final dest = p.join(imagesDir.path, '${_uuid.v4()}$ext');
    await File(src).copy(dest);
    setState(() => _imagePath = dest);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final repo = ref.read(repositoryProvider);

    String id;
    if (widget.characterId == null) {
      id = await repo.createCharacter(
        universeId: widget.universeId,
        name: _name,
      );
    } else {
      id = widget.characterId!;
    }

    await repo.updateCharacter(
      id: id,
      name: _name,
      race: _race,
      level: _level,
      backstory: _backstory,
      imagePath: _imagePath,
      status: _status,
      notes: _notes,
      classes: _classes
          .where((c) => c.className.trim().isNotEmpty)
          .map((c) => (className: c.className, level: c.level))
          .toList(),
      statValues: Map<String, int>.from(_statValues),
      resourceValues: {
        for (final e in _resourceValues.entries)
          e.key: (current: e.value.$1, maximum: e.value.$2),
      },
      currencyValues: Map<String, int>.from(_currencyValues),
      skillValues: {
        for (final e in _skillValues.entries)
          e.key: (value: e.value.$1, proficient: e.value.$2),
      },
      inventory: _inventory
          .where((i) => i.name.trim().isNotEmpty)
          .map((i) => InventoryItemEntry(
                id: i.id,
                name: i.name,
                quality: i.quality,
                quantity: i.quantity,
                description: i.description,
                equipped: i.equipped,
                category: i.category,
                weight: i.weight,
                value: i.value,
              ))
          .toList(),
    );

    ref.invalidate(characterFullProvider(id));
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading || _defs == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final defs = _defs!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.characterId == null ? 'New Character' : 'Edit Character'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saving ? null : _save,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _portrait(),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: _name,
              decoration: const InputDecoration(labelText: 'Character name'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
              onChanged: (v) => _name = v,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    initialValue: _race,
                    decoration: const InputDecoration(labelText: 'Race'),
                    onChanged: (v) => _race = v,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    initialValue: '$_level',
                    decoration: const InputDecoration(labelText: 'Level'),
                    keyboardType: TextInputType.number,
                    onChanged: (v) => _level = int.tryParse(v) ?? _level,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    initialValue: _status,
                    decoration: const InputDecoration(labelText: 'Status'),
                    items: const [
                      DropdownMenuItem(value: 'active', child: Text('Active')),
                      DropdownMenuItem(value: 'retired', child: Text('Retired')),
                      DropdownMenuItem(value: 'deceased', child: Text('Deceased')),
                    ],
                    onChanged: (v) {
                      if (v != null) setState(() => _status = v);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _classesSection(),
            const SizedBox(height: 16),
            if (defs.stats.isNotEmpty) _statsSection(defs),
            if (defs.resourceTracks.isNotEmpty) _resourcesSection(defs),
            if (defs.currencies.isNotEmpty) _currenciesSection(defs),
            if (defs.skills.isNotEmpty) _skillsSection(defs),
            const SizedBox(height: 16),
            _inventorySection(),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: _backstory,
              decoration: const InputDecoration(
                labelText: 'Backstory',
                alignLabelWithHint: true,
              ),
              maxLines: 6,
              onChanged: (v) => _backstory = v,
            ),
            const SizedBox(height: 12),
            TextFormField(
              initialValue: _notes,
              decoration: const InputDecoration(
                labelText: 'Session notes / journal',
                alignLabelWithHint: true,
              ),
              maxLines: 6,
              onChanged: (v) => _notes = v,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              icon: const Icon(Icons.save),
              label: Text(_saving ? 'Saving…' : 'Save character'),
              onPressed: _saving ? null : _save,
            ),
          ],
        ),
      ),
    );
  }

  Widget _portrait() {
    return Row(
      children: [
        CircleAvatar(
          radius: 48,
          backgroundImage:
              _imagePath != null ? FileImage(File(_imagePath!)) : null,
          child: _imagePath == null
              ? const Icon(Icons.person, size: 48)
              : null,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.image_outlined),
              label: Text(_imagePath == null ? 'Add portrait' : 'Change portrait'),
              onPressed: _pickImage,
            ),
            if (_imagePath != null)
              TextButton.icon(
                icon: const Icon(Icons.close),
                label: const Text('Remove'),
                onPressed: () => setState(() => _imagePath = null),
              ),
          ],
        ),
      ],
    );
  }

  Widget _classesSection() {
    return _SectionCard(
      title: 'Classes',
      onAdd: () => setState(() => _classes.add(_ClassEntry())),
      children: [
        for (var i = 0; i < _classes.length; i++)
          Padding(
            key: ValueKey('class-$i-${_classes[i].hashCode}'),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    initialValue: _classes[i].className,
                    decoration: const InputDecoration(labelText: 'Class'),
                    onChanged: (v) => _classes[i].className = v,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: '${_classes[i].level}',
                    decoration: const InputDecoration(labelText: 'Level'),
                    keyboardType: TextInputType.number,
                    onChanged: (v) =>
                        _classes[i].level = int.tryParse(v) ?? _classes[i].level,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => setState(() => _classes.removeAt(i)),
                ),
              ],
            ),
          ),
        if (_classes.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('No classes added.'),
          ),
      ],
    );
  }

  Widget _statsSection(UniverseWithDefs defs) {
    return _SectionCard(
      title: 'Stats',
      onAdd: null,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final s in defs.stats)
              SizedBox(
                width: 140,
                child: TextFormField(
                  key: ValueKey('stat-${s.id}'),
                  initialValue: '${_statValues[s.id] ?? 0}',
                  decoration: InputDecoration(
                    labelText: s.abbreviation.isNotEmpty
                        ? '${s.name} (${s.abbreviation})'
                        : s.name,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      _statValues[s.id] = int.tryParse(v) ?? _statValues[s.id] ?? 0,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _resourcesSection(UniverseWithDefs defs) {
    return _SectionCard(
      title: 'Resource tracks',
      onAdd: null,
      children: [
        for (final t in defs.resourceTracks)
          Padding(
            key: ValueKey('res-${t.id}'),
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Expanded(flex: 3, child: Text(t.name)),
                Expanded(
                  child: TextFormField(
                    initialValue: '${_resourceValues[t.id]?.$1 ?? 0}',
                    decoration: const InputDecoration(labelText: 'Current'),
                    keyboardType: TextInputType.number,
                    onChanged: (v) {
                      final cur = int.tryParse(v) ?? 0;
                      final max = _resourceValues[t.id]?.$2 ?? 0;
                      _resourceValues[t.id] = (cur, max);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: '${_resourceValues[t.id]?.$2 ?? 0}',
                    decoration: const InputDecoration(labelText: 'Max'),
                    keyboardType: TextInputType.number,
                    onChanged: (v) {
                      final max = int.tryParse(v) ?? 0;
                      final cur = _resourceValues[t.id]?.$1 ?? 0;
                      _resourceValues[t.id] = (cur, max);
                    },
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _currenciesSection(UniverseWithDefs defs) {
    return _SectionCard(
      title: 'Currency',
      onAdd: null,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final c in defs.currencies)
              SizedBox(
                width: 160,
                child: TextFormField(
                  key: ValueKey('curr-${c.id}'),
                  initialValue: '${_currencyValues[c.id] ?? 0}',
                  decoration: InputDecoration(labelText: c.name),
                  keyboardType: TextInputType.number,
                  onChanged: (v) =>
                      _currencyValues[c.id] = int.tryParse(v) ?? 0,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _skillsSection(UniverseWithDefs defs) {
    return _SectionCard(
      title: 'Skills',
      onAdd: null,
      children: [
        for (final s in defs.skills)
          Padding(
            key: ValueKey('skill-${s.id}'),
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(flex: 3, child: Text(s.name)),
                Expanded(
                  child: TextFormField(
                    initialValue: '${_skillValues[s.id]?.$1 ?? 0}',
                    decoration: const InputDecoration(labelText: 'Value'),
                    keyboardType: TextInputType.number,
                    onChanged: (v) {
                      final val = int.tryParse(v) ?? 0;
                      final prof = _skillValues[s.id]?.$2 ?? false;
                      _skillValues[s.id] = (val, prof);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    Checkbox(
                      value: _skillValues[s.id]?.$2 ?? false,
                      onChanged: (v) {
                        setState(() {
                          final val = _skillValues[s.id]?.$1 ?? 0;
                          _skillValues[s.id] = (val, v ?? false);
                        });
                      },
                    ),
                    const Text('Prof.'),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _inventorySection() {
    return _SectionCard(
      title: 'Inventory',
      onAdd: () => setState(() => _inventory.add(_InventoryEntry())),
      children: [
        if (_inventory.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('No inventory items yet.'),
          ),
        for (var i = 0; i < _inventory.length; i++)
          Card(
            key: ValueKey('inv-${_inventory[i].id}'),
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          initialValue: _inventory[i].name,
                          decoration: const InputDecoration(labelText: 'Name'),
                          onChanged: (v) => _inventory[i].name = v,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: _inventory[i].quality,
                          decoration: const InputDecoration(labelText: 'Quality'),
                          onChanged: (v) => _inventory[i].quality = v,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          initialValue: '${_inventory[i].quantity}',
                          decoration: const InputDecoration(labelText: 'Qty'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) =>
                              _inventory[i].quantity = int.tryParse(v) ?? 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () =>
                            setState(() => _inventory.removeAt(i)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: _inventory[i].category,
                          decoration: const InputDecoration(labelText: 'Category'),
                          onChanged: (v) => _inventory[i].category = v,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          initialValue: '${_inventory[i].weight}',
                          decoration: const InputDecoration(labelText: 'Weight'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) =>
                              _inventory[i].weight = double.tryParse(v) ?? 0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          initialValue: '${_inventory[i].value}',
                          decoration: const InputDecoration(labelText: 'Value'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) =>
                              _inventory[i].value = double.tryParse(v) ?? 0,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          Checkbox(
                            value: _inventory[i].equipped,
                            onChanged: (v) => setState(
                                () => _inventory[i].equipped = v ?? false),
                          ),
                          const Text('Eq.'),
                        ],
                      ),
                    ],
                  ),
                  TextFormField(
                    initialValue: _inventory[i].description,
                    decoration:
                        const InputDecoration(labelText: 'Description'),
                    maxLines: 2,
                    onChanged: (v) => _inventory[i].description = v,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final VoidCallback? onAdd;
  final List<Widget> children;
  const _SectionCard({
    required this.title,
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
                  child:
                      Text(title, style: Theme.of(context).textTheme.titleMedium),
                ),
                if (onAdd != null)
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
