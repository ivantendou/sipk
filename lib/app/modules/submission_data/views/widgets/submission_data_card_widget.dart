import 'package:flutter/material.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class SubmissionDataCardWidget extends StatelessWidget {
  final String? scoringNumber;
  final String? scoringStatus;
  final String? applicantName;
  final String? financingPurpose;
  final String? totalSubmission;
  final String? submissionDate;

  const SubmissionDataCardWidget({
    Key? key,
    this.scoringNumber,
    this.scoringStatus,
    this.applicantName,
    this.financingPurpose,
    this.totalSubmission,
    this.submissionDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  'No. $scoringNumber',
                  style: TextStyleConstant.body,
                ),
              ),
              Row(
                children: [
                  Assets.images.check.svg(
                    width: 24,
                    colorFilter:
                        ColorFilter.mode(ColorsConstant.black, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    scoringStatus ?? "",
                    style: TextStyleConstant.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
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
                      label: "Tujuan Pembiayaan",
                      value: financingPurpose,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelValueWidget(
                      label: "Jumlah Pengajuan",
                      value: totalSubmission,
                    ),
                    const SizedBox(height: 8),
                    LabelValueWidget(
                      label: "Tanggal Pengajuan",
                      value: submissionDate,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
