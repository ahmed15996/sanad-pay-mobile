import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/framework/spaces.dart';
import 'package:sanad/core/widgets/custom_button.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w, top: 40.h),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Payment",
                    style: AppTextStyles.textStyle20.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
              ),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.greyLightColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: TabBar(
                        labelStyle: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        labelColor: AppColors.darkSecondaryColor,
                        unselectedLabelColor: AppColors.darkSecondaryColor,
                        unselectedLabelStyle: AppTextStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        indicator: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            color: AppColors.whiteColor
                        ),

                        tabs: [
                          Tab(child: Text("Upcoming Payment")),
                          Tab(child: Text("Previous Payments")),
                        ],
                      ),
                    ),
                    heightSpace(24),
                    TabBarView(
                      children: [
                        Column(
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(38.5.r),child: Image.asset(AppAssets.logo,width: 77.w,height: 77.h,)),
                            heightSpace(32),
                            Text("Payment Date\nJanuary 27",style: AppTextStyles.textStyle28.copyWith(
                              color: AppColors.darkSecondaryColor
                            ),),
                            heightSpace(24),
                            Text("300,00",style: AppTextStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.w500,
                                color: AppColors.secondaryColor
                            ),),
                            heightSpace(40),
                           CustomButton(
                             text: "Pay Now",
                           ),
                            heightSpace(25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Transaction History",style: AppTextStyles.textStyle14.copyWith(
                                    fontWeight: FontWeight.bold,

                                ),),
                                Icon(Icons.arrow_forward_ios,color: AppColors.primaryColor,)
                              ],
                            )
                          ],
                        ),
                        ListView.separated(itemBuilder: (context, index) {
                          return Row(
                            children: [
                              SvgPicture.asset(AppAssets.previousPayment),
                              widthSpace(12.w),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Payment Date (January 27)",style: AppTextStyles.textStyle14.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.darkSecondaryColor
                                  ),),
                                  heightSpace(4),
                                  Text("300,00",style: AppTextStyles.textStyle16.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondaryColor
                                  ),),

                                ],)),
                            ],
                          );
                        }, separatorBuilder: (context, index) {
                          return heightSpace(24.h);
                        }, itemCount: 4)

                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
