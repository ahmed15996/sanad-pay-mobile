import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/widgets/custom_error.dart';
import 'package:sanad/core/widgets/custom_loading.dart';
import 'package:sanad/features/store/create_invoice/presentation/widgets/custom_create_invoice_form_widget.dart';
import 'package:sanad/features/store/create_invoice/presentation/widgets/custom_create_invoice_header_widget.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/routing/routes.dart';
import '../../../../common/bottom_nav/data/arguments/bottom_nav_argument.dart';
import '../cubit/create_invoice_cubit.dart';

class CreateInvoiceView extends StatefulWidget {
  const CreateInvoiceView({super.key});

  @override
  State<CreateInvoiceView> createState() => _CreateInvoiceViewState();
}

class _CreateInvoiceViewState extends State<CreateInvoiceView> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<CreateInvoiceCubit>().addListener();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<CreateInvoiceCubit, CreateInvoiceState>(
        listener: (context, state) {
          if(state is CreateInvoiceSuccess){
            context.pushAndRemoveUntilWithNamed(
              Routes.bottomNavView,
              arguments: BottomNavArgument(isUser: false, index: 0),
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<CreateInvoiceCubit>();
          if (state is GetDataLoading) {
            return CustomLoading();
          } else if (state is GetDataFailure) {
            return CustomError(
              error: state.error,
              retry: () {
                cubit.fetchDashboard();
              },
            );
          } else {
            return SafeArea(
              bottom: false,
              child: AbsorbPointer(
                absorbing: state is CreateInvoiceLoading || state is CreateQrInvoiceLoading,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomCreateInvoiceHeaderWidget(
                        dashboardModel: cubit.dashboardModel!,
                        userModel: cubit.userModel!,
                        appSettingsModel: cubit.appSettingsModel!,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 20.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24.r),
                          ),
                        ),
                        child: CustomCreateInvoiceFormWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
