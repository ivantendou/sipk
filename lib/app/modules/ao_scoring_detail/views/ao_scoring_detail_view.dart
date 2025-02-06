import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_scoring_detail/views/widgets/score_chart_widget.dart';
import 'package:sipk/app/modules/ao_scoring_detail/views/widgets/submission_button_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';
import 'package:sipk/app/widgets/label_value_widget.dart';

import '../controllers/ao_scoring_detail_controller.dart';

class AoScoringDetailView extends GetView<AoScoringDetailController> {
  const AoScoringDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          title: 'Hasil Skoring Pembiayaan',
        ),
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const ScoreChartWidget(
                  score: '92.5',
                  rating: 'BBB+',
                  scoreCategory: 'Average',
                ),
                Accordion(
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
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  rightIcon: Assets.images.chevronDown.svg(width: 24),
                  disableScrolling: true,
                  children: [
                    AccordionSection(
                      contentBorderColor: ColorsConstant.grey500,
                      header: Text(
                        'Keterangan Rating: Special Mention',
                        style: TextStyleConstant.subHeading.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Debitur yang diberikan rating ‘BB-’ lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya. ',
                        style: TextStyleConstant.body,
                      ),
                    ),
                    AccordionSection(
                      contentBorderColor: ColorsConstant.grey500,
                      header: Text(
                        'Detail Informasi Pemohon',
                        style: TextStyleConstant.subHeading.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Debitur yang diberikan rating ‘BB-’ lebih baik dibandingkan dengan debitur yang mendapat rating B dalam hal pembayaran pinjaman. Meskipun demikian, debitur ini menghadapi ketidakpastian yang besar pada kondisi bisnis, keuangan atau ekonomi yang memburuk yang dapat mengarah pada kapasitas debitur yang tidak memadai untuk memenuhi komitmen pinjamannya. ',
                        style: TextStyleConstant.body,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
        floatingActionButton: SubmissionButtonWidget(onTap: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
