import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/submission_data/views/widgets/search_app_bar_widget.dart';
import 'package:sipk/app/modules/submission_data/views/widgets/selection_app_bar_widget.dart';
import 'package:sipk/app/modules/submission_data/views/widgets/submission_list_view_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';

import '../controllers/submission_data_controller.dart';

class SubmissionDataView extends GetView<SubmissionDataController> {
  const SubmissionDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: controller.isSelectionMode.value
            ? buildSelectionAppBar(controller)
            : buildRegularAppBar(context, controller),
        backgroundColor: ColorsConstant.grey100,
        body: SubmissionListViewWidget(controller: controller),
        floatingActionButton: controller.userRole.value == 'Manajer'
            ? const SizedBox()
            : FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.SUBMISSION_FORM);
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
