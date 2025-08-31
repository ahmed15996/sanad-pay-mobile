import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../select_location/presentation/view/widgets/custom_icon_app_bar_widget.dart';

class CustomImageFilePickWidget extends StatelessWidget {
  final File file;

  final void Function() deleteImage;

  const CustomImageFilePickWidget(
      {super.key, required this.file, required this.deleteImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        heightSpace(15.h),
        AspectRatio(
          aspectRatio: 6 / 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(file),
              ),
            ),
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 5.w, top: 5.h),
              child: CustomIconAppBarWidget(
                radius: 18.r,
                onTap: deleteImage,
                child: SvgPicture.asset(
                  AppAssets.trash,
                  height: 17.h,
                  width: 17.w,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
