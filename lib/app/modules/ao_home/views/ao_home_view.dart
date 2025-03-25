import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/ao_home_appbar_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/header_with_see_all_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/monthly_target_card_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/scoring_draft_card_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/scoring_result_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';

import '../controllers/ao_home_controller.dart';

class AoHomeView extends GetView<AoHomeController> {
  const AoHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AoHomeAppbarWidget(
          imageUrl: "",
          name: "Muhamad Ivan Fadillah",
        ),
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const MonthlyTargetCardWidget(),
                const SizedBox(height: 16),
                CustomIconButtonWidget(
                  icon: Assets.images.add1.svg(width: 24),
                  text: "Mulai Skoring Pembiayaan Baru",
                  onTap: () {
                    Get.toNamed(Routes.SCORING_FORM);
                  },
                ),
                const SizedBox(height: 20),
                const HeaderWithSeeAllWidget(title: "Draf Skoring"),
                const SizedBox(height: 8),
                ScoringDraftCardWidget(
                  onTap: () {},
                  applicantName: "Muhamad Ivan Fadillah",
                  scoringNumber: "0848375",
                ),
                const SizedBox(height: 16),
                const HeaderWithSeeAllWidget(title: "Hasil Skoring"),
                const SizedBox(height: 8),
                ScoringResultCardWidget(
                  applicantName: "Muhamad Ivan Fadillah",
                  scoringNumber: "203284",
                  rating: "BBB+",
                  score: "92.5",
                  onTap: () {},
                ),
                const SizedBox(width: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
