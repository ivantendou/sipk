import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Hasil Skoring Pembiayaan',
      ),
      backgroundColor: ColorsConstant.grey100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: SizedBox(
                    width: 48,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballBeat,
                      strokeWidth: 4.0,
                      colors: [Theme.of(context).primaryColor],
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ScoreChartWidget(
                        score: controller.creditScoreData.value
                                    ?.creditEvaluations?.isNotEmpty ==
                                true
                            ? controller
                                    .creditScoreData
                                    .value!
                                    .creditEvaluations!
                                    .first
                                    .creditScores
                                    ?.totalScore ??
                                0.0
                            : 0.0,
                        applicantName:
                            controller.creditScoreData.value?.applicant?.name ??
                                "",
                        scoringDate: controller.creditScoreData.value
                                    ?.creditEvaluations?.isNotEmpty ==
                                true
                            ? controller
                                    .creditScoreData
                                    .value!
                                    .creditEvaluations!
                                    .first
                                    .creditScores
                                    ?.updatedAt
                                    ?.toLocal()
                                    .toString() ??
                                "2025-04-03 11:57:06.956956+00"
                            : "2025-04-03 11:57:06.956956+00",
                        scoringNumber: controller
                                .creditScoreData.value?.applicant?.id
                                .toString() ??
                            "",
                      ),
                      ScoringDetailAccordionWidget(
                        address: controller.creditScoreData.value?.applicant
                                ?.residentialAddress ??
                            "",
                        aoName:
                            controller.creditScoreData.value?.accountOfficer ??
                                "",
                        applicantCategory: controller.creditScoreData.value
                                ?.creditEvaluations?.first.applicantCategory ??
                            "",
                        applicantName:
                            controller.creditScoreData.value?.applicant?.name ??
                                "",
                        gender: controller
                                .creditScoreData.value?.applicant?.gender ??
                            "",
                        mobilePhone: controller.creditScoreData.value?.applicant
                                ?.mobilePhone ??
                            "",
                        nik: controller
                                .creditScoreData.value?.applicant?.ktpNumber ??
                            "",
                        totalSubmission: controller.creditScoreData.value
                                ?.financingApplications?.first.applicationAmount
                                .toString() ??
                            "",
                        score: controller
                                .creditScoreData
                                .value
                                ?.creditEvaluations
                                ?.first
                                .creditScores
                                ?.totalScore ??
                            0,
                      ),
                      const SizedBox(height: 80),
                    ],
                  ),
                );
        }),
      ),
      floatingActionButton: SubmissionButtonWidget(onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
