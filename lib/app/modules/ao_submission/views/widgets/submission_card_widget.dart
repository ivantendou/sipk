// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class SubmissionCardWidget extends StatelessWidget {
  final String? applicantName;
  final String? scoringNumber;
  final String? status;

  const SubmissionCardWidget({
    Key? key,
    required this.applicantName,
    required this.scoringNumber,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  color: ColorsConstant.average100,
                ),
                child: Center(
                  child: Text(
                    status ?? "",
                    style: TextStyleConstant.body.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorsConstant.average600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
