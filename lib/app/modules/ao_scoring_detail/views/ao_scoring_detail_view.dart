import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_scoring_detail/views/widgets/score_chart_widget.dart';
import 'package:sipk/app/modules/ao_scoring_detail/views/widgets/scoring_detail_accordion_widget.dart';
import 'package:sipk/app/modules/ao_scoring_detail/views/widgets/submission_button_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';

import '../controllers/ao_scoring_detail_controller.dart';

class AoScoringDetailView extends GetView<AoScoringDetailController> {
  const AoScoringDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Hasil Skoring Pembiayaan',
        ),
        backgroundColor: ColorsConstant.grey100,
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ScoreChartWidget(
                  score: '92.5',
                  rating: 'BBB+',
                  scoreCategory: 'Average',
                ),
                ScoringDetailAccordionWidget(),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
        floatingActionButton: SubmissionButtonWidget(onTap: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
