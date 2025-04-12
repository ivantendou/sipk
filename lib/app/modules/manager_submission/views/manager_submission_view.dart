import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/ao_home_appbar_widget.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/header_with_see_all_widget.dart';
import 'package:sipk/app/modules/manager_submission/views/widgets/submission_data_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';

import '../controllers/manager_submission_controller.dart';

class ManagerSubmissionView extends GetView<ManagerSubmissionController> {
  const ManagerSubmissionView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Obx(
            () => AoHomeAppbarWidget(
              imageUrl: "",
              name: controller.username.value,
            ),
          ),
        ),
        backgroundColor: ColorsConstant.grey100,
        body: RefreshIndicator(
          onRefresh: () async {
            controller.refreshSubmissions();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.SUBMISSION_DATA);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorsConstant.white,
                      border: Border.all(
                        color: ColorsConstant.grey500,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cari Data Pengajuan',
                          style: TextStyleConstant.body.copyWith(
                            color: ColorsConstant.grey700,
                          ),
                        ),
                        Assets.images.search.svg(
                          colorFilter: const ColorFilter.mode(
                            ColorsConstant.grey700,
                            BlendMode.srcIn,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                HeaderWithSeeAllWidget(
                  title: 'Pengajuan Terbaru',
                  onTap: () {
                    Get.toNamed(Routes.SUBMISSION_DATA);
                  },
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: _buildSubmissionsList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildSubmissionsList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: SizedBox(
            width: 48,
            child: LoadingIndicator(
              indicatorType: Indicator.ballBeat,
              strokeWidth: 4.0,
              colors: [Get.theme.primaryColor],
            ),
          ),
        );
      }
      
      if (controller.hasError.value) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.images.errorImage.svg(width: 240),
              const SizedBox(height: 6),
              const Text(
                'Terjadi Kesalahan',
                style: TextStyleConstant.subHeading2,
              ),
              const SizedBox(height: 4),
              Text(
                'Pastikan perangkat Anda terhubung ke internet dan coba lagi.',
                textAlign: TextAlign.center,
                style: TextStyleConstant.body.copyWith(
                  color: ColorsConstant.grey700,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => controller.refreshSubmissions(),
                child: const Text('Coba Lagi'),
              ),
            ],
          ),
        );
      }
      
      if (controller.latestSubmissions.isEmpty) {
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Tidak ada data ditemukan',
              style: TextStyleConstant.body,
            ),
          ),
        );
      }
      
      return ListView.builder(
        itemCount: controller.latestSubmissions.length,
        itemBuilder: (context, index) {
          final data = controller.latestSubmissions[index];
          return SubmissionDataCardWidget(
            applicantName: data.name,
            financingPurpose: data.allocation,
            applicationNumber: data.id,
            applicationStatus: data.applicationStatus,
            submissionDate: data.createdAt.toString(),
            totalSubmission: data.applicationAmount.toString(),
            onTap: () {
              Get.toNamed(
                Routes.SUBMISSION_DETAIL,
                parameters: {'id': data.id.toString()},
              );
            },
          );
        },
      );
    });
  }
}