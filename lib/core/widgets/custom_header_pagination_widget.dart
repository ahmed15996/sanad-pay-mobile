import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sanad/core/constants/app_colors.dart';

class CustomHeaderAppPagination extends StatelessWidget {
  const CustomHeaderAppPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const ClassicHeader()
        :  MaterialClassicHeader(
      color: AppColors.primaryColor,
    );
  }
}