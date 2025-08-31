import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubits/search_places_cubit/search_places_bloc.dart';

class CustomSearchLocationTextFieldWidget extends StatefulWidget {
  final SearchPlacesBloc bloc;

  const CustomSearchLocationTextFieldWidget({super.key, required this.bloc});

  @override
  State<CustomSearchLocationTextFieldWidget> createState() =>
      _CustomSearchLocationTextFieldWidgetState();
}

class _CustomSearchLocationTextFieldWidgetState
    extends State<CustomSearchLocationTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.06,

      child: TextField(
        keyboardType: TextInputType.text,
        controller: widget.bloc.searchCtrl,
        style: AppTextStyles.textStyle14.copyWith(
          color: AppColors.blackColor,
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          widget.bloc.add(GetPlacesSuggestionsEvent(searchQuery: value));
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.whiteColor,
          border: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder(),
          prefixIcon: SvgPicture.asset(
            AppAssets.simpleSearch,
            fit: BoxFit.scaleDown,
          ),
          hintText: LocaleKeys.searchCurrentLocation.tr(),
          hintStyle:
              AppTextStyles.textStyle14.copyWith(color: AppColors.lightGreyColor),
          focusedBorder: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
          isDense: true,
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(50.r),
    );
  }
}
