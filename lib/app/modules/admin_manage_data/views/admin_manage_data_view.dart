import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/ao_home/views/widgets/ao_home_appbar_widget.dart';
import 'package:sipk/app/widgets/folder_card_widget.dart';

import '../controllers/admin_manage_data_controller.dart';

class AdminManageDataView extends GetView<AdminManageDataController> {
  const AdminManageDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AoHomeAppbarWidget(),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FolderCardWidget(
                      folderName: 'Data Pengguna',
                    ),
                    SizedBox(width: 16),
                    FolderCardWidget(
                      folderName: 'Data Skoring Pembiayaan',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const FolderCardWidget(
                      folderName: 'Data Pengajuan Pembiayaan',
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
