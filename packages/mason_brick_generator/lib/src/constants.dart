import 'package:meta/meta.dart';

/// Constants for Mason Brick Generator
@protected
abstract class Constants {
  /// Args categories
  static const String basicCategory = 'Basic';
  static const String advancedCategory = 'Advanced';

  /// Mandatory file names
  static const String masonTplConfigFileName = 'mason_brick_generator.yaml';
  static const String masonConfigFileName = 'mason.yaml';
  static const String masonTplKey = 'mason_brick_generator';
  static const String masonSampleTamplateName = 'mbg_sample_name';
  static const String masonSampleBrickName = 'mbg_sample';

  /// Folder structure
  static const String bricksFolder = 'bricks';
  static const String brickFolder = '__brick__';
  static const String templateBundle = 'bundle/tpl_template_name.bundle';

  /// RegExp
  static RegExp importLineContent = RegExp(r"\'(.*?)\'");
}
