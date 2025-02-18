import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/profile/views/widgets/profile_data_card_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/user_avatar_widget.dart';

import '../controllers/admin_user_info_controller.dart';

class AdminUserInfoView extends GetView<AdminUserInfoController> {
  const AdminUserInfoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(
        title: 'Detail Pengguna',
      ),
      backgroundColor: ColorsConstant.grey100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              children: [
                const UserAvatarWidget(),
                const SizedBox(height: 16),
                const ProfileDataCardWidget(
                  name: 'Zafran',
                  role: 'Account Officer',
                  telephoneNumber: '08984763282',
                  email: 'Zafran@gmail.com',
                  dateOfJoining: '10 Juni 2020',
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  text: 'Edit',
                  width: 148,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
