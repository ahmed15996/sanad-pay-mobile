import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sanad/core/util/extensions/media_query.dart';
import 'package:sanad/core/util/extensions/navigation.dart';
import 'package:sanad/core/util/extensions/on_tap.dart';
import 'package:sanad/features/store/select_location/presentation/view/widgets/custom_current_location_widget.dart';
import 'package:sanad/features/store/select_location/presentation/view/widgets/custom_search_location_widget.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_text_styles.dart';
import '../../../../../core/framework/spaces.dart';
import '../../../../../core/widgets/custom_error.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../data/arguments/store_location_argument.dart';
import '../cubits/select_location_cubit/select_location_cubit.dart';

class SelectLocationView extends StatefulWidget {
  final void Function(StoreLocationArgument argument) onSelectLocation;

  const SelectLocationView({super.key, required this.onSelectLocation});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  @override
  void initState() {
    context.read<SelectLocationCubit>().checkPermission(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.w, top: 9.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform(
                        alignment: Alignment.center,
                        transform:
                            TextDirection.ltr.name ==
                                Directionality.of(context).name
                            ? Matrix4.rotationY(3.1416)
                            : Matrix4.rotationY(0),
                        child:
                            SvgPicture.asset(
                              AppAssets.arrowBack,
                              color: AppColors.whiteColor,
                            ).onTap(
                              function: () {
                                context.pop();
                              },
                            ),
                      ),
                      Text(
                        LocaleKeys.selectStoreLocation.tr(),
                        style: AppTextStyles.textStyle32,
                      ),
                      Text(
                        LocaleKeys.detectStoreLocationOnMap.tr(),
                        style: AppTextStyles.textStyle16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: BlocBuilder<SelectLocationCubit, SelectLocationState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<SelectLocationCubit>(context);
                return state is GetCurrentLoading
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 20.h,
                        ),
                        child: const CustomLoading(),
                      )
                    : state is GetCurrentFailure
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 20.h,
                        ),
                        child: Center(
                          child: CustomError(
                            error: state.error,
                            retry: () {
                              cubit.checkPermission(context: context);
                            },
                          ),
                        ),
                      )
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 20.h),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.r),
                                    topRight: Radius.circular(30.r),
                                  ),
                                  child: GoogleMap(
                                    onMapCreated: cubit.onMapCreate,
                                    initialCameraPosition: CameraPosition(
                                      target: cubit.currentLocation!,
                                      zoom: 15.0,
                                    ),
                                    onCameraMove: (cameraPos) {
                                      cubit.onUpdateCamera(position: cameraPos);
                                    },
                                    onCameraIdle: () {
                                      cubit.onCloseCamera();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: SvgPicture.asset(
                              AppAssets.marker,
                              height: 32.h,
                              width: 32.w,
                            ),
                          ),
                          CustomSearchLocationWidget(cubit: cubit),
                          Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: CustomCurrentLocationWidget(
                              cubit: cubit,
                              onSelectLocation: widget.onSelectLocation,
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
