part of 'mason_mixin.dart';

mixin MasonWorkspaceMixin on MasonMixin {
  Future<void> makeWorkspaceFromBundle() async {
    final generator = await MasonGenerator.fromBundle(mbgWorkspaceBundle);
    await generator.generate(
      DirectoryGeneratorTarget(Directory.current),
      logger: logger,
      vars: {
        'mbg_name': 'Mason Brick Generator - wildest animal in the zoo.',
        'mbg_description': 'This is configuration file for Mason Brick Generator',
        'mbg_file_class_name': '{{name.snakeCase()}}',
        'mbg_var_class_name': '{{name.pascalCase()}}',
      },
    );
  }
}
