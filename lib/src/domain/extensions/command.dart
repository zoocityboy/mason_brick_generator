import 'dart:collection';
import 'dart:math' as math;

import 'package:args/command_runner.dart';
// ignore: implementation_imports
import 'package:args/src/utils.dart' as utils;

import '../../constants.dart';
import '../../localisation.dart';

extension CommandX<T> on Command<T> {
  String toUsage() {
    return extWrap('${Localisation.icon} $description\n\n') + usageWithoutDescription;
  }

  String extWrap(String text, {int? hangingIndent}) {
    return utils.wrapText(text, length: argParser.usageLineLength, hangingIndent: hangingIndent);
  }

  String get usageWithoutDescription {
    final length = argParser.usageLineLength;
    const usagePrefix = 'Usage: ';
    final buffer = StringBuffer()
      ..writeln(usagePrefix + extWrap(invocation, hangingIndent: usagePrefix.length))
      ..writeln(argParser.usage);

    if (subcommands.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln(
          _getCommandUsage(
            subcommands,
            isSubcommand: true,
            lineLength: length,
          ),
        );
    }

    buffer
      ..writeln()
      ..write(extWrap('Run "${runner!.executableName} help" to see global options.'));

    if (usageFooter != null) {
      buffer
        ..writeln()
        ..write(extWrap(usageFooter!));
    }

    return buffer.toString();
  }

  /// Returns a string representation of [commands] fit for use in a usage string.
  ///
  /// [isSubcommand] indicates whether the commands should be called "commands" or
  /// "subcommands".
  String _getCommandUsage(Map<String, Command<T>> commands, {bool isSubcommand = false, int? lineLength}) {
    // Don't include aliases.
    var names = commands.keys.where((name) => !commands[name]!.aliases.contains(name));

    // Filter out hidden ones, unless they are all hidden.
    final visible = names.where((name) => !commands[name]!.hidden);
    if (visible.isNotEmpty) names = visible;

    // Show the commands alphabetically.
    names = names.toList()..sort();

    // Group the commands by category.
    final commandsByCategory = SplayTreeMap<String, List<Command<T>>>();
    for (final name in names) {
      final category = commands[name]!.category;
      commandsByCategory.putIfAbsent(category, () => []).add(commands[name]!);
    }
    final categories = commandsByCategory.keys.toList();

    final length = names.map((name) => name.length).reduce(math.max);

    final buffer = StringBuffer('Available ${isSubcommand ? "sub" : ""}commands:');
    final columnStart = length + 5;
    for (final category in categories) {
      if (category != '') {
        buffer
          ..writeln()
          ..writeln()
          ..write(category);
      }
      for (final command in commandsByCategory[category]!) {
        final lines = utils.wrapTextAsLines(command.summary, start: columnStart, length: lineLength);
        buffer
          ..writeln()
          ..write('  ${utils.padRight(command.name, length)}   ${lines.first}');

        for (final line in lines.skip(1)) {
          buffer
            ..writeln()
            ..write(' ' * columnStart)
            ..write(line);
        }
      }
    }

    return buffer.toString();
  }
}
