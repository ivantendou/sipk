import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_data/controllers/scoring_data_controller.dart';
import 'package:sipk/app/modules/scoring_data/views/widgets/filter_bottom_sheet_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';

AppBarWithSearchSwitch buildRegularAppBar(
    BuildContext context, ScoringDataController controller) {
  return AppBarWithSearchSwitch(
    titleTextStyle: TextStyleConstant.subHeading2,
    scrolledUnderElevation: 0.0,
    fieldHintText: 'Cari dengan Nama/NIK',
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: ColorsConstant.grey500,
        height: 1.0,
      ),
    ),
    onChanged: (text) => controller.updateSearchQuery(text),
    onSubmitted: (text) => controller.applyFilters(),
    animation: AppBarAnimationSlideLeft.call,
    appBarBuilder: (context) {
      return CustomAppBarWidget(
        title: 'Data Skoring',
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              AppBarWithSearchSwitch.of(context)?.startSearch();
            },
            child: Assets.images.search.svg(
              width: 24,
              colorFilter:
                  const ColorFilter.mode(ColorsConstant.black, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () => showFilterBottomSheet(context, controller),
            child: Assets.images.filter1.svg(
              width: 24,
              colorFilter:
                  const ColorFilter.mode(ColorsConstant.black, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 16),
        ],
      );
    },
  );
}
