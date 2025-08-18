import 'package:flutter/material.dart';

extension ThemeHelper on BuildContext {

  ThemeData get theme => Theme.of(this);

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

}
