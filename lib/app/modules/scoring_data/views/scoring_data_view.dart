import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/filter_button_widget.dart';
import 'package:sipk/app/widgets/option_button_widget.dart';
import 'package:sipk/app/widgets/search_text_field_widget.dart';

import '../controllers/scoring_data_controller.dart';

class ScoringDataView extends GetView<ScoringDataController> {
  const ScoringDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarWidget(title: 'Data Skoring'),
        backgroundColor: ColorsConstant.grey100,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              SearchTextFieldWidget(
                hintText: 'Cari Data Skoring',
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  FilterButtonWidget(onTap: (){}),
                  OptionButtonWidget(onTap: (){}, option: 'Terbaru'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
