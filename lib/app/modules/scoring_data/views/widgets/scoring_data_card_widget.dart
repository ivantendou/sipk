import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/credit_score_badge_widget.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoringDataCardWidget extends StatelessWidget {
  final String? scoringNumber;
  final bool? scoringStatus;
  final String? applicantName;
  final String? telephoneNumber;
  final String? scoringDate;
  final String? rating;
  final String? score;
  final bool isSelected;
  final bool isSelectionMode;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(bool?)? onCheckboxChanged;

  const ScoringDataCardWidget({
    Key? key,
    this.scoringNumber,
    this.scoringStatus,
    this.applicantName,
    this.telephoneNumber,
    this.scoringDate,
    this.rating,
    this.score,
    required this.isSelected,
    required this.isSelectionMode,
    this.onTap,
    this.onLongPress,
    this.onCheckboxChanged,
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
                            "SKORING-${scoringNumber ?? ""}",
                            style: TextStyleConstant.body,
                          ),
                        ),
                        Row(
                          children: [
                            Assets.images.check.svg(
                              width: 24,
                              colorFilter: ColorFilter.mode(
                                  ColorsConstant.black, BlendMode.srcIn),
                            ),
                            const SizedBox(width: 4),
                            // Text(
                            //   scoringStatus ?? "",
                            //   style: TextStyleConstant.body.copyWith(
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // )
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
                                label: "Nama Pemohon",
                                value: applicantName,
                              ),
                              const SizedBox(height: 8),
                              LabelValueWidget(
                                label: "Nomor Telepon",
                                value: telephoneNumber,
                              ),
                              const SizedBox(height: 8),
                              LabelValueWidget(
                                label: "Tanggal Pembuatan Form",
                                value: formatDate(scoringDate),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        CreditScoreBadgeWidget(
                          rating: rating ?? "",
                          score: score ?? "-",
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
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return "${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}";
  }
}
