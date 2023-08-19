// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../constants.dart';
import '../../l.dart';

/// Base Exception for Mason Brick Generator
class MasonTplException implements Exception {
  const MasonTplException(this.message);
  final String message;
}

/// Configuration file not found on project
class MasonTplConfigFileNotFound extends MasonTplException {
  const MasonTplConfigFileNotFound() : super('${Constants.masonTplConfigFileName} ${L.notFound}');
}

/// Template not found in configuration
class TemplateNotFound extends MasonTplException {
  const TemplateNotFound(String? message) : super(message ?? 'Template not found');
}

/// Invalid format of template
class InvalidTemplate extends MasonTplException {
  const InvalidTemplate(String? message) : super(message ?? 'Invalid template format');
}

/// Mason is not initialized
class MasonNotInstalled extends MasonTplException {
  const MasonNotInstalled(this.path) : super('Mason is not installed yet.');
  final String path;

  @override
  String toString() => '$message $path';
}

class MasonNotInitialized extends MasonTplException {
  const MasonNotInitialized(this.path) : super('Mason is not initialized yet.');
  final String path;

  @override
  String toString() => '$message $path';
}

/// Mason Brick Generator is not initialized
class MasonTplNotInitialized extends MasonTplException {
  const MasonTplNotInitialized(this.path) : super('Mason Tpl not initialized');
  final String path;

  @override
  String toString() => '$message $path';
}

/// Folder manipulation failed
class FolderProcessingFailed extends MasonTplException {
  FolderProcessingFailed(String message) : super('''Folder processing failed\n\nerror: $message''');
}
