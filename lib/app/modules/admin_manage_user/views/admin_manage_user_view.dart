import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_manage_user_controller.dart';

class AdminManageUserView extends GetView<AdminManageUserController> {
  const AdminManageUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminManageUserView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AdminManageUserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
