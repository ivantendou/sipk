import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_select_scoring/views/widgets/select_app_bar_widget.dart';
import 'package:sipk/app/modules/ao_select_scoring/views/widgets/select_scoring_list_view_widget.dart';

import '../controllers/ao_select_scoring_controller.dart';

class AoSelectScoringView extends GetView<AoSelectScoringController> {
  const AoSelectScoringView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildRegularAppBar(context, controller),
        backgroundColor: ColorsConstant.grey100,
        body: SelectScoringListViewWidget(controller: controller),
      );
  }
}
