import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/ao_home_appbar_widget.dart';
import 'package:sipk/app/routes/app_pages.dart';
import 'package:sipk/app/widgets/folder_card_widget.dart';

import '../controllers/admin_manage_data_controller.dart';

class AdminManageDataView extends GetView<AdminManageDataController> {
  const AdminManageDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Obx(
            () => AoHomeAppbarWidget(
              imageUrl: "",
              name: controller.username.value,
            ),
          ),
        ),
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
              bottom: 80,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FolderCardWidget(
                      folderName: 'User Data',
                      onTap: () => Get.toNamed(Routes.ADMIN_MANAGE_USER),
                    ),
                    const SizedBox(width: 16),
                    FolderCardWidget(
                      folderName: 'Scoring Data',
                      onTap: () => Get.toNamed(Routes.SCORING_DATA),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FolderCardWidget(
                      folderName: 'Application Data',
                      onTap: () => Get.toNamed(Routes.SUBMISSION_DATA),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 156,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
