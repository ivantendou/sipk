import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/profile/controllers/ao_profile_controller.dart';
import 'package:sipk/app/modules/profile/views/widgets/profile_data_card_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/user_avatar_widget.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16,),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UserAvatarWidget(),
                const SizedBox(height: 16),
                const ProfileDataCardWidget(
                  name: 'Zafran',
                  role: 'Account Officer',
                  telephoneNumber: '08984763282',
                  email: 'Zafran@gmail.com',
                ),
                const SizedBox(height: 16),
                CustomButtonWidget(
                  text: 'Logout',
                  width: 120,
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
