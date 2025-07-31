import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_select_scoring/controllers/ao_select_scoring_controller.dart';
import 'package:sipk/app/modules/ao_select_scoring/views/widgets/credit_score_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class SelectDataCardWidget extends StatelessWidget {
  final String? scoringNumber;
  final bool? scoringStatus;
  final String? applicantName;
  final String? ktpNumber;
  final String? scoringDate;
  final String? score;
  final void Function()? onTap;
  final AoSelectScoringController controller;

  const SelectDataCardWidget({
    Key? key,
    this.scoringNumber,
    this.scoringStatus,
    this.applicantName,
    this.ktpNumber,
    this.scoringDate,
    required this.score,
    this.onTap,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: ColorsConstant.grey300,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      border: Border(
                        left: BorderSide(color: ColorsConstant.grey500),
                        right: BorderSide(color: ColorsConstant.grey500),
                        top: BorderSide(color: ColorsConstant.grey500),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            scoringNumber ?? "",
                            style: TextStyleConstant.body,
                          ),
                        ),
                        scoringStatus!
                            ? Row(
                                children: [
                                  Assets.images.cross.svg(
                                    width: 24,
                                    colorFilter: const ColorFilter.mode(
                                        ColorsConstant.black, BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Scoring Incomplete",
                                    style: TextStyleConstant.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Assets.images.check.svg(
                                    width: 24,
                                    colorFilter: const ColorFilter.mode(
                                        ColorsConstant.black, BlendMode.srcIn),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Scoring Completed",
                                    style: TextStyleConstant.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: ColorsConstant.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      border: Border(
                        left: BorderSide(color: ColorsConstant.grey500),
                        right: BorderSide(color: ColorsConstant.grey500),
                        bottom: BorderSide(color: ColorsConstant.grey500),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelValueWidget(
                                label: "Applicant Name",
                                value: applicantName,
                              ),
                              const SizedBox(height: 16),
                              LabelValueWidget(
                                label: "NIK",
                                value: ktpNumber,
                              ),
                              const SizedBox(height: 16),
                              LabelValueWidget(
                                label: "Scoring Date",
                                value: formatDate(scoringDate),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          children: [
                            CreditScoreWidget(
                              score: score ?? "Belum Dinilai",
                            ),
                            const SizedBox(height: 16),
                            CustomButtonWidget(
                              text: "Select",
                              width: 120,
                              onTap: () {
                                controller.callSubmissionFormController(
                                  scoringNumber ?? "",
                                  applicantName ?? "",
                                  ktpNumber ?? "",
                                );
                                Future.delayed(
                                    const Duration(milliseconds: 200));
                                Get.back();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(String? dateStr) {
    DateTime dateTime = DateTime.parse(dateStr ?? "").toLocal();
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return "${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}";
  }
}
