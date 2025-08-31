import 'package:flutter/material.dart';

class AppShadows{
  static BoxShadow defaultShadow = BoxShadow(
    color: Color(0xff43474D).withOpacity(0.08),
    blurRadius: 60,
    offset: Offset(0, 12),
    spreadRadius: 0,
  );

  static BoxShadow offerContainerShadow = BoxShadow(
    color: Color(0xff555E68).withOpacity(0.1),
    blurRadius: 100,
    offset: Offset(0, 10),
    spreadRadius: 0,
  );
}