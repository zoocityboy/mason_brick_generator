import '../domain/config/template_yaml.dart';
import '../localisation.dart';
import 'config_mixin.dart';
import 'console_mixin.dart';
import 'mason_mixin.dart';

mixin ValidateMixin on ConsoleMixin, ConfigMixin, MasonMixin {
  Future<void> validate() async {
    final progress = logger.progress(Localisation.listProcessing);
    final config = await getConfig();
    progress.complete();
    for (final tpl in config.temaplates) {
      final progress = logger.progress(' ⌙ ${tpl.name} - ${Localisation.processing}');
      try {
        await validateTemplate(tpl);
        progress.complete(' ⌙ ${tpl.name} - success');
      } catch (e) {
        progress.fail(' ⌙ ${tpl.name} - $e');
        rethrow;
      }
    }
  }

  Future<void> validateTemplate(TemplateYaml template) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    throw Exception('not valid');
  }
}
