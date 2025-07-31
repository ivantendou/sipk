import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_submission/views/widgets/submission_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/custom_icon_button_widget.dart';
import 'package:sipk/models/financing_application_model.dart';
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
                Tab(text: 'In Process'),
                Tab(text: 'Approved'),
                Tab(text: 'Rejected'),
              ],
            ),
            title: Column(
              children: [
                CustomIconButtonWidget(
                  icon: Assets.images.add1.svg(width: 24),
                  text: 'Submit Financing Application',
                  onTap: () {
                    Get.toNamed(Routes.SUBMISSION_FORM);
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  "This Month's Financing Application Status",
                  style: TextStyleConstant.subHeading2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          body: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: SizedBox(
                  width: 48,
                  child: LoadingIndicator(
                    indicatorType: Indicator.ballBeat,
                    strokeWidth: 4.0,
                    colors: [Theme.of(context).primaryColor],
                  ),
                ),
              );
            }

            return TabBarView(
              children: [
                RefreshIndicator(
                  color: ColorsConstant.primary,
                  onRefresh: controller.refreshApplications,
                  child: _buildApplicationsList(
                      controller.pendingApplications, 'In Process'),
                ),
                RefreshIndicator(
                  color: ColorsConstant.primary,
                  onRefresh: controller.refreshApplications,
                  child: _buildApplicationsList(
                      controller.acceptedApplications, 'Approved'),
                ),
                RefreshIndicator(
                  color: ColorsConstant.primary,
                  onRefresh: controller.refreshApplications,
                  child: _buildApplicationsList(
                      controller.rejectedApplications, 'Rejected'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildApplicationsList(
      List<FinancingApplicationModel> applications, String status) {
    return applications.isEmpty
        ? _buildEmptyList(status)
        : ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: applications.length,
            itemBuilder: (context, index) {
              final application = applications[index];
              final scoringNumber =
                  application.financingApplication?.id?.toString() ?? '';

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SubmissionCardWidget(
                  applicantName: application.applicant?.name ?? '-',
                  scoringNumber: scoringNumber,
                  status: status,
                  onTap: () {
                    Get.toNamed(
                      Routes.SUBMISSION_DETAIL,
                      parameters: {
                        'id': application.financingApplication?.id.toString() ??
                            "",
                      },
                    );
                  },
                ),
              );
            },
          );
  }

  Widget _buildEmptyList(String status) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 300,
          child: Center(
            child: Text(
              'No applications with $status status',
              style: TextStyleConstant.body,
            ),
          ),
        ),
      ],
    );
  }
}
