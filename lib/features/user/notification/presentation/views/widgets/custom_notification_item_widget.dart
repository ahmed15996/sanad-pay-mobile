import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/core/util/routing/routes.dart';
import 'package:sanad/features/user/notification/data/model/notification_model.dart';
import 'package:sanad/features/user/notification/presentation/cubit/notifications_cubit.dart';
import 'package:sanad/features/user/payments/data/arguments/payment_request_arguments.dart';
import 'package:sanad/features/user/payments/presentation/views/payment_request_view.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_text_styles.dart';
import '../../../../../../core/framework/spaces.dart';
import '../../../../../../core/widgets/custom_image_network.dart';

class CustomNotificationItemWidget extends StatelessWidget {
  final NotificationModel notificationModel;
  const CustomNotificationItemWidget({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<NotificationsCubit>();
    return Row(
      children: [
        SvgPicture.asset(AppAssets.logo,width: 23.w,height: 28.h,color: AppColors.primaryColor,),
        widthSpace(30.w),
        Expanded(
          child: Text(notificationModel.body,style: AppTextStyles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor
          ),),
        ),
      ],
    ).onTap(function: () async{
      if(notificationModel.order?.status == "pending"){
        var result = await context.pushWithNamed(Routes.paymentRequestView,arguments: PaymentRequestArguments(
          orderModel: notificationModel.order!,
          isFromNotification: true
        ));
        if(result != null){
          cubit.fetchNotifications();
        }
      }
    },);
  }
}
