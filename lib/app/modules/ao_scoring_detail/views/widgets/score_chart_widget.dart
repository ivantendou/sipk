import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoreChartWidget extends StatelessWidget {
  final double? score;
  final String? applicantName;
  final String? scoringNumber;
  final String? scoringDate;

  const ScoreChartWidget({
    Key? key,
    this.score,
    required this.applicantName,
    required this.scoringNumber,
    required this.scoringDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> getRatingCategory(double? score) {
      if (score == null || score.toString().toLowerCase() == 'null') {
        return {
          'rating': 'Belum Dinilai',
          'category': 'Belum Dinilai',
          'containerColor': ColorsConstant.unrated100,
          'textColor': ColorsConstant.unrated600,
        };
      }

      final int scoreNum = score.toInt();
      String rating = 'Belum Dinilai';
      String category = 'Belum Dinilai';
      Color containerColor = ColorsConstant.unrated100;
      Color textColor = ColorsConstant.unrated600;

      if (scoreNum >= 98) {
        rating = 'AAA';
        category = 'Outstanding';
        containerColor = ColorsConstant.outstanding100;
        textColor = ColorsConstant.outstanding600;
      } else if (scoreNum >= 95) {
        rating = 'AA+';
        category = 'Strong';
        containerColor = ColorsConstant.strong100;
        textColor = ColorsConstant.strong600;
      } else if (scoreNum >= 92) {
        rating = 'AA';
        category = 'Strong';
        containerColor = ColorsConstant.strong100;
        textColor = ColorsConstant.strong600;
      } else if (scoreNum >= 89) {
        rating = 'AA-';
        category = 'Strong';
        containerColor = ColorsConstant.strong100;
        textColor = ColorsConstant.strong600;
      } else if (scoreNum >= 86) {
        rating = 'A+';
        category = 'Good';
        containerColor = ColorsConstant.good100;
        textColor = ColorsConstant.good600;
      } else if (scoreNum >= 83) {
        rating = 'A';
        category = 'Good';
        containerColor = ColorsConstant.good100;
        textColor = ColorsConstant.good600;
      } else if (scoreNum >= 80) {
        rating = 'A-';
        category = 'Good';
        containerColor = ColorsConstant.good100;
        textColor = ColorsConstant.good600;
      } else if (scoreNum >= 77) {
        rating = 'BBB+';
        category = 'Average';
        containerColor = ColorsConstant.average100;
        textColor = ColorsConstant.average600;
      } else if (scoreNum >= 74) {
        rating = 'BBB';
        category = 'Average';
        containerColor = ColorsConstant.average100;
        textColor = ColorsConstant.average600;
      } else if (scoreNum >= 71) {
        rating = 'BBB-';
        category = 'Average';
        containerColor = ColorsConstant.average100;
        textColor = ColorsConstant.average600;
      } else if (scoreNum >= 68) {
        rating = 'BB+';
        category = 'Acceptable';
        containerColor = ColorsConstant.acceptable100;
        textColor = ColorsConstant.acceptable600;
      } else if (scoreNum >= 65) {
        rating = 'BB';
        category = 'Acceptable';
        containerColor = ColorsConstant.acceptable100;
        textColor = ColorsConstant.acceptable600;
      } else if (scoreNum >= 62) {
        rating = 'BB-';
        category = 'High Risk';
        containerColor = ColorsConstant.highRisk100;
        textColor = ColorsConstant.highRisk600;
      } else if (scoreNum >= 59) {
        rating = 'B+';
        category = 'Watch List';
        containerColor = ColorsConstant.watchList100;
        textColor = ColorsConstant.watchList600;
      } else if (scoreNum >= 56) {
        rating = 'B';
        category = 'Watch List';
        containerColor = ColorsConstant.watchList100;
        textColor = ColorsConstant.watchList600;
      } else if (scoreNum >= 53) {
        rating = 'B-';
        category = 'High Risk';
        containerColor = ColorsConstant.highRisk100;
        textColor = ColorsConstant.highRisk600;
      } else if (scoreNum >= 50) {
        rating = 'CCC+';
        category = 'Special Mention';
        containerColor = ColorsConstant.specialMention100;
        textColor = ColorsConstant.specialMention600;
      } else if (scoreNum >= 47) {
        rating = 'CCC';
        category = 'Special Mention';
        containerColor = ColorsConstant.specialMention100;
        textColor = ColorsConstant.specialMention600;
      } else if (scoreNum >= 44) {
        rating = 'CCC-';
        category = 'Substandard';
        containerColor = ColorsConstant.substandard100;
        textColor = ColorsConstant.substandard600;
      } else if (scoreNum >= 0) {
        rating = 'D';
        category = 'Doubtful';
        containerColor = ColorsConstant.doubtful100;
        textColor = ColorsConstant.doubtful600;
      }

      return {
        'rating': rating,
        'category': category,
        'containerColor': containerColor,
        'textColor': textColor,
      };
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: ColorsConstant.white,
                  boxShadow: [
                    BoxShadow(
                      color: ColorsConstant.black.withValues(alpha: 0.2),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedRadialGauge(
                      value: score ?? 0,
                      duration: const Duration(milliseconds: 3000),
                      radius: (MediaQuery.of(context).size.width - 64) / 2,
                      axis: const GaugeAxis(
                        min: 0,
                        max: 100,
                        degrees: 180,
                        style: GaugeAxisStyle(
                          thickness: 20,
                          background: ColorsConstant.grey400,
                          segmentSpacing: 2,
                          cornerRadius: Radius.circular(16),
                        ),
                        progressBar: GaugeProgressBar.rounded(
                          gradient: GaugeAxisGradient(
                            colors: [
                              Color(0xFFFF0000),
                              Color(0xFFFF4000),
                              Color(0xFFFF8000),
                              Color(0xFFFFBF00),
                              Color(0xFFFFFF00),
                              Color(0xFFBFFF00),
                              Color(0xFF80FF00),
                              Color(0xFF40FF00),
                              Color(0xFF00FF00),
                              Color(0xFF00DF00),
                              Color(0xFF00BF00),
                              Color(0xFF009F00),
                              Color(0xFF008000),
                              Color(0xFF007000),
                              Color(0xFF006000),
                              Color(0xFF005000),
                              Color(0xFF004000),
                              Color(0xFF003000),
                              Color(0xFF002000),
                              Color(0xFF001000),
                            ],
                            colorStops: [
                              0.43,
                              0.46,
                              0.49,
                              0.52,
                              0.55,
                              0.58,
                              0.61,
                              0.64,
                              0.67,
                              0.70,
                              0.73,
                              0.76,
                              0.79,
                              0.82,
                              0.85,
                              0.88,
                              0.91,
                              0.94,
                              0.97,
                              1.00,
                            ],
                          ),
                        ),
                      ),
                      builder: (context, child, value) {
                        final ratingInfo = getRatingCategory(score);
                        return Column(
                          children: [
                            Text(
                              score?.toStringAsFixed(1) ?? '0.0',
                              style: TextStyleConstant.h1,
                            ),
                            const SizedBox(height: 4),
                            Container(
                              width: 124,
                              height: 28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ratingInfo['containerColor'],
                              ),
                              child: Center(
                                child: Text(
                                  ratingInfo['rating'],
                                  style: TextStyleConstant.body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: ratingInfo['textColor'],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ratingInfo['category'],
                              style: TextStyleConstant.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 30,
                            child: Center(
                              child: Text(
                                '0',
                                style: TextStyleConstant.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstant.grey700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 32,
                            child: Center(
                              child: Text(
                                '100',
                                style: TextStyleConstant.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstant.grey700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    LabelValueWidget(
                      label: "Nama Pemohon",
                      value: applicantName ?? "",
                    ),
                    const SizedBox(height: 8),
                    LabelValueWidget(
                      label: "Nomor Skoring",
                      value: scoringNumber ?? "",
                    ),
                    const SizedBox(height: 8),
                    LabelValueWidget(
                      label: "Tanggal Skoring",
                      value: formatDate(scoringDate),
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

  String formatDate(String? dateStr) {
    DateTime dateTime = DateTime.parse(dateStr ?? "").toLocal();
    List<String> months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return "${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}";
  }
}
