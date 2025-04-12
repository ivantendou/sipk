import 'package:get/get.dart';

import '../modules/admin_manage_data/bindings/admin_manage_data_binding.dart';
import '../modules/admin_manage_data/views/admin_manage_data_view.dart';
import '../modules/admin_manage_user/bindings/admin_manage_user_binding.dart';
import '../modules/admin_manage_user/views/admin_manage_user_view.dart';
import '../modules/admin_user_add/bindings/admin_user_add_binding.dart';
import '../modules/admin_user_add/views/admin_user_add_view.dart';
import '../modules/admin_user_detail/bindings/admin_user_detail_binding.dart';
import '../modules/admin_user_detail/views/admin_user_detail_view.dart';
import '../modules/admin_user_edit/bindings/admin_user_edit_binding.dart';
import '../modules/admin_user_edit/views/admin_user_edit_view.dart';
import '../modules/ao_home/bindings/ao_home_binding.dart';
import '../modules/ao_home/views/ao_home_view.dart';
import '../modules/ao_manage_data/bindings/ao_manage_data_binding.dart';
import '../modules/ao_manage_data/views/ao_manage_data_view.dart';
import '../modules/ao_scoring_detail/bindings/ao_scoring_detail_binding.dart';
import '../modules/ao_scoring_detail/views/ao_scoring_detail_view.dart';
import '../modules/ao_select_scoring/bindings/ao_select_scoring_binding.dart';
import '../modules/ao_select_scoring/views/ao_select_scoring_view.dart';
import '../modules/ao_submission/bindings/ao_submission_binding.dart';
import '../modules/ao_submission/views/ao_submission_view.dart';
import '../modules/submission_detail/bindings/submission_detail_binding.dart';
import '../modules/submission_detail/views/submission_detail_view.dart';
import '../modules/bottom_nav_admin/bindings/bottom_nav_admin_binding.dart';
import '../modules/bottom_nav_admin/views/bottom_nav_admin_view.dart';
import '../modules/bottom_nav_ao/bindings/bottom_nav_ao_binding.dart';
import '../modules/bottom_nav_ao/views/bottom_nav_ao_view.dart';
import '../modules/bottom_nav_manager/bindings/bottom_nav_manager_binding.dart';
import '../modules/bottom_nav_manager/views/bottom_nav_manager_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manager_scoring_detail/bindings/manager_scoring_detail_binding.dart';
import '../modules/manager_scoring_detail/views/manager_scoring_detail_view.dart';
import '../modules/manager_submission/bindings/manager_submission_binding.dart';
import '../modules/manager_submission/views/manager_submission_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/scoring_data/bindings/scoring_data_binding.dart';
import '../modules/scoring_data/views/scoring_data_view.dart';
import '../modules/scoring_form/bindings/scoring_form_binding.dart';
import '../modules/scoring_form/views/scoring_form_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/submission_data/bindings/submission_data_binding.dart';
import '../modules/submission_data/views/submission_data_view.dart';
import '../modules/submission_form/bindings/submission_form_binding.dart';
import '../modules/submission_form/views/submission_form_view.dart';

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
      page: () => const BottomNavAoView(),
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
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SUBMISSION_DETAIL,
      page: () => const SubmissionDetailView(),
      binding: SubmissionDetailBinding(),
      children: [
        GetPage(
          name: _Paths.SUBMISSION_DETAIL,
          page: () => const SubmissionDetailView(),
          binding: SubmissionDetailBinding(),
        ),
      ],
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
    GetPage(
      name: _Paths.ADMIN_MANAGE_DATA,
      page: () => const AdminManageDataView(),
      binding: AdminManageDataBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MANAGE_USER,
      page: () => const AdminManageUserView(),
      binding: AdminManageUserBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_ADMIN,
      page: () => const BottomNavAdminView(),
      binding: BottomNavAdminBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_MANAGER,
      page: () => const BottomNavManagerView(),
      binding: BottomNavManagerBinding(),
    ),
    GetPage(
      name: _Paths.MANAGER_SUBMISSION,
      page: () => const ManagerSubmissionView(),
      binding: ManagerSubmissionBinding(),
    ),
    GetPage(
      name: _Paths.SCORING_DATA,
      page: () => const ScoringDataView(),
      binding: ScoringDataBinding(),
    ),
    GetPage(
      name: _Paths.SUBMISSION_DATA,
      page: () => const SubmissionDataView(),
      binding: SubmissionDataBinding(),
    ),
    GetPage(
      name: _Paths.SCORING_FORM,
      page: () => const ScoringFormView(),
      binding: ScoringFormBinding(),
    ),
    GetPage(
      name: _Paths.SUBMISSION_FORM,
      page: () => const SubmissionFormView(),
      binding: SubmissionFormBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_USER_EDIT,
      page: () => const AdminUserEditView(),
      binding: AdminUserEditBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_USER_ADD,
      page: () => const AdminUserAddView(),
      binding: AdminUserAddBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_USER_DETAIL,
      page: () => const AdminUserDetailView(),
      binding: AdminUserDetailBinding(),
    ),
    GetPage(
      name: _Paths.AO_SELECT_SCORING,
      page: () => const AoSelectScoringView(),
      binding: AoSelectScoringBinding(),
    ),
  ];
}
