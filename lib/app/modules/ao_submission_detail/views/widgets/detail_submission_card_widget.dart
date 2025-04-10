// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class DetailSubmissionCardWidget extends StatelessWidget {
  final String? submissionId;
  final String? applicantName;
  final String? applicationStatus;
  final String? memberStatus;
  final String? officeBranch;
  final String? allocation;
  final String? submissionDate;
  final String? applicationAmount;

  const DetailSubmissionCardWidget({
    Key? key,
    this.submissionId,
    this.applicantName,
    this.applicationStatus,
    this.memberStatus,
    this.officeBranch,
    this.allocation,
    this.submissionDate,
    this.applicationAmount,
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
                  'No. $submissionId',
                  style: TextStyleConstant.body.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  applicationStatus == null
                      ? const Text('')
                      : applicationStatus == 'Pending'
                          ? Assets.images.waiting.svg()
                          : applicationStatus == 'Accepted'
                              ? Assets.images.check.svg()
                              : Assets.images.cross.svg(),
                  const SizedBox(width: 4),
                  applicationStatus == null
                      ? const Text('-')
                      : applicationStatus == 'Pending'
                          ? Text(
                              "Diproses",
                              style: TextStyleConstant.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : applicationStatus == 'Accepted'
                              ? Text(
                                  "Diterima",
                                  style: TextStyleConstant.body.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  "Ditolak",
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
          width: double.infinity,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelValueWidget(
                label: 'Nama Nasabah/Pemohon',
                value: applicantName,
              ),
              const SizedBox(height: 8),
              LabelValueWidget(
                label: 'Cabang Layanan',
                value: officeBranch,
              ),
              const SizedBox(height: 8),
              LabelValueWidget(
                label: 'Status Anggota',
                value: memberStatus,
              ),
              const SizedBox(height: 8),
              LabelValueWidget(
                label: 'Tujuan Pembiayaan',
                value: allocation,
              ),
              const SizedBox(height: 8),
              LabelValueWidget(
                label: 'Tanggal Pengajuan',
                value: submissionDate,
              ),
              const SizedBox(height: 8),
              LabelValueWidget(
                label: 'Jumlah Pengajuan',
                value: applicationAmount,
              ),
            ],
          ),
        )
      ],
    );
  }
}
