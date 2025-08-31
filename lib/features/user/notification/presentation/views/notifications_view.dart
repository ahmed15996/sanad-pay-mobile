import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/constants/app_text_styles.dart';
import 'package:sanad/core/widgets/custom_empty_data.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_image_network.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/user/notification/presentation/cubit/notifications_cubit.dart';
import 'package:sanad/features/user/notification/presentation/views/widgets/custom_notifications_list_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../generated/locale_keys.g.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppbar(title: LocaleKeys.notifications.tr()),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          var cubit = context.read<NotificationsCubit>();
          if (state is GetNotificationsLoading) {
            return CustomLoading();
          } else if (state is GetNotificationsFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchNotifications();
              },
            );
          } else {
            return cubit.notifications.isNotEmpty
                ? CustomNotificationsListWidget(
                    notifications: cubit.notifications,
                  )
                : CustomEmptyData(
                    image: AppAssets.emptyNotification,
                    text: LocaleKeys.emptyNotification.tr(),
                    subtitle: LocaleKeys.emptyNotificationContent.tr(),
                  );
          }
        },
      ),
    );
  }
}
