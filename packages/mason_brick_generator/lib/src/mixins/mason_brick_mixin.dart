part of 'mason_mixin.dart';

mixin MasonBrickMixin on MasonMixin {
  Future<void> makeTemplateFromBundle(TemplateYaml tpl) async {
    final generator = await MasonGenerator.fromBundle(mbgTemplateBundle);
    final data = {'vars': tpl.varsToJson()};
    final vars = <String, dynamic>{
      'mbg_header': stripHtmlIfNeeded(L.templateHeader),
      'mbg_template_name': stripHtmlIfNeeded(tpl.name),
      'mbg_template_description': stripHtmlIfNeeded(tpl.description),
      'mbg_template_vars': json2yaml(data),
      'mbg_brick_version': Constants.brickVersion,
      'mbg_mason_range': Constants.brickMasonRange,
    };
    await generator.generate(
      DirectoryGeneratorTarget(Directory(tpl.brickRootPath)),
      logger: logger,
      vars: vars,
    );
  }
}
