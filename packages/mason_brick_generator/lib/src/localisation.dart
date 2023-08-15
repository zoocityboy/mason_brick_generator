import 'package:meta/meta.dart';

@protected
abstract class Localisation {
  // Generic
  static const String generating = 'Generator is processing';
  static const String processing = 'Processing';
  static const String generatingReplaceContent = 'Processing content...';
  static const String generatingReplacePath = 'Processing paths...';
  static const String postprocessing = 'Postprocessing...';
  static const String icon = '⚒️ ';

  /// TUI settings
  static const String cmd = 'mason_brick_generator';
  static const String cmdDescription =
      '$icon Mason Brick Generator\n\n  Create a Brick template from your runnable sample code.';
  static const String cmdFooter = '\nCreated by 🦏 zoocityboy See https://github.com/zoocityboy/mason-brick-generator';

  /// Options
  static const templateKey = 'template';
  static const templateHelp = 'Selecte available template for processing.';

  /// Commands
  static const initCommandName = 'init';
  static const initCommandDescription = 'Initialize Mason Brick Generator for project.';

  static const listCommandName = 'list';
  static const listCommandDescription = 'List all available templates.';
  static const listProcessing = processing;

  static const validateCommandName = 'validate';
  static const validateCommandDescription = 'Validate template settings.';
  static const validateProcessing = processing;

  static const generateCommandName = 'generate';
  static const generateCommandDescription = 'Generate selected brick template from source code.';
  static const generateProcessing = processing;
  static const generateChoosen = 'Choosen templates:';

  static const discoverCommandName = 'discover';
  static const discoverCommandDescription = 'Discover potenional templates in your project.';
  static const disocoverProcessing = 'Discovering';
  static const discoverNotFoundNew = 'New templates not found';
}
