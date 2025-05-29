import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/ao_home_appbar_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/header_with_see_all_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/monthly_target_card_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/scoring_draft_card_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/scoring_result_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';

import '../controllers/ao_home_controller.dart';

class AoHomeView extends GetView<AoHomeController> {
  const AoHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Obx(
            () => AoHomeAppbarWidget(
              imageUrl: "",
              name: controller.username.value,
            ),
          ),
        ),
        backgroundColor: ColorsConstant.grey100,
        body: RefreshIndicator(
          color: ColorsConstant.primary,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const MonthlyTargetCardWidget(),
                  const SizedBox(height: 16),
                  Obx(() {
                    return CustomIconButtonWidget(
                      icon: Assets.images.add1.svg(width: 24),
                      text: "Start New Credit Scoring",
                      isLoading: controller.isLoadingForm.value,
                      onTap: () {
                        controller.createForm();
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                  HeaderWithSeeAllWidget(
                    title: "Scoring Draft",
                    onTap: () {
                      Get.toNamed(
                        Routes.SCORING_DATA,
                        arguments: true,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: 132,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    } else if (controller.scoringDraft.isEmpty) {
                      return Container(
                        width: double.infinity,
                        height: 132,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('No scoring draft yet'),
                        ),
                      );
                    } else {
                      return ScoringDraftCardWidget(
                        onTap: () {
                          Get.toNamed(
                            Routes.SCORING_FORM,
                            arguments: {
                              'applicantId': controller.scoringDraft.first.id,
                              'isScoringDraft': true,
                            },
                          );
                        },
                        applicantName: controller.scoringDraft.first.name,
                        scoringNumber: controller.scoringDraft.first.id,
                      );
                    }
                  }),
                  const SizedBox(height: 16),
                  HeaderWithSeeAllWidget(
                    title: "Scoring Result",
                    onTap: () {
                      Get.toNamed(
                        Routes.SCORING_DATA,
                        arguments: false,
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: double.infinity,
                          height: 132,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    } else if (controller.scoringResult.isEmpty) {
                      return Container(
                        width: double.infinity,
                        height: 132,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('No scoring results yet'),
                        ),
                      );
                    } else {
                      return ScoringResultCardWidget(
                        applicantName: controller.scoringResult.first.name,
                        scoringNumber: controller.scoringResult.first.id,
                        score: controller.scoringResult.first.creditEvaluations
                            ?.first.creditScores?.totalScore
                            .toString(),
                        onTap: () {
                          Get.toNamed(
                            Routes.AO_SCORING_DETAIL,
                            parameters: {
                              'id': controller.scoringResult.first.id.toString()
                            },
                          );
                        },
                      );
                    }
                  }),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          onRefresh: () async {
            controller.fetchCreditScores();
          },
        ),
      ),
    );
  }
}
