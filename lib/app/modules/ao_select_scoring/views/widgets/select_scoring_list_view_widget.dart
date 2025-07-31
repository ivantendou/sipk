import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/ao_select_scoring/controllers/ao_select_scoring_controller.dart';
import 'package:sipk/app/modules/ao_select_scoring/views/widgets/select_data_card_widget.dart';
import 'package:sipk/models/credit_scores_model.dart';

class SelectScoringListViewWidget extends StatelessWidget {
  final AoSelectScoringController controller;

  const SelectScoringListViewWidget({
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
            return SelectDataCardWidget(
              applicantName: data.name,
              scoringNumber: data.id,
              ktpNumber: data.ktpNumber,
              score: data.creditEvaluations?.first.creditScores?.totalScore
                      .toString() ??
                  "",
              scoringStatus:
                  data.creditEvaluations?.first.creditScores?.isDraft,
              scoringDate: data.creditEvaluations?.first.creditScores?.updatedAt
                      .toString() ??
                  "2025-04-03 11:57:06.956956+00",
              controller: controller,
            );
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
                'No data found',
                style: TextStyleConstant.body,
              ),
            ),
          ),
          noMoreItemsIndicatorBuilder: (context) => const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'No more data',
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
                  'An error occurred',
                  style: TextStyleConstant.subHeading2,
                ),
                const SizedBox(height: 4),
                Text(
                  'Make sure your device is connected to the internet and try again.',
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
