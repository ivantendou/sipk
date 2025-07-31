// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoringDraftCardWidget extends StatelessWidget {
  final String? applicantName;
  final String? scoringNumber;
  final void Function()? onTap;

  const ScoringDraftCardWidget({
    Key? key,
    this.applicantName,
    this.scoringNumber,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: ColorsConstant.white,
        boxShadow: [
          BoxShadow(
            color: ColorsConstant.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget(
                  label: "Applicant Name",
                  value: applicantName,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: "Scoring Number",
                  value: scoringNumber,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          CustomButtonWidget(
            text: "Fill Draft",
            width: 120,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
