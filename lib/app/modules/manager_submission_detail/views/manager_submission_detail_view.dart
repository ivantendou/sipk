import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_submission_detail/views/widgets/detail_submission_card_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';

import '../controllers/manager_submission_detail_controller.dart';

class ManagerSubmissionDetailView
    extends GetView<ManagerSubmissionDetailController> {
  const ManagerSubmissionDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(title: 'Detail Pengajuan'),
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const DetailSubmissionCardWidget(
                  submissionId: 'Pengajuan-2232',
                  submissionStatus: 'Diproses',
                  officeBranch: 'Ciluar',
                  memberStatus: 'Anggota Baru',
                  financingPurposes: 'Investasi Usaha Tanah',
                  submissionDate: '4 Juni 2023',
                  totalSubmission: 'Rp2.000.000',
                ),
                const SizedBox(height: 16),
                CustomIconButtonWidget(
                  icon: Assets.images.pdf.svg(),
                  text: 'Lihat Proposal Pembiayaan',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomIconButtonWidget(
                        icon: Assets.images.cross.svg(),
                        text: 'Tolak',
                        backgroundColor: ColorsConstant.error,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomIconButtonWidget(
                        icon: Assets.images.check.svg(),
                        text: 'Terima',
                        backgroundColor: ColorsConstant.success,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
