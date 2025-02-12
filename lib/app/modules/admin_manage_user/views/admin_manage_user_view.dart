import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/assets.gen.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/user_card_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/modules/admin_manage_user/views/widgets/search_panel_widget.dart';

import '../controllers/admin_manage_user_controller.dart';

class AdminManageUserView extends GetView<AdminManageUserController> {
  const AdminManageUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBarWidget(title: 'Kelola Pengguna'),
        backgroundColor: ColorsConstant.grey100,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 124, left: 16, right: 16),
                child: Column(
                  children: [
                    UserCardWidget(
                      name: 'Kyle Walkie',
                      role: 'Account Officer',
                    ),
                  ],
                ),
              ),
            ),
            SearchUserPanelWidget(
              hintText: 'Cari Pengguna',
              onTap: () {},
              option: 'Account Officer',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorsConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Assets.images.plus.svg(),
        ),
      ),
    );
  }
}
