// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class CreditScoreBadgeWidget extends StatelessWidget {
  final String? score;

  const CreditScoreBadgeWidget({
    Key? key,
    required this.score,
  }) : super(key: key);

  bool get isUnrated {
    return score == null ||
        score!.isEmpty ||
        score!.toLowerCase() == 'null' ||
        score == 'Belum Dinilai';
  }

  String get rating {
    if (isUnrated) return 'Belum Dinilai';

    final scoreNum = double.tryParse(score!)?.toInt() ?? 0;

    if (scoreNum >= 98) return 'AAA';
    if (scoreNum >= 95) return 'AA+';
    if (scoreNum >= 92) return 'AA';
    if (scoreNum >= 89) return 'AA-';
    if (scoreNum >= 86) return 'A+';
    if (scoreNum >= 83) return 'A';
    if (scoreNum >= 80) return 'A-';
    if (scoreNum >= 77) return 'BBB+';
    if (scoreNum >= 74) return 'BBB';
    if (scoreNum >= 71) return 'BBB-';
    if (scoreNum >= 68) return 'BB+';
    if (scoreNum >= 65) return 'BB';
    if (scoreNum >= 62) return 'BB-';
    if (scoreNum >= 59) return 'B+';
    if (scoreNum >= 56) return 'B';
    if (scoreNum >= 53) return 'B-';
    if (scoreNum >= 50) return 'CCC+';
    if (scoreNum >= 47) return 'CCC';
    if (scoreNum >= 44) return 'CCC-';
    if (scoreNum >= 0 && scoreNum <= 43) return 'D';
    return 'Belum Dinilai';
  }

  String get category {
    if (isUnrated) return 'Belum Dinilai';

    final scoreNum = double.tryParse(score!) ?? 0.0;

    if (scoreNum >= 98) return 'Outstanding';
    if (scoreNum >= 89) return 'Strong';
    if (scoreNum >= 80) return 'Good';
    if (scoreNum >= 71) return 'Average';
    if (scoreNum >= 65) return 'Acceptable';
    if (scoreNum >= 62) return 'High Risk';
    if (scoreNum >= 56) return 'Watch List';
    if (scoreNum >= 50) return 'Special Mention';
    if (scoreNum >= 44) return 'Substandard';
    if (scoreNum >= 0) return 'Doubtful';
    return 'Belum Dinilai';
  }

  Color get containerColor {
    if (isUnrated) return ColorsConstant.unrated100;

    switch (rating) {
      case 'AAA':
        return ColorsConstant.outstanding100;
      case 'AA+':
      case 'AA':
      case 'AA-':
        return ColorsConstant.strong100;
      case 'A+':
      case 'A':
      case 'A-':
        return ColorsConstant.good100;
      case 'BBB+':
      case 'BBB':
      case 'BBB-':
        return ColorsConstant.average100;
      case 'BB+':
      case 'BB':
        return ColorsConstant.acceptable100;
      case 'BB-':
        return ColorsConstant.highRisk100;
      case 'B+':
      case 'B':
        return ColorsConstant.watchList100;
      case 'B-':
        return ColorsConstant.highRisk100;
      case 'CCC+':
      case 'CCC':
        return ColorsConstant.specialMention100;
      case 'CCC-':
        return ColorsConstant.substandard100;
      case 'D':
        return ColorsConstant.doubtful100;
      default:
        return ColorsConstant.unrated100;
    }
  }

  Color get textColor {
    if (isUnrated) return ColorsConstant.unrated600;

    switch (rating) {
      case 'AAA':
        return ColorsConstant.outstanding600;
      case 'AA+':
      case 'AA':
      case 'AA-':
        return ColorsConstant.strong600;
      case 'A+':
      case 'A':
      case 'A-':
        return ColorsConstant.good600;
      case 'BBB+':
      case 'BBB':
      case 'BBB-':
        return ColorsConstant.average600;
      case 'BB+':
      case 'BB':
        return ColorsConstant.acceptable600;
      case 'BB-':
        return ColorsConstant.highRisk600;
      case 'B+':
      case 'B':
        return ColorsConstant.watchList600;
      case 'B-':
        return ColorsConstant.highRisk600;
      case 'CCC+':
      case 'CCC':
        return ColorsConstant.specialMention600;
      case 'CCC-':
        return ColorsConstant.substandard600;
      case 'D':
        return ColorsConstant.doubtful600;
      default:
        return ColorsConstant.unrated600;
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayText = isUnrated ? 'Belum Dinilai' : 'Skor: ${score!}';

    return Column(
      children: [
        Container(
          width: 124,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: containerColor,
          ),
          child: Center(
            child: Text(
              rating,
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 124,
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: ColorsConstant.white,
            border: Border.all(
              color: ColorsConstant.primary,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              displayText,
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorsConstant.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
