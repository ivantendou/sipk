// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoringDetailAccordionWidget extends StatelessWidget {
  final String? applicantName;
  final String? address;
  final String? nik;
  final String? mobilePhone;
  final String? gender;
  final String? totalSubmission;
  final String? applicantCategory;
  final String? aoName;
  final num? score;

  const ScoringDetailAccordionWidget({
    Key? key,
    required this.applicantName,
    required this.address,
    required this.nik,
    required this.mobilePhone,
    required this.gender,
    required this.totalSubmission,
    required this.applicantCategory,
    required this.aoName,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratingInfo = _getRatingInfo(score);

    return Accordion(
      paddingListHorizontal: 0,
      headerBorderColor: ColorsConstant.grey300,
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
          contentBorderColor: ColorsConstant.grey300,
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
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Alamat',
                  value: address,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'NIK',
                  value: nik,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'No Telepon',
                  value: mobilePhone,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Jenis Kelamin',
                  value: gender,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Nominal Pengajuan',
                  value: _formatCurrency(totalSubmission != null
                      ? num.tryParse(totalSubmission!)
                      : null),
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Jenis Pemohon',
                  value: applicantCategory,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Nama Account Officer',
                  value: aoName,
                ),
              ],
            ),
          ),
        ),
        AccordionSection(
          contentBorderColor: ColorsConstant.grey300,
          header: Text(
            'Keterangan Rating: ${ratingInfo['rank'] ?? 'Special Mention'}',
            style: TextStyleConstant.subHeading.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Skor: ${score?.toStringAsFixed(1) ?? '-'}",
                style: TextStyleConstant.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Tingkat Rating: ${ratingInfo['rank'] ?? '-'} (${ratingInfo['rating'] ?? '-'})",
                style: TextStyleConstant.body,
              ),
              const SizedBox(height: 8),
              Text(
                "Kategori: ${ratingInfo['category'] ?? '-'}",
                style: TextStyleConstant.body,
              ),
              const SizedBox(height: 8),
              Text(
                "Penjelasan: ${ratingInfo['explanation'] ?? '-'}",
                style: TextStyleConstant.body,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatCurrency(num? value) {
    if (value == null) return '-';

    final format = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return format.format(value);
  }

  Map<String, String> _getRatingInfo(num? score) {
    if (score == null) return {};

    final num numericScore = score;

    if (numericScore >= 98) {
      return {
        'rank': 'AAA',
        'rating': 'Outstanding',
        'category': 'Sangat Baik',
        'explanation':
            'Ini adalah rating tertinggi dan terbaik yang diberikan kepada debitur. Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjaman bank dipandang tidak diragukan.'
      };
    } else if (numericScore >= 95) {
      return {
        'rank': 'AA+',
        'rating': 'Strong',
        'category': 'Sangat Baik',
        'explanation':
            'Debitur yang diberikan rating "AA+" hanya berbeda sedikit dari debitur yang diberikan rating tertinggi (AAA). Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya sangat baik.'
      };
    } else if (numericScore >= 92) {
      return {
        'rank': 'AA',
        'rating': 'Strong',
        'category': 'Sangat Baik',
        'explanation':
            'Debitur yang diberikan rating "AA" hanya berbeda sedikit dari debitur yang diberikan rating tertinggi (AAA). Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya sangat baik.'
      };
    } else if (numericScore >= 89) {
      return {
        'rank': 'AA-',
        'rating': 'Strong',
        'category': 'Sangat Baik',
        'explanation':
            'Debitur yang diberikan rating "AA-" hanya berbeda sedikit dari debitur yang diberikan rating tertinggi (AAA). Kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya sangat baik.'
      };
    } else if (numericScore >= 86) {
      return {
        'rank': 'A+',
        'rating': 'Good',
        'category': 'Baik',
        'explanation':
            'Debitur yang diberikan rating "A+" agak lebih rentan terhadap keadaan dan kondisi ekonomi yang memburuk dari pada debitur pada rating yang lebih tinggi. Meskipun demikian kapasitas debitur untuk memenuhi komitmen keuangannya pada obligasi masih kuat.'
      };
    } else if (numericScore >= 83) {
      return {
        'rank': 'A',
        'rating': 'Good',
        'category': 'Baik',
        'explanation':
            'Debitur yang diberikan rating "A" agak lebih rentan terhadap keadaan dan kondisi ekonomi yang memburuk dari pada debitur pada rating yang lebih tinggi. Meskipun demikian kapasitas debitur untuk memenuhi komitmen keuangannya pada obligasi masih kuat.'
      };
    } else if (numericScore >= 80) {
      return {
        'rank': 'A-',
        'rating': 'Good',
        'category': 'Baik',
        'explanation':
            'Debitur yang diberikan rating "A-" agak lebih rentan terhadap keadaan dan kondisi ekonomi yang memburuk dari pada debitur pada rating yang lebih tinggi. Meskipun demikian kapasitas debitur untuk memenuhi komitmen keuangannya pada obligasi masih kuat.'
      };
    } else if (numericScore >= 77) {
      return {
        'rank': 'BBB+',
        'rating': 'Average',
        'category': 'Cukup',
        'explanation':
            'Debitur yang mendapat rating "BBB+" memperlihatkan kondisi yang memadai. Meskipun demikian kondisi ekonomi yang memburuk kemungkinan besar akan memperlemah kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya.'
      };
    } else if (numericScore >= 74) {
      return {
        'rank': 'BBB',
        'rating': 'Average',
        'category': 'Cukup',
        'explanation':
            'Debitur yang mendapat rating "BBB" memperlihatkan kondisi yang memadai. Meskipun demikian kondisi ekonomi yang memburuk kemungkinan besar akan memperlemah kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya.'
      };
    } else if (numericScore >= 71) {
      return {
        'rank': 'BBB-',
        'rating': 'Average',
        'category': 'Cukup',
        'explanation':
            'Debitur yang mendapat rating "BBB-" memperlihatkan kondisi yang memadai. Meskipun demikian kondisi ekonomi yang memburuk kemungkinan besar akan memperlemah kapasitas debitur untuk memenuhi komitmen keuangannya pada pinjamannya.'
      };
    } else if (numericScore >= 68) {
      return {
        'rank': 'BB+',
        'rating': 'Acceptable',
        'category': 'Kurang',
        'explanation':
            'Debitur yang diberikan rating "BB+" lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 65) {
      return {
        'rank': 'BB',
        'rating': 'Acceptable',
        'category': 'Kurang',
        'explanation':
            'Debitur yang diberikan rating "BB" lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 62) {
      return {
        'rank': 'BB-',
        'rating': 'High Risk',
        'category': 'Risiko Tinggi',
        'explanation':
            'Debitur yang diberikan rating "BB-" lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 59) {
      return {
        'rank': 'B+',
        'rating': 'High Risk',
        'category': 'Risiko Tinggi',
        'explanation':
            'Debitur yang diberikan rating "B+" lebih rentan untuk menjadi kredit macet dari pada debitur yang diberikan rating "BB". Debitur saat ini memiliki kapasitas untuk memenuhi komitmen keuangannya pada pinjamannya. Kondisi bisnis, keuangan atau ekonomi yang memburuk kemungkinan akan mengganggu kemampuan debitur untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 56) {
      return {
        'rank': 'B',
        'rating': 'Watch List',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "B" lebih rentan untuk menjadi kredit macet dari pada debitur yang diberikan rating "BB". Debitur saat ini memiliki kapasitas untuk memenuhi komitmen keuangannya pada pinjamannya. Kondisi bisnis, keuangan atau ekonomi yang memburuk kemungkinan akan mengganggu kemampuan debitur untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 53) {
      return {
        'rank': 'B-',
        'rating': 'Watch List',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "B-" lebih rentan untuk menjadi kredit macet dari pada debitur yang diberikan rating "BB". Debitur saat ini memiliki kapasitas untuk memenuhi komitmen keuangannya pada pinjamannya. Kondisi bisnis, keuangan atau ekonomi yang memburuk kemungkinan akan mengganggu kemampuan debitur untuk memenuhi komitmen pinjamannya.'
      };
    } else if (numericScore >= 50) {
      return {
        'rank': 'CCC+',
        'rating': 'Special Mention',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "CCC+" saat ini rentan untuk menjadi kredit macet. Debitur ini tergantung pada kondisi bisnis, keuangan dan ekonomi yang baik agar debitur dapat memenuhi komitmen pinjamannya. Saat kondisi bisnis, keuangan atau ekonomi memburuk, debitur kemungkinan besar tidak mempunyai kapasitas untuk memenuhi kewajiban keuangannya.'
      };
    } else if (numericScore >= 47) {
      return {
        'rank': 'CCC',
        'rating': 'Special Mention',
        'category': 'Perhatian Khusus',
        'explanation':
            'Debitur yang diberikan rating "CCC" saat ini rentan untuk menjadi kredit macet. Debitur ini tergantung pada kondisi bisnis, keuangan dan ekonomi yang baik agar debitur dapat memenuhi komitmen pinjamannya. Saat kondisi bisnis, keuangan atau ekonomi memburuk, debitur kemungkinan besar tidak mempunyai kapasitas untuk memenuhi kewajiban keuangannya.'
      };
    } else if (numericScore >= 44) {
      return {
        'rank': 'CCC-',
        'rating': 'Substandard',
        'category': 'Tidak Sehat',
        'explanation':
            'Debitur yang diberikan rating "CCC-" saat ini rentan untuk menjadi kredit macet. Debitur ini tergantung pada kondisi bisnis, keuangan dan ekonomi yang baik agar debitur dapat memenuhi komitmen pinjamannya. Saat kondisi bisnis, keuangan atau ekonomi memburuk, debitur kemungkinan besar tidak mempunyai kapasitas untuk memenuhi kewajiban keuangannya.'
      };
    } else {
      return {
        'rank': 'D',
        'rating': 'Doubtful',
        'category': 'Diragukan',
        'explanation':
            'Tidak prospektif. Rating ini diberikan kepada debitur yang diperkirakan akan menjadi kredit macet.'
      };
    }
  }
}
