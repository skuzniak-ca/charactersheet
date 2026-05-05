import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/database.dart';
import '../../state/providers.dart';

Future<bool> confirmDeleteCharacter(
    BuildContext context, WidgetRef ref, Character character) async {
  final first = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('Delete ${character.name}?'),
      content: const Text(
          'This will permanently remove the character and their inventory.'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel')),
        FilledButton.tonal(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Continue')),
      ],
    ),
  );
  if (first != true) return false;

  if (!context.mounted) return false;
  final second = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Are you absolutely sure?'),
      content: Text('${character.name} will be permanently deleted.'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel')),
        FilledButton(
          style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error),
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('Delete'),
        ),
      ],
    ),
  );
  if (second != true) return false;

  await ref.read(repositoryProvider).deleteCharacter(character.id);
  return true;
}

Future<bool> confirmDeleteUniverse(
    BuildContext context, WidgetRef ref, Universe universe) async {
  final messenger = ScaffoldMessenger.of(context);
  final repo = ref.read(repositoryProvider);

  final charCount =
      (await repo.watchCharactersByUniverse(universe.id).first).length;

  if (!context.mounted) return false;
  final cascadeChoice = await showDialog<_CascadeChoice>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('Delete ${universe.name}?'),
      content: Text(charCount == 0
          ? 'This universe has no characters. It will be removed.'
          : 'This universe has $charCount character(s). What should we do with them?'),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx, _CascadeChoice.cancel),
            child: const Text('Cancel')),
        if (charCount > 0)
          TextButton(
            onPressed: () => Navigator.pop(ctx, _CascadeChoice.orphan),
            child: const Text('Keep characters (orphan)'),
          ),
        FilledButton(
          style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error),
          onPressed: () => Navigator.pop(ctx, _CascadeChoice.cascade),
          child: Text(charCount == 0 ? 'Delete' : 'Delete everything'),
        ),
      ],
    ),
  );
  if (cascadeChoice == null || cascadeChoice == _CascadeChoice.cancel) {
    return false;
  }

  if (!context.mounted) return false;
  final confirm = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Are you absolutely sure?'),
      content: Text(switch (cascadeChoice) {
        _CascadeChoice.cascade =>
          '${universe.name} and all its characters will be permanently deleted.',
        _CascadeChoice.orphan =>
          '${universe.name} will be archived and its characters moved to "Orphaned Characters".',
        _ => '',
      }),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel')),
        FilledButton(
          style: FilledButton.styleFrom(
              backgroundColor: cascadeChoice == _CascadeChoice.cascade
                  ? Theme.of(ctx).colorScheme.error
                  : null),
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(cascadeChoice == _CascadeChoice.cascade
              ? 'Delete'
              : 'Archive'),
        ),
      ],
    ),
  );
  if (confirm != true) return false;

  switch (cascadeChoice) {
    case _CascadeChoice.cascade:
      await repo.deleteUniverseCascade(universe.id);
      messenger.showSnackBar(SnackBar(content: Text('${universe.name} deleted.')));
    case _CascadeChoice.orphan:
      await repo.archiveUniverse(universe.id);
      messenger
          .showSnackBar(SnackBar(content: Text('${universe.name} archived.')));
    case _CascadeChoice.cancel:
      break;
  }
  return true;
}

enum _CascadeChoice { cancel, cascade, orphan }

Future<String?> pickJsonFile() async {
  final result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['json'],
  );
  if (result == null || result.files.isEmpty) return null;
  final path = result.files.single.path;
  if (path == null) return null;
  return File(path).readAsString();
}

Future<void> saveJsonFile({
  required String suggestedName,
  required String contents,
}) async {
  final path = await FilePicker.saveFile(
    dialogTitle: 'Export universe',
    fileName: suggestedName,
    type: FileType.custom,
    allowedExtensions: ['json'],
  );
  if (path == null) return;
  await File(path).writeAsString(contents);
}
