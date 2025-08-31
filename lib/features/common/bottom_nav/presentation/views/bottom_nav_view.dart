import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/widgets/custom_vistor_dialog.dart';
import 'package:sanad/features/common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import 'package:sanad/features/common/bottom_nav/presentation/views/widgets/custom_qr_code_scan_dialog_widget.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/routing/routes.dart';
import '../cubit/bottom_nav_cubit.dart';

class BottomNavView extends StatelessWidget {
  final BottomNavArgument argument;
  const BottomNavView({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavCubit>();

        return Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          floatingActionButton: FloatingActionButton(

            onPressed: () {
              if (argument.isUser) {
                if (cubit.token.isNotEmpty) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return BlocProvider.value(
                        value: cubit,
                        child: CustomQrCodeScanSheetWidget(),
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => CustomVisitorDialog(),
                  );
                }
              }else{
                context.pushWithNamed(Routes.createInvoiceView);
              }
            },
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            shape: CircleBorder(),
            child: SvgPicture.asset(
              argument.isUser ? AppAssets.qrcode : AppAssets.add,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
            child: BottomAppBar(
              height: 97.h,
              color: AppColors.whiteColor,
              padding: EdgeInsets.all(25.w),
              child: Row(
                mainAxisAlignment: argument.isUser ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceEvenly,
                children: argument.isUser
                    ? cubit.getUserBottomNavigationBar()
                    : cubit.getStoreBottomNavigationBar(),
              ),
            ),
          ),
          body: argument.isUser
              ? cubit.userScreens[cubit.currentIndex]
              : cubit.storeScreens[cubit.currentIndex],
        );
      },
    );
  }
}
