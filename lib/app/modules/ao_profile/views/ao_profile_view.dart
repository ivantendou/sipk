import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_profile/views/widgets/profile_data_card_widget.dart';
import 'package:sipk/app/widgets/custom_button_widget.dart';
import 'package:sipk/app/widgets/user_avatar_widget.dart';

import '../controllers/ao_profile_controller.dart';

class AoProfileView extends GetView<AoProfileController> {
  const AoProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
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
