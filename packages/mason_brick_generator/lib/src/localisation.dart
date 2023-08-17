import 'package:mason_logger/mason_logger.dart';
import 'package:meta/meta.dart';

@protected
abstract class Localisation {
  // Generic
  static const String generating = 'Generator is processing';
  static const String processing = 'Processing';
  static const String generatingReplaceContent = 'Processing content...';
  static const String generatingReplacePath = 'Processing paths...';
  static const String postprocessing = 'Postprocessing...';
  static const String icon = '🦺 ';

  /// TUI settings
  static const String cmd = 'mason_brick_generator';
  static const String cmdDescription =
      '$icon Mason Brick Generator\n\n  Create a Brick template from your runnable sample code.';
  static final String cmdLink = link(
    uri: Uri.parse('https://github.com/zoocityboy/mason-brick-generator'),
    message: 'Mason Brick Generator',
  );
  static final String cmdFooter = '\nCreated by 🦏 zoocityboy.\n ⌙ GitHub: $cmdLink \n ⌙ Documentation: $cmdLink.';

  /// Options
  static const templateKey = 'template';
  static const templateHelp = 'Selecte available template for processing.';

  /// Commands
  static const initCommandName = 'init';
  static const initCommandDescription = 'Initialize Mason Brick Generator for project.';
  static const initCleanCommandName = 'clean';
  static const initCleanCommandDescription = 'Re-create new workspace.';
  static const initCleanProcessing = 'Cleaning workspace...';
  static const initCleanProcessingSuccess = 'Workspace cleaned.';

  static const initQuestionInstallMason = 'Mason is not instaled in your computer.';
  static const initQuestionInititalizeMason = 'Mason is not initialized in your project.';
  static const initPromptInititalizeMason = '👋 Do you want to add Mason to your project?';
  static const initProcessingMasonInstallation = 'Mason installation';
  static const initProcessingMasonInitialization = 'Mason initialization';
  static const initProcessingMbg = 'Mason Brick Generator initialization';
  static const initProcessingMbgSuccess = 'Mason Brick Generator initialized';

  static const listCommandName = 'list';
  static const listCommandDescription = 'List all available templates.';
  static const listProcessing = processing;
  static const listResultLabel = 'Available templates';
  static const listPrompGenerte = '👋 Do you want to generate brick from template?';

  static const validateCommandName = 'validate';
  static const validateCommandDescription = 'Validate template settings.';
  static const validateProcessing = processing;

  static const generateCommandName = 'generate';
  static const generateCommandDescription = 'Generate selected brick template from source code.';
  static const generateProcessing = processing;
  static const generateChoosen = 'Choosen templates:';

  static const discoverCommandName = 'discover';
  static const discoverCommandDescription = 'Discover potential templates in your project.';
  static const disocoverProcessing = 'Discovering';
  static const discoverNotFoundNew = 'New templates not found';
}
