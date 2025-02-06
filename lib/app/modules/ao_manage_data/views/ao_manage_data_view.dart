import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/widgets/folder_card_widget.dart';

import '../controllers/ao_manage_data_controller.dart';

class AoManageDataView extends GetView<AoManageDataController> {
  const AoManageDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.grey100,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 16,
              left: 16,
              top: 16,
              bottom: 80,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FolderCardWidget(
                  folderName: 'Data Skoring Pembiayaan',
                ),
                SizedBox(width: 16),
                FolderCardWidget(
                  folderName: 'Data Pengajuan Pembiayaan',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
