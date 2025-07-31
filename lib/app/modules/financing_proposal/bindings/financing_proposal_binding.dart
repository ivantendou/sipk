import 'package:get/get.dart';

import '../controllers/financing_proposal_controller.dart';

class FinancingProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancingProposalController>(
      () => FinancingProposalController(),
    );
  }
}
