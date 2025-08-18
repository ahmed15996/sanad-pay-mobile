// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../constants/app_assets.dart';
//
// class CustomRatingBarWidget extends StatelessWidget {
//   final double rating, itemSize;
//   final Function(double)? onRatingUpdate;
//   const CustomRatingBarWidget({super.key, required this.rating, this.itemSize = 8, this.onRatingUpdate});
//
//   @override
//   Widget build(BuildContext context) {
//     return  RatingBar(
//       ratingWidget: RatingWidget(full: SvgPicture.asset(AppAssets.star), half: SvgPicture.asset(AppAssets.star), empty: SvgPicture.asset(AppAssets.unRatedStar)),
//       initialRating: rating,
//       itemSize: itemSize.w,
//       minRating: 0,
//       itemPadding: EdgeInsets.only(left: 2.w),
//       ignoreGestures: onRatingUpdate == null ? true : false,
//       onRatingUpdate: onRatingUpdate ?? (rate){
//         return ;
//       },
//     );
//   }
// }
