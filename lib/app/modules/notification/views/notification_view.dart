import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sipk/app/constants/colors_constant.dart';
import 'package:sipk/app/modules/notification/views/widgets/notification_card_widget.dart';
import 'package:sipk/app/widgets/custom_app_bar_widget.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Notifikasi'),
      backgroundColor: ColorsConstant.grey100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotificationCardWidget(
              message:
                  "Pengajuan pembiayaan atas nama Muhamad Ivan Fadillah telah dikirim.",
              time: "10 menit yang lalu",
            ),
          ],
        ),
      ),
    );
  }
}
