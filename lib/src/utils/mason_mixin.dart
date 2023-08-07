import 'package:collection/collection.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:mason/mason.dart';
import 'package:package_config/package_config.dart';
import 'package:universal_io/io.dart';

import '../../bundle/tpl_template_name_bundle.dart';
import '../constants.dart';
import '../domain/config/template_yaml.dart';
import 'config_mixin.dart';
import 'console_mixin.dart';

/// Simple brick format
typedef SimpleBrick = (String name, String description, String source);

/// Basic operation with Mason CLI
mixin MasonMixin on ConsoleMixin, ConfigMixin {
  Future<String> get packageRootPath async {
    final packageConfig = await loadPackageConfigUri(Uri.base.resolve('.packages'));
    final pkg = packageConfig.packages.firstWhereOrNull(
      (element) => element.name == 'mason_brick_generator',
    );
    final packagePath = pkg?.root.toFilePath();
    // final packagePath = packageConfig.toPackageUri(Uri.parse(''))?.toFilePath();
    return packagePath ?? '';
  }

  /// Create a new folder structure
  Future<List<TemplateYaml>> getBricks() async {
    final config = await getConfig();
    return config.masonTpl;
  }

  ///
  Future<void> exists() async {}

  /// remove brick folder if exists
  Future<void> removeBrick(String name) async {
    final path = [Directory.current.path, Constants.bricksFolder, name].join(Platform.pathSeparator);
    final dir = Directory(path);
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }

  /// Create a new brick in folder structure
  Future<void> createBrick({required String name, String description = ''}) async {
    final folder = Directory(Constants.bricksFolder);
    if (!folder.existsSync()) folder.createSync(recursive: true);
    await removeBrick(name);
    final process = await Process.start(
      'mason',
      [
        'new',
        name,
        '--desc',
        description,
        '--hooks',
        '-o',
        Directory(Constants.bricksFolder).path,
      ],
      mode: ProcessStartMode.inheritStdio,
    );
    final exitCode = await process.exitCode;
    logInfo('Process exited with code: $exitCode');

    // process.stdin.transform(utf8.decoder).transform(const LineSplitter()).listen(
    //   (input) {
    //     logger.info('Received: $input');

    //     // Process the input or perform any desired actions

    //     if (input == 'exit') {
    //       // Exit the program if 'exit' is entered
    //       exit(0);
    //     }
    //   },
    //   onError: (error) {
    //     logger.err('Error: $error');
    //   },
    //   onDone: () {
    //     logger.warn('Done');
    //   },
    // );
  }

  Future<void> createPostgen() async {
    logger.alert('Do you want to continue?');
  }

  Future<void> makeFromBundle(TemplateYaml tpl) async {
    final vars = tpl.varsToJson();
    final generator = await MasonGenerator.fromBundle(tplTemplateNameBundle);
    final output = await generator.generate(
      DirectoryGeneratorTarget(Directory(tpl.templateTargetPath)),
      logger: logger,
      vars: vars,
    );
    await processBundle(tpl);
    logger.info('Generated: $output');
  }

  Future<void> processBundle(TemplateYaml tpl) async {
    final directory = Directory(tpl.templateTargetPath);
    if (!directory.existsSync()) directory.createSync(recursive: true);
    directory.listSync().whereType<File>().forEach((file) {
      var content = file.readAsStringSync();
      final data = {'vars': tpl.varsToJson()};
      content = content
          .replaceAll('tpl_template_name', tpl.name)
          .replaceAll('tpl_template_description', tpl.description)
          .replaceAll('vars:', json2yaml(data));
      file.writeAsStringSync(content);
    });
  }
}
