import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/submission_detail/views/widgets/detail_submission_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';

import '../controllers/submission_detail_controller.dart';

class SubmissionDetailView extends GetView<SubmissionDetailController> {
  const SubmissionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Application Detail'),
      backgroundColor: ColorsConstant.grey100,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: SizedBox(
                width: 48,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  strokeWidth: 4.0,
                  colors: [ColorsConstant.primary],
                ),
              ),
            );
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  DetailSubmissionCardWidget(
                    userRole: controller.userRole.value,
                    submissionId: controller.financingApplicationData.value
                        ?.financingApplication?.id
                        .toString(),
                    officeBranch: controller.financingApplicationData.value
                        ?.financingApplication?.officeBranch,
                    memberStatus: controller.financingApplicationData.value
                        ?.financingApplication?.memberStatus,
                    allocation: controller.financingApplicationData.value
                        ?.financingApplication?.allocation,
                    submissionDate: controller.financingApplicationData.value
                            ?.financingApplication?.createdAt
                            ?.toLocal()
                            .toString() ??
                        "2025-04-03 11:57:06.956956+00",
                    applicationAmount: controller.financingApplicationData.value
                                ?.financingApplication?.acceptedAmount ==
                            null
                        ? controller.financingApplicationData.value
                            ?.financingApplication?.applicationAmount
                            .toString()
                        : controller.financingApplicationData.value
                            ?.financingApplication?.acceptedAmount
                            .toString(),
                    applicationStatus: controller.financingApplicationData.value
                        ?.financingApplication?.applicationStatus,
                    applicantName: controller
                        .financingApplicationData.value?.applicant?.name,
                  ),
                  const SizedBox(height: 16),
                  CustomIconButtonWidget(
                    icon: Assets.images.scoringOff.svg(
                      colorFilter: const ColorFilter.mode(
                        ColorsConstant.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    text: 'View Scoring Result',
                    onTap: () {
                      Get.toNamed(
                        Routes.AO_SCORING_DETAIL,
                        parameters: {
                          'id': controller.financingApplicationData.value
                                  ?.financingApplication?.applicantId
                                  .toString() ??
                              "",
                          'isFrom': 'true',
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  CustomIconButtonWidget(
                    icon: Assets.images.pdf.svg(),
                    text: 'View Financing Proposal',
                    onTap: () {
                      Get.toNamed(
                        Routes.FINANCING_PROPOSAL,
                        parameters: {
                          'applicant_id': controller.financingApplicationData
                                  .value?.financingApplication?.applicantId
                                  .toString() ??
                              "",
                          'application_id': controller.applicationId.toString()
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  controller.financingApplicationData.value
                                  ?.financingApplication?.applicationStatus ==
                              'Accepted' ||
                          controller.financingApplicationData.value
                                  ?.financingApplication?.applicationStatus ==
                              'Rejected'
                      ? const SizedBox()
                      : controller.userRole.value == 'Manajer'
                          ? Row(
                              children: [
                                Expanded(
                                  child: CustomIconButtonWidget(
                                    icon: Assets.images.cross.svg(),
                                    text: 'Reject',
                                    backgroundColor: ColorsConstant.error,
                                    onTap: () {
                                      controller.showRejectConfirmationDialog();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: CustomIconButtonWidget(
                                    icon: Assets.images.check.svg(),
                                    text: 'Accept',
                                    backgroundColor: ColorsConstant.success,
                                    onTap: () {
                                      controller.showAcceptConfirmationDialog();
                                    },
                                  ),
                                ),
                              ],
                            )
                          : controller.userRole.value == 'Account Officer'
                              ? CustomIconButtonWidget(
                                  icon: Assets.images.cross.svg(),
                                  text: 'Cancel Application',
                                  onTap: () {
                                    controller.showCancelConfirmationDialog();
                                  },
                                  backgroundColor: ColorsConstant.error,
                                )
                              : const SizedBox(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
