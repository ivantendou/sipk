// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class DetailSubmissionCardWidget extends StatelessWidget {
  final String? submissionId;
  final String? submissionStatus;
  final String? memberStatus;
  final String? officeBranch;
  final String? financingPurposes;
  final String? submissionDate;
  final String? totalSubmission;

  const DetailSubmissionCardWidget({
    Key? key,
    this.submissionId,
    this.submissionStatus,
    this.memberStatus,
    this.officeBranch,
    this.financingPurposes,
    this.submissionDate,
    this.totalSubmission,
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
                  submissionId ?? "",
                  style: TextStyleConstant.body,
                ),
              ),
              Row(
                children: [
                  Assets.images.waiting.svg(),
                  const SizedBox(width: 4),
                  Text(
                    submissionStatus ?? "",
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
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelValueWidget(
                label: 'Cabang Layanan',
                value: officeBranch,
              ),
              LabelValueWidget(
                label: 'Status Anggota',
                value: memberStatus,
              ),
              LabelValueWidget(
                label: 'Tujuan Pembiayaan',
                value: financingPurposes,
              ),
              LabelValueWidget(
                label: 'Tanggal Pengajuan',
                value: submissionDate,
              ),
              LabelValueWidget(
                label: 'Jumlah Pengajuan',
                value: totalSubmission,
              ),
            ],
          ),
        )
      ],
    );
  }
}
