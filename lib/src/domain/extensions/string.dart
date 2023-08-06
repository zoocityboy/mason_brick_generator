import '../../constants.dart';
import '../../localisation.dart';

/// Icon string extendsion
/// adds [withIcon] which adds the icon as prefix of the string
extension IconString on String {
  /// Adds the icon as prefix of the string
  String get withIcon => '${Localisation.icon} $this';
}
