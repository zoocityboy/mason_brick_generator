// ignore_for_file: public_member_api_docs, sort_constructors_first

/// Base Exception for Mason Template
class MasonTplException implements Exception {
  const MasonTplException(this.message);
  final String message;
}

/// Configuration file not found on project
class MasonTplConfigFileNotFound extends MasonTplException {
  const MasonTplConfigFileNotFound() : super('mason_tpl.yaml not found');
}

/// Template not found in configuration
class TemplateNotFound extends MasonTplException {
  const TemplateNotFound() : super('Template not found');
}

/// Invalid format of template
class InvalidTemplate extends MasonTplException {
  const InvalidTemplate() : super('Invalid template format');
}

/// Mason is not initialized
class MasonNotInitialized extends MasonTplException {
  const MasonNotInitialized(this.path) : super('Mason not initialized');
  final String path;

  @override
  String toString() => '$message $path';
}

/// Mason Template is not initialized
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
