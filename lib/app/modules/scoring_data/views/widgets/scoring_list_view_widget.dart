import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/scoring_data/controllers/scoring_data_controller.dart';
import 'package:sipk/app/modules/scoring_data/views/widgets/scoring_data_card_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/models/credit_scores_model.dart';

class ScoringListViewWidget extends StatelessWidget {
  final ScoringDataController controller;

  const ScoringListViewWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsConstant.primary,
      onRefresh: () async {
        controller.pagingController.refresh();
      },
      child: PagedListView<int, CreditScoresModel>(
        pagingController: controller.pagingController,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        builderDelegate: PagedChildBuilderDelegate<CreditScoresModel>(
          itemBuilder: (context, data, index) {
            return Obx(() {
              final isSelected =
                  controller.selectedCreditScores[data.id] ?? false;
              return ScoringDataCardWidget(
                applicantName: data.name,
                scoringNumber: data.id,
                telephoneNumber: data.mobilePhone,
                score: data.creditEvaluations?.first.creditScores?.totalScore
                        .toString() ??
                    "",
                scoringStatus:
                    data.creditEvaluations?.first.creditScores?.isDraft,
                scoringDate: data
                        .creditEvaluations?.first.creditScores?.updatedAt
                        .toString() ??
                    "2025-04-03 11:57:06.956956+00",
                isSelected: isSelected,
                isSelectionMode: controller.isSelectionMode.value,
                onTap: controller.isSelectionMode.value
                    ? () => controller.toggleSelection(data.id!)
                    : () {
                        Get.toNamed(
                          Routes.AO_SCORING_DETAIL,
                          parameters: {'id': data.id.toString()},
                        );
                      },
                onLongPress: () {
                  if (!controller.isSelectionMode.value) {
                    controller.toggleSelectionMode();
                    controller.toggleSelection(data.id!);
                  }
                },
                onCheckboxChanged: (value) {
                  controller.toggleSelection(data.id!);
                },
                controller: controller,
              );
            });
          },
          firstPageProgressIndicatorBuilder: (context) => Center(
            child: SizedBox(
              width: 48,
              child: LoadingIndicator(
                indicatorType: Indicator.ballBeat,
                strokeWidth: 4.0,
                colors: [Theme.of(context).primaryColor],
              ),
            ),
          ),
          newPageProgressIndicatorBuilder: (context) => Center(
            child: SizedBox(
              width: 48,
              child: LoadingIndicator(
                indicatorType: Indicator.ballBeat,
                strokeWidth: 4.0,
                colors: [Theme.of(context).primaryColor],
              ),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Tidak ada data ditemukan',
                style: TextStyleConstant.body,
              ),
            ),
          ),
          noMoreItemsIndicatorBuilder: (context) => const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Tidak ada data lagi',
                style: TextStyleConstant.caption,
              ),
            ),
          ),
          firstPageErrorIndicatorBuilder: (context) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
