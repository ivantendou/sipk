// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';

class MonthlyTargetCardWidget extends StatelessWidget {
  final double? percent;
  final String? totalCollected;
  final String? totalSubmission;

  const MonthlyTargetCardWidget({
    Key? key,
    this.percent,
    this.totalCollected,
    this.totalSubmission,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayPercent = ((percent ?? 0.0) * 100).toStringAsFixed(0);

    final double collectedAmount =
        double.tryParse(totalCollected ?? "0") ?? 0.0;
    final formattedTotalCollected = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(collectedAmount);
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: ColorsConstant.white,
          boxShadow: [
            BoxShadow(
              color: ColorsConstant.black.withValues(alpha: 0.05),
              offset: const Offset(0, 2),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Financing Target Achievement',
              style: TextStyleConstant.body.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            LayoutBuilder(
              builder: (context, constraint) {
                return LinearPercentIndicator(
                  width: constraint.maxWidth,
                  lineHeight: 20,
                  percent: percent ?? 0,
                  padding: const EdgeInsets.all(0),
                  backgroundColor: ColorsConstant.grey500,
                  progressColor: ColorsConstant.primary,
                  barRadius: const Radius.circular(8),
                  animateToInitialPercent: true,
                  animation: true,
                  center: Text(
                    "$displayPercent%",
                    style: TextStyleConstant.caption
                        .copyWith(color: ColorsConstant.white),
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyleConstant.caption,
                children: [
                  TextSpan(
                    text: formattedTotalCollected,
                    style: TextStyleConstant.caption.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: " has been achieved out of ",
                  ),
                  TextSpan(
                    text: "Rp. 200.000.000",
                    style: TextStyleConstant.caption.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: TextStyleConstant.caption,
                children: [
                  TextSpan(
                    text: totalSubmission ?? "0",
                    style: TextStyleConstant.caption.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: " financing applications have been approved.",
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
