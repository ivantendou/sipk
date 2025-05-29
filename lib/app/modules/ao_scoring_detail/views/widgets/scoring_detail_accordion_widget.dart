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
            'Applicant Information Details',
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
                  label: 'Applicant Name',
                  value: applicantName,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Address',
                  value: address,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'NIK',
                  value: nik,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Phone Number',
                  value: mobilePhone,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Gender',
                  value: gender,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Total Applications',
                  value: _formatCurrency(totalSubmission != null
                      ? num.tryParse(totalSubmission!)
                      : null),
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Applicant Category',
                  value: applicantCategory,
                ),
                const SizedBox(height: 8),
                LabelValueWidget(
                  label: 'Account Officer Name',
                  value: aoName,
                ),
              ],
            ),
          ),
        ),
        AccordionSection(
          contentBorderColor: ColorsConstant.grey300,
          header: Text(
            'Rating Description: ${ratingInfo['rank'] ?? 'Special Mention'}',
            style: TextStyleConstant.subHeading.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Score: ${score?.toStringAsFixed(1) ?? '-'}",
                style: TextStyleConstant.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Rating Level: ${ratingInfo['rank'] ?? '-'} (${ratingInfo['rating'] ?? '-'})",
                style: TextStyleConstant.body,
              ),
              const SizedBox(height: 8),
              Text(
                "Category: ${ratingInfo['category'] ?? '-'}",
                style: TextStyleConstant.body,
              ),
              const SizedBox(height: 8),
              Text(
                "Explanation: ${ratingInfo['explanation'] ?? '-'}",
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
        'category': 'Very Good',
        'explanation':
            'This is the highest and best rating given to a debtor. The debtor\'s capacity to meet their financial commitments on bank loans is considered undoubted.'
      };
    } else if (numericScore >= 95) {
      return {
        'rank': 'AA+',
        'rating': 'Strong',
        'category': 'Very Good',
        'explanation':
            'Debtors with an "AA+" rating differ only slightly from debtors with the highest rating (AAA). The debtor\'s capacity to meet their financial commitments on their loans is very good.'
      };
    } else if (numericScore >= 92) {
      return {
        'rank': 'AA',
        'rating': 'Strong',
        'category': 'Very Good',
        'explanation':
            'Debtors with an "AA" rating differ only slightly from debtors with the highest rating (AAA). The debtor\'s capacity to meet their financial commitments on their loans is very good.'
      };
    } else if (numericScore >= 89) {
      return {
        'rank': 'AA-',
        'rating': 'Strong',
        'category': 'Very Good',
        'explanation':
            'Debtors with an "AA-" rating differ only slightly from debtors with the highest rating (AAA). The debtor\'s capacity to meet their financial commitments on their loans is very good.'
      };
    } else if (numericScore >= 86) {
      return {
        'rank': 'A+',
        'rating': 'Good',
        'category': 'Good',
        'explanation':
            'Debtors with an "A+" rating are somewhat more vulnerable to deteriorating economic conditions than debtors with higher ratings. Nevertheless, the debtor\'s capacity to meet their financial commitments on their obligations remains strong.'
      };
    } else if (numericScore >= 83) {
      return {
        'rank': 'A',
        'rating': 'Good',
        'category': 'Good',
        'explanation':
            'Debtors with an "A" rating are somewhat more vulnerable to deteriorating economic conditions than debtors with higher ratings. Nevertheless, the debtor\'s capacity to meet their financial commitments on their obligations remains strong.'
      };
    } else if (numericScore >= 80) {
      return {
        'rank': 'A-',
        'rating': 'Good',
        'category': 'Good',
        'explanation':
            'Debtors with an "A-" rating are somewhat more vulnerable to deteriorating economic conditions than debtors with higher ratings. Nevertheless, the debtor\'s capacity to meet their financial commitments on their obligations remains strong.'
      };
    } else if (numericScore >= 77) {
      return {
        'rank': 'BBB+',
        'rating': 'Average',
        'category': 'Sufficient',
        'explanation':
            'Debtors with a "BBB+" rating show adequate conditions. However, deteriorating economic conditions are likely to weaken the debtor\'s capacity to meet their financial commitments on their loans.'
      };
    } else if (numericScore >= 74) {
      return {
        'rank': 'BBB',
        'rating': 'Average',
        'category': 'Sufficient',
        'explanation':
            'Debtors with a "BBB" rating show adequate conditions. However, deteriorating economic conditions are likely to weaken the debtor\'s capacity to meet their financial commitments on their loans.'
      };
    } else if (numericScore >= 71) {
      return {
        'rank': 'BBB-',
        'rating': 'Average',
        'category': 'Sufficient',
        'explanation':
            'Debtors with a "BBB-" rating show adequate conditions. However, deteriorating economic conditions are likely to weaken the debtor\'s capacity to meet their financial commitments on their loans.'
      };
    } else if (numericScore >= 68) {
      return {
        'rank': 'BB+',
        'rating': 'Acceptable',
        'category': 'Less Than Good',
        'explanation':
            'Debtors with a "BB+" rating are better than debtors with a "B" rating in terms of loan repayment. However, these debtors face significant uncertainty under deteriorating business, financial, or economic conditions, which could lead to an inadequate capacity to meet their loan commitments.'
      };
    } else if (numericScore >= 65) {
      return {
        'rank': 'BB',
        'rating': 'Acceptable',
        'category': 'Less Than Good',
        'explanation':
            'Debtors with a "BB" rating are better than debtors with a "B" rating in terms of loan repayment. However, these debtors face significant uncertainty under deteriorating business, financial, or economic conditions, which could lead to an inadequate capacity to meet their loan commitments.'
      };
    } else if (numericScore >= 62) {
      return {
        'rank': 'BB-',
        'rating': 'High Risk',
        'category': 'High Risk',
        'explanation':
            'Debtors with a "BB-" rating are better than debtors with a "B" rating in terms of loan repayment. However, these debtors face significant uncertainty under deteriorating business, financial, or economic conditions, which could lead to an inadequate capacity to meet their loan commitments.'
      };
    } else if (numericScore >= 59) {
      return {
        'rank': 'B+',
        'rating': 'High Risk',
        'category': 'High Risk',
        'explanation':
            'Debtors with a "B+" rating are more susceptible to default than debtors with a "BB" rating. The debtor currently has the capacity to meet their financial commitments on their loans. Deteriorating business, financial, or economic conditions are likely to impair the debtor\'s ability to meet their loan commitments.'
      };
    } else if (numericScore >= 56) {
      return {
        'rank': 'B',
        'rating': 'Watch List',
        'category': 'Special Attention',
        'explanation':
            'Debtors with a "B" rating are more susceptible to default than debtors with a "BB" rating. The debtor currently has the capacity to meet their financial commitments on their loans. Deteriorating business, financial, or economic conditions are likely to impair the debtor\'s ability to meet their loan commitments.'
      };
    } else if (numericScore >= 53) {
      return {
        'rank': 'B-',
        'rating': 'Watch List',
        'category': 'Special Attention',
        'explanation':
            'Debtors with a "B-" rating are more susceptible to default than debtors with a "BB" rating. The debtor currently has the capacity to meet their financial commitments on their loans. Deteriorating business, financial, or economic conditions are likely to impair the debtor\'s ability to meet their loan commitments.'
      };
    } else if (numericScore >= 50) {
      return {
        'rank': 'CCC+',
        'rating': 'Special Mention',
        'category': 'Special Attention',
        'explanation':
            'Debtors with a "CCC+" rating are currently vulnerable to default. These debtors depend on favorable business, financial, and economic conditions to meet their loan commitments. When business, financial, or economic conditions deteriorate, the debtor is likely to lack the capacity to meet their financial obligations.'
      };
    } else if (numericScore >= 47) {
      return {
        'rank': 'CCC',
        'rating': 'Special Mention',
        'category': 'Special Attention',
        'explanation':
            'Debtors with a "CCC" rating are currently vulnerable to default. These debtors depend on favorable business, financial, and economic conditions to meet their loan commitments. When business, financial, or economic conditions deteriorate, the debtor is likely to lack the capacity to meet their financial obligations.'
      };
    } else if (numericScore >= 44) {
      return {
        'rank': 'CCC-',
        'rating': 'Substandard',
        'category': 'Unhealthy',
        'explanation':
            'Debtors with a "CCC-" rating are currently vulnerable to default. These debtors depend on favorable business, financial, and economic conditions to meet their loan commitments. When business, financial, or economic conditions deteriorate, the debtor is likely to lack the capacity to meet their financial obligations.'
      };
    } else {
      return {
        'rank': 'D',
        'rating': 'Doubtful',
        'category': 'Doubtful',
        'explanation':
            'Unprospective. This rating is given to debtors who are expected to default.'
      };
    }
  }
}
