import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/scoring_data/views/widgets/scoring_list_view_widget.dart';
import 'package:sipk/app/modules/scoring_data/views/widgets/search_app_bar_widget.dart';
import 'package:sipk/app/modules/scoring_data/views/widgets/selection_app_bar_widget.dart';

import '../controllers/scoring_data_controller.dart';

class ScoringDataView extends GetView<ScoringDataController> {
  const ScoringDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: controller.isSelectionMode.value
            ? buildSelectionAppBar(controller)
            : buildRegularAppBar(context, controller),
        backgroundColor: ColorsConstant.grey100,
        body: ScoringListViewWidget(controller: controller),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.createForm();
          },
          backgroundColor: ColorsConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Assets.images.plus.svg(),
        ),
      );
    });
  }
}
