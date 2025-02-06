// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/credit_score_badge_widget.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoringResultCardWidget extends StatelessWidget {
  final String applicantName;
  final String scoringNumber;
  final String rating;
  final String score;
  final void Function()? onTap;

  const ScoringResultCardWidget({
    Key? key,
    required this.applicantName,
    required this.scoringNumber,
    required this.rating,
    required this.score,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: ColorsConstant.white,
          boxShadow: [
            BoxShadow(
              color: ColorsConstant.black.withValues(alpha: 0.2),
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
          ],
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
                    label: "Nomor Skoring",
                    value: scoringNumber,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            CreditScoreBadgeWidget(
              rating: rating,
              score: score,
            ),
          ],
        ),
      ),
    );
  }
}
