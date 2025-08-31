import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../generated/locale_keys.g.dart';
import '../../cubit/create_acc_store_cubit.dart';

class CustomButtonSendRequestCreateAccTechWidget extends StatelessWidget {
  final CreateAccStoreCubit cubit;


  const CustomButtonSendRequestCreateAccTechWidget({
    super.key,
    required this.cubit,

  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        bool? isFormSellerValidated = cubit.formKey.currentState?.validate();
        bool? isPhoneValidate = cubit.phoneCtrl.validatePhoneField();
        if (isFormSellerValidated! && isPhoneValidate) {
          cubit.createAcc(
            context: context,
          );
        }
      },
      isLoading: cubit.state is CreateAccLoading,
      text: LocaleKeys.createAccount.tr()
    );
  }
}
