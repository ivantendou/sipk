import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manager_submission_controller.dart';

class ManagerSubmissionView extends GetView<ManagerSubmissionController> {
  const ManagerSubmissionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManagerSubmissionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManagerSubmissionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
