import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sanad/core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../cubit/bottom_nav_cubit.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final cubit = context.read<BottomNavCubit>();

        return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primaryColor,
            shape: CircleBorder(),
            child: SvgPicture.asset(AppAssets.qrcode),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: cubit.getBottomNavigationBar(context),
              ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
