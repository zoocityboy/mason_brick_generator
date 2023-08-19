import 'dart:io';

import '../../l.dart';

/// Icon string extendsion
/// adds [withIcon] which adds the icon as prefix of the string
extension IconString on String {
  /// Adds the icon as prefix of the string
  String get withIcon => '${L.icon} $this';
}

extension PathString on String {
  /// Adds the icon as prefix of the string
  String get osPath => replaceAll('/', Platform.pathSeparator);
}
