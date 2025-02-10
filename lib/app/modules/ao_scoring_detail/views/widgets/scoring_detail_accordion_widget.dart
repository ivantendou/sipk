// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoringDetailAccordionWidget extends StatelessWidget {
  final String? applicantName;
  final String? address;
  final String? nik;
  final String? totalSubmission;
  final String? applicantCategory;
  final String? aoName;
  final String? ratingExplanation;

  const ScoringDetailAccordionWidget({
    Key? key,
    this.applicantName,
    this.address,
    this.nik,
    this.totalSubmission,
    this.applicantCategory,
    this.aoName,
    this.ratingExplanation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Accordion(
      paddingListHorizontal: 0,
      headerBorderColor: ColorsConstant.grey500,
      headerBorderRadius: 8,
      headerBackgroundColor: ColorsConstant.white,
      headerBorderWidth: 1,
      openAndCloseAnimation: true,
      contentHorizontalPadding: 16,
      contentVerticalPadding: 16,
      paddingBetweenClosedSections: 16,
      paddingBetweenOpenSections: 16,
      maxOpenSections: 2,
      headerPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      rightIcon: Assets.images.chevronDown.svg(width: 24),
      disableScrolling: true,
      children: [
        AccordionSection(
          contentBorderColor: ColorsConstant.grey500,
          header: Text(
            'Detail Informasi Pemohon',
            style: TextStyleConstant.subHeading.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueWidget(
                  label: 'Nama Pemohon',
                  value: applicantName,
                ),
                LabelValueWidget(
                  label: 'Alamat',
                  value: address,
                ),
                LabelValueWidget(
                  label: 'NIK',
                  value: nik,
                ),
                LabelValueWidget(
                  label: 'Nominal Pengajuan',
                  value: totalSubmission,
                ),
                LabelValueWidget(
                  label: 'Jenis Pemohon',
                  value: applicantCategory,
                ),
                LabelValueWidget(
                  label: 'Nama AO Pengusul',
                  value: aoName,
                ),
              ],
            ),
          ),
        ),
        AccordionSection(
          contentBorderColor: ColorsConstant.grey500,
          header: Text(
            'Keterangan Rating: Special Mention',
            style: TextStyleConstant.subHeading.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            ratingExplanation ?? "",
            style: TextStyleConstant.body,
          ),
        ),
      ],
    );
  }
}
