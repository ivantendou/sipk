import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/services/scoring_service.dart';

class AoHomeController extends GetxController {
  final ScoringService scoringService = ScoringService();
  late String? applicantId;

  Future<void> createForm() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    applicantId = await scoringService.createForm(userId: userId!);
    Get.toNamed(
      Routes.SCORING_FORM,
      arguments: {'applicantId': applicantId},
    );
  }
}
