import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/framework/spaces.dart';
import '../../cubit/faq_cubit.dart';
import 'custom_faq_item.dart';

class CustomFaqList extends StatelessWidget {
  final FaqCubit cubit;

  const CustomFaqList({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.only(
          top: 30.h,
          bottom: 20.h,
          start: 16.w,
          end: 16.w,
        ),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => CustomFaqItem(
              ask: cubit.questions[index].question,
              answer: cubit.questions[index].answer,
          isLast: index == cubit.questions.length - 1,
            ),
        separatorBuilder: (context, index) => heightSpace(20.h),
        itemCount: cubit.questions.length
        //cubit.questions.length,
        );
  }
}
