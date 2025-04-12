import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final String userRole;

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
    required this.userRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formatTimestamp(String timestamp) {
      DateTime dateTime = DateTime.parse(timestamp);
      String formattedDate = DateFormat('d MMMM yyyy, HH:mm').format(dateTime);
      return formattedDate;
    }

    Color headerBackgroundColor;
    Color borderColor;
    Color textColor;
    String statusText;

    switch (applicationStatus) {
      case 'Accepted':
        headerBackgroundColor = ColorsConstant.good100;
        borderColor = ColorsConstant.good600;
        textColor = ColorsConstant.good600;
        statusText = "Diterima";
        break;
      case 'Rejected':
        headerBackgroundColor = ColorsConstant.doubtful100;
        borderColor = ColorsConstant.doubtful600;
        textColor = ColorsConstant.doubtful600;
        statusText = "Ditolak";
        break;
      case 'Pending':
      default:
        headerBackgroundColor = ColorsConstant.average100;
        borderColor = ColorsConstant.average600;
        textColor = ColorsConstant.average600;
        statusText =
            userRole == 'Manajer' ? "Menunggu Persetujuan" : "Diproses";
        break;
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: headerBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            border: Border(
              left: BorderSide(color: borderColor),
              right: BorderSide(color: borderColor),
              top: BorderSide(color: borderColor),
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
                    color: textColor,
                  ),
                ),
              ),
              Row(
                children: [
                  applicationStatus == null
                      ? const Text('')
                      : applicationStatus == 'Pending'
                          ? Assets.images.waiting.svg(
                              colorFilter: ColorFilter.mode(
                                textColor,
                                BlendMode.srcIn,
                              ),
                            )
                          : applicationStatus == 'Accepted'
                              ? Assets.images.check.svg(
                                  colorFilter: ColorFilter.mode(
                                      textColor, BlendMode.srcIn),
                                )
                              : Assets.images.cross.svg(
                                  colorFilter: ColorFilter.mode(
                                      textColor, BlendMode.srcIn),
                                ),
                  const SizedBox(width: 4),
                  Text(
                    statusText,
                    style: TextStyleConstant.body.copyWith(
                      fontWeight: FontWeight.bold,
                      color: textColor,
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
          decoration: BoxDecoration(
            color: ColorsConstant.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
            border: Border(
              left: BorderSide(color: borderColor),
              right: BorderSide(color: borderColor),
              bottom: BorderSide(color: borderColor),
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
                value: submissionDate != null
                    ? formatTimestamp(submissionDate!)
                    : '-',
              ),
              const SizedBox(height: 8),
              LabelValueWidget(
                label: 'Jumlah Pengajuan',
                value: 'Rp$applicationAmount',
              ),
            ],
          ),
        )
      ],
    );
  }
}
