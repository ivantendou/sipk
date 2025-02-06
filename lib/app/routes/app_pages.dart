import 'package:get/get.dart';

import '../modules/ao_bottom_nav/bindings/ao_bottom_nav_binding.dart';
import '../modules/ao_bottom_nav/views/ao_bottom_nav_view.dart';
import '../modules/ao_home/bindings/ao_home_binding.dart';
import '../modules/ao_home/views/ao_home_view.dart';
import '../modules/ao_manage_data/bindings/ao_manage_data_binding.dart';
import '../modules/ao_manage_data/views/ao_manage_data_view.dart';
import '../modules/ao_profile/bindings/ao_profile_binding.dart';
import '../modules/ao_profile/views/ao_profile_view.dart';
import '../modules/ao_scoring_detail/bindings/ao_scoring_detail_binding.dart';
import '../modules/ao_scoring_detail/views/ao_scoring_detail_view.dart';
import '../modules/ao_submission/bindings/ao_submission_binding.dart';
import '../modules/ao_submission/views/ao_submission_view.dart';
import '../modules/ao_submission_detail/bindings/ao_submission_detail_binding.dart';
import '../modules/ao_submission_detail/views/ao_submission_detail_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manager_scoring_detail/bindings/manager_scoring_detail_binding.dart';
import '../modules/manager_scoring_detail/views/manager_scoring_detail_view.dart';
import '../modules/manager_submission_detail/bindings/manager_submission_detail_binding.dart';
import '../modules/manager_submission_detail/views/manager_submission_detail_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.AO_HOME,
      page: () => const AoHomeView(),
      binding: AoHomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_AO,
      page: () => const AoBottomNavView(),
      binding: BottomNavAoBinding(),
    ),
    GetPage(
      name: _Paths.AO_SUBMISSION,
      page: () => const AoSubmissionView(),
      binding: AoSubmissionBinding(),
    ),
    GetPage(
      name: _Paths.AO_MANAGE_DATA,
      page: () => const AoManageDataView(),
      binding: AoManageDataBinding(),
    ),
    GetPage(
      name: _Paths.AO_PROFILE,
      page: () => const AoProfileView(),
      binding: AoProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.AO_SUBMISSION_DETAIL,
      page: () => const AoSubmissionDetailView(),
      binding: AoSubmissionDetailBinding(),
      children: [
        GetPage(
          name: _Paths.AO_SUBMISSION_DETAIL,
          page: () => const AoSubmissionDetailView(),
          binding: AoSubmissionDetailBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MANAGER_SUBMISSION_DETAIL,
      page: () => const ManagerSubmissionDetailView(),
      binding: ManagerSubmissionDetailBinding(),
    ),
    GetPage(
      name: _Paths.AO_SCORING_DETAIL,
      page: () => const AoScoringDetailView(),
      binding: AoScoringDetailBinding(),
    ),
    GetPage(
      name: _Paths.MANAGER_SCORING_DETAIL,
      page: () => const ManagerScoringDetailView(),
      binding: ManagerScoringDetailBinding(),
    ),
  ];
}
