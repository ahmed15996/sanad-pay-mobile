import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import '../../generated/locale_keys.g.dart';
import '../constants/app_text_styles.dart';
import '../framework/spaces.dart';

class CustomEmptyData extends StatelessWidget {
  final String? image, text;


  const CustomEmptyData({super.key, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          if(image != null)
          SvgPicture.asset(
            image!,
            height: context.height * 0.24,
          ),
          heightSpace(45.h),
          Text(
            text ?? LocaleKeys.emptyData.tr(),
            style: AppTextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
