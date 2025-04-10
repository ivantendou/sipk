import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_submission_detail/views/widgets/detail_submission_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';

import '../controllers/ao_submission_detail_controller.dart';

class AoSubmissionDetailView extends GetView<AoSubmissionDetailController> {
  const AoSubmissionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Detail Pengajuan'),
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
                        ?.financingApplication?.applicationAmount
                        .toString(),
                    applicationStatus: controller.financingApplicationData.value
                        ?.financingApplication?.applicationStatus,
                    applicantName: controller
                        .financingApplicationData.value?.applicant?.name,
                  ),
                  const SizedBox(height: 16),
                  CustomButtonWidget(
                    text: 'Lihat Hasil Skoring',
                    width: double.infinity,
                    onTap: () {
                      Get.toNamed(
                        Routes.AO_SCORING_DETAIL,
                        parameters: {
                          'id': controller.financingApplicationData.value
                                  ?.financingApplication?.applicantId
                                  .toString() ??
                              "",
                        },
                      );
                    },
                    buttonColor: ColorsConstant.white,
                    textColor: ColorsConstant.primary,
                    borderColor: ColorsConstant.primary,
                  ),
                  const SizedBox(height: 12),
                  CustomIconButtonWidget(
                    icon: Assets.images.pdf.svg(),
                    text: 'Lihat Proposal Pembiayaan',
                  ),
                  const SizedBox(height: 12),
                  CustomIconButtonWidget(
                    icon: Assets.images.cross.svg(),
                    text: 'Batalkan Pengajuan',
                    backgroundColor: ColorsConstant.error,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
