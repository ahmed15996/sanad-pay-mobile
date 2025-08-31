import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/widgets/custom_error.dart';
import '../../cubits/search_places_cubit/search_places_bloc.dart';
import '../../cubits/select_location_cubit/select_location_cubit.dart';
import 'custom_icon_app_bar_widget.dart';
import 'custom_list_places_widget.dart';
import 'custom_search_location_text_field_widget.dart';

class CustomSearchLocationWidget extends StatelessWidget {
  final SelectLocationCubit cubit;

  const CustomSearchLocationWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 25.w,end: 25.w, bottom: 25.h),
      child: BlocConsumer<SearchPlacesBloc, SearchPlacesState>(
        listener: (context, state) {
          if (state is GetCoordinatesSuccessState) {
            BlocProvider.of<SelectLocationCubit>(context).updateCameraPos(
              pos: context.read<SearchPlacesBloc>().searchedPosition!,
            );
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<SearchPlacesBloc>(context);
          return Column(
            children: [
              CustomSearchLocationTextFieldWidget(
                bloc: bloc,
              ),
              state is SearchPlacesFailureState
                  ? Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      padding: EdgeInsetsDirectional.only(bottom: 20.h),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(10.r),
                            topEnd: Radius.circular(10.r),
                            bottomStart: Radius.circular(20.r),
                            bottomEnd: Radius.circular(20.r)),
                      ),
                      child: Center(
                        child: CustomError(
                          error: state.error,
                          isLogo: false,
                          retry: () {
                            bloc.add(
                              GetPlacesSuggestionsEvent(
                                searchQuery: bloc.searchCtrl.text,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : bloc.places.isEmpty
                      ? const SizedBox.shrink()
                      : CustomListPlacesWidget(
                          bloc: bloc,
                        ),
            ],
          );
        },
      ),
    );
  }
}
