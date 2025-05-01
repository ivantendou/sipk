import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/constants/text_style_constant.dart';
import 'package:sipk/app/modules/admin_manage_data/views/admin_manage_data_view.dart';
import 'package:sipk/app/modules/profile/views/profile_view.dart';

import '../controllers/bottom_nav_admin_controller.dart';

class BottomNavAdminView extends GetView<BottomNavAdminController> {
  const BottomNavAdminView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return IndexedStack(
            index: controller.selectedIndex.value,
            children: const [
              AdminManageDataView(),
              ProfileView(),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 64,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ColorsConstant.grey500,
              width: 1,
            ),
          ),
        ),
        child: Obx(
          () {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectedIndex.value,
              onTap: controller.onItemTapped,
              selectedLabelStyle: TextStyleConstant.footnote.copyWith(
                fontWeight: FontWeight.bold,
              ),
              selectedItemColor: ColorsConstant.primary,
              unselectedLabelStyle: TextStyleConstant.footnote.copyWith(
                color: ColorsConstant.grey700,
              ),
              unselectedItemColor: ColorsConstant.grey700,
              showUnselectedLabels: true,
              backgroundColor: ColorsConstant.white,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: controller.selectedIndex.value == 0
                        ? Assets.images.manageDataOn.svg(
                            width: 24,
                            colorFilter: const ColorFilter.mode(
                              ColorsConstant.primary,
                              BlendMode.srcIn,
                            ),
                          )
                        : Assets.images.manageDataOff.svg(width: 24),
                  ),
                  label: "Pengajuan",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: controller.selectedIndex.value == 1
                        ? Assets.images.profileOn.svg(
                            width: 24,
                            colorFilter: const ColorFilter.mode(
                              ColorsConstant.primary,
                              BlendMode.srcIn,
                            ),
                          )
                        : Assets.images.profileOff.svg(width: 24),
                  ),
                  label: "Profil",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
