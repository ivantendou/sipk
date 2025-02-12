import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/ao_home_appbar_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/header_with_see_all_widget.dart';
import 'package:sipk/app/modules/submission_data/views/widgets/submission_data_card_widget.dart';
import 'package:sipk/app/widgets/search_text_field_widget.dart';

import '../controllers/manager_submission_controller.dart';

class ManagerSubmissionView extends GetView<ManagerSubmissionController> {
  const ManagerSubmissionView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AoHomeAppbarWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 16),
                SearchTextFieldWidget(hintText: 'Cari Data Pengajuan'),
                SizedBox(height: 16),
                HeaderWithSeeAllWidget(title: 'Pengajuan Terbaru'),
                SizedBox(height: 8),
                SubmissionDataCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
