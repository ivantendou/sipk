import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:printing/printing.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import '../controllers/financing_proposal_controller.dart';

class FinancingProposalView extends GetView<FinancingProposalController> {
  const FinancingProposalView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'Proposal Pembiayaan'),
      body: PdfPreview(
        build: (format) => controller.generatePdf(),
        canChangePageFormat: false,
        canChangeOrientation: false,
        allowSharing: true,
        allowPrinting: true,
        enableScrollToPage: true,
        loadingWidget: Center(
          child: SizedBox(
            width: 48,
            child: LoadingIndicator(
              indicatorType: Indicator.ballBeat,
              strokeWidth: 4.0,
              colors: [Theme.of(context).primaryColor],
            ),
          ),
        ),
        pdfFileName: "contoh_dokumen.pdf",
      ),
    );
  }
}
