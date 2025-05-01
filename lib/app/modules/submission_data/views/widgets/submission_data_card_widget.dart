import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class SubmissionDataCardWidget extends StatelessWidget {
  final String? applicationNumber;
  final String? applicationStatus;
  final String? applicantName;
  final String? financingPurpose;
  final String? totalSubmission;
  final String? submissionDate;
  final bool isSelected;
  final bool isSelectionMode;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(bool?)? onCheckboxChanged;
  final String userRole;

  const SubmissionDataCardWidget({
    Key? key,
    this.applicationNumber,
    this.applicationStatus,
    this.applicantName,
    this.financingPurpose,
    this.totalSubmission,
    this.submissionDate,
    required this.isSelected,
    required this.isSelectionMode,
    this.onTap,
    this.onLongPress,
    this.onCheckboxChanged,
    required this.userRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0);

    String formatTimestamp(String timestamp) {
      DateTime dateTime = DateTime.parse(timestamp);
      String formattedDate = DateFormat('d MMMM yyyy, HH:mm').format(dateTime);
      return formattedDate;
    }

    Widget statusIcon;
    String statusText;

    switch (applicationStatus) {
      case 'Accepted':
        statusIcon = Assets.images.check.svg(
          width: 16,
          colorFilter: const ColorFilter.mode(
            ColorsConstant.white,
            BlendMode.srcIn,
          ),
        );
        statusText = "Diterima";
        break;
      case 'Rejected':
        statusIcon = Assets.images.cross.svg(
          width: 16,
          colorFilter: const ColorFilter.mode(
            ColorsConstant.white,
            BlendMode.srcIn,
          ),
        );
        statusText = "Ditolak";
        break;
      case 'Pending':
      default:
        statusIcon = Assets.images.waiting.svg(
          width: 16,
          colorFilter: const ColorFilter.mode(
            ColorsConstant.white,
            BlendMode.srcIn,
          ),
        );
        statusText =
            userRole == 'Manajer' ? "Menunggu Persetujuan" : "Diproses";
        break;
    }

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
                            'No. $applicationNumber',
                            style: TextStyleConstant.body.copyWith(
                              color: ColorsConstant.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            statusIcon,
                            const SizedBox(width: 4),
                            Text(
                              statusText,
                              style: TextStyleConstant.body.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorsConstant.white,
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
                                value:
                                    'Rp${currencyFormat.format(int.tryParse(totalSubmission ?? '0') ?? 0)}',
                              ),
                              const SizedBox(height: 8),
                              LabelValueWidget(
                                label: "Tanggal Pengajuan",
                                value: formatTimestamp(submissionDate ?? ""),
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
          ],
        ),
      ),
    );
  }
}
