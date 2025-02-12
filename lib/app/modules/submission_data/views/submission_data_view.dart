import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/scoring_data/views/widgets/search_panel_widget.dart';
import 'package:sipk/app/modules/submission_data/views/widgets/submission_data_card_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';

import '../controllers/submission_data_controller.dart';

class SubmissionDataView extends GetView<SubmissionDataController> {
  const SubmissionDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(title: 'Data Skoring'),
        backgroundColor: ColorsConstant.grey100,
        body: Stack(
          children: [
            const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 124, left: 16, right: 16),
                child: Column(
                  children: [
                    SubmissionDataCardWidget(),
                  ],
                ),
              ),
            ),
            SearchPanelWidget(
              hintText: 'Cari Data Pengajuan',
              onFilterTap: () {},
              onFirstOptionTap: () {},
              onSecondOptionTap: () {},
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorsConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Assets.images.plus.svg(),
        ),
      ),
    );
  }
}
