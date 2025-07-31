import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/credit_score_badge_widget.dart';
import 'package:sipk/app/modules/scoring_data/controllers/scoring_data_controller.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoringDataCardWidget extends StatelessWidget {
  final String? scoringNumber;
  final bool? scoringStatus;
  final String? applicantName;
  final String? ktpNumber;
  final String? scoringDate;
  final String? score;
  final bool isSelected;
  final bool isSelectionMode;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(bool?)? onCheckboxChanged;
  final ScoringDataController controller;

  const ScoringDataCardWidget({
    Key? key,
    this.scoringNumber,
    this.scoringStatus,
    this.applicantName,
    this.ktpNumber,
    this.scoringDate,
    required this.score,
    required this.isSelected,
    required this.isSelectionMode,
    this.onTap,
    this.onLongPress,
    this.onCheckboxChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Row(
          children: [
            if (isSelectionMode)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: onCheckboxChanged,
                    activeColor: ColorsConstant.primary,
                  ),
                ),
              ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: ColorsConstant.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      border: Border(
                        left: BorderSide(color: ColorsConstant.primary),
                        right: BorderSide(color: ColorsConstant.primary),
                        top: BorderSide(color: ColorsConstant.primary),
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
                            'No. $scoringNumber',
                            style: TextStyleConstant.body.copyWith(
                              color: ColorsConstant.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        scoringStatus!
                            ? Row(
                                children: [
                                  Assets.images.cross.svg(
                                    width: 24,
                                    colorFilter: const ColorFilter.mode(
                                      ColorsConstant.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Scoring Incomplete",
                                    style: TextStyleConstant.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsConstant.white,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Assets.images.check.svg(
                                    width: 24,
                                    colorFilter: const ColorFilter.mode(
                                      ColorsConstant.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Scoring Completed",
                                    style: TextStyleConstant.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: ColorsConstant.white,
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
                              controller.showDraftsOnly.value
                                  ? const SizedBox()
                                  : LabelValueWidget(
                                      label: "Scoring Date",
                                      value: formatDate(scoringDate),
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        scoringStatus!
                            ? CustomButtonWidget(
                                text: "Fill Draft",
                                width: 120,
                                onTap: () {
                                  Get.toNamed(
                                    Routes.SCORING_FORM,
                                    arguments: {
                                      'applicantId': scoringNumber,
                                      'isScoringDraft': true,
                                    },
                                  );
                                },
                              )
                            : CreditScoreBadgeWidget(
                                score: score ?? "Belum Dinilai",
                              ),
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
