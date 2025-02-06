import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

class ScoreChartWidget extends StatelessWidget {
  final String? score;
  final String? rating;
  final String? scoreCategory;
  final String? applicantName;
  final String? scoringNumber;
  final String? scoringDate;

  const ScoreChartWidget ({
    Key? key,
    this.score,
    this.rating,
    this.scoreCategory,
    this.applicantName,
    this.scoringNumber,
    this.scoringDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      value: 93.2,
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
                      builder: (context, child, value) => Column(
                        children: [
                          Text(
                            score ?? "",
                            style: TextStyleConstant.h1,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 124,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: ColorsConstant.average100,
                            ),
                            child: Center(
                              child: Text(
                                rating ?? "",
                                style: TextStyleConstant.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsConstant.average600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            scoreCategory ?? "",
                            style: TextStyleConstant.body.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
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
                      value: applicantName,
                    ),
                    const SizedBox(height: 8),
                    LabelValueWidget(
                      label: "Nomor Skoring",
                      value: scoringNumber,
                    ),
                    const SizedBox(height: 8),
                    LabelValueWidget(
                      label: "Tanggal Skoring",
                      value: scoringDate,
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
}
