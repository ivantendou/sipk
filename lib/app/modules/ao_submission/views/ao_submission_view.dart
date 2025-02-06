import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_submission/views/widgets/submission_card_widget.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';

import '../controllers/ao_submission_controller.dart';

class AoSubmissionView extends GetView<AoSubmissionController> {
  const AoSubmissionView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: ColorsConstant.grey100,
          appBar: AppBar(
            toolbarHeight: 100,
            bottom: TabBar(
              labelStyle: TextStyleConstant.caption.copyWith(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelColor: ColorsConstant.grey700,
              unselectedLabelStyle: TextStyleConstant.caption,
              dividerColor: ColorsConstant.grey500,
              indicatorColor: ColorsConstant.primary,
              overlayColor: WidgetStatePropertyAll(
                ColorsConstant.primary.withValues(alpha: 0.2),
              ),
              splashBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(
                  text: 'Diproses',
                ),
                Tab(
                  text: 'Disetujui',
                ),
                Tab(
                  text: 'Ditolak',
                ),
              ],
            ),
            title: Column(
              children: [
                CustomIconButtonWidget(
                  icon: Assets.images.add1.svg(width: 24),
                  text: 'Ajukan Permohonan Pembiayaan',
                ),
                const SizedBox(height: 16),
                Text(
                  'Status Pengajuan Pembiayaan Bulan Ini',
                  style: TextStyleConstant.subHeading2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SubmissionCardWidget(
                  applicantName: 'Muhamad Ivan Fadillah',
                  scoringNumber: "08314",
                  status: "Diproses",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SubmissionCardWidget(
                  applicantName: 'Muhamad Ivan Fadillah',
                  scoringNumber: "08314",
                  status: "Disetujui",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SubmissionCardWidget(
                  applicantName: 'Muhamad Ivan Fadillah',
                  scoringNumber: "08314",
                  status: "Ditolak",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
