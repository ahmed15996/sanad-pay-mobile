// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../generated/locale_keys.g.dart';
// import '../constants/app_assets.dart';
// import '../constants/app_colors.dart';
// import '../framework/spaces.dart';
// import 'custom_item_attach_type_widget.dart';
//
// class CustomBottomSheetAttachImageWidget extends StatelessWidget {
//   final void Function() onCamera, onGallery;
//
//   const CustomBottomSheetAttachImageWidget({
//     super.key,
//     required this.onCamera,
//     required this.onGallery,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.whiteColor,
//         borderRadius: BorderRadiusDirectional.only(
//           topStart: Radius.circular(20.r),
//           topEnd: Radius.circular(20.r),
//         ),
//       ),
//       child: SingleChildScrollView(
//         padding: EdgeInsetsDirectional.only(
//           bottom: 20.h,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             heightSpace(30.h),
//             CustomItemAttachTypeWidget(
//               name: LocaleKeys.camera.tr(),
//               image: AppAssets.attachCamera,
//               onTap: onCamera,
//             ),
//             heightSpace(10.h),
//             CustomItemAttachTypeWidget(
//               name: LocaleKeys.gallery.tr(),
//               image: AppAssets.gallery,
//               onTap: onGallery,
//             ),
//             heightSpace(15.h),
//           ],
//         ),
//       ),
//     );
//   }
// }
