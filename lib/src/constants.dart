import 'package:meta/meta.dart';

/// Constants for Mason Template
@protected
abstract class Constants {
  /// Args categories
  static const String basicCategory = 'Basic';
  static const String advancedCategory = 'Advanced';


  /// Mandatory file names
  static const String masonTplConfigFileName = 'mason_tpl.yaml';
  static const String masonConfigFileName = 'mason.yaml';
  static const String masonTplKey = 'mason_tpl';

  /// Folder structure
  static const String bricksFolder = 'bricks';
  static const String brickFolder = '__brick__';
}
