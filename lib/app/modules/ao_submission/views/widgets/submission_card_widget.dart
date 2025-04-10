import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class SubmissionCardWidget extends StatelessWidget {
  final String? applicantName;
  final String? scoringNumber;
  final String? status;
  final void Function()? onTap;

  const SubmissionCardWidget({
    Key? key,
    required this.applicantName,
    required this.scoringNumber,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case "Disetujui":
        backgroundColor = ColorsConstant.good100;
        textColor = ColorsConstant.good600;
        break;
      case "Ditolak":
        backgroundColor = ColorsConstant.doubtful100;
        textColor = ColorsConstant.doubtful600;
        break;
      case "Diproses":
      default:
        backgroundColor = ColorsConstant.average100;
        textColor = ColorsConstant.average600;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelValueWidget(
                        label: "Nama Pemohon",
                        value: applicantName,
                      ),
                      LabelValueWidget(
                        label: "Nomor Skoring",
                        value: scoringNumber,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 120,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: backgroundColor,
                  ),
                  child: Center(
                    child: Text(
                      status ?? "",
                      style: TextStyleConstant.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
