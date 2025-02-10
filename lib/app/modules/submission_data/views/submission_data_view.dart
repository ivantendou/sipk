import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/submission_data_controller.dart';

class SubmissionDataView extends GetView<SubmissionDataController> {
  const SubmissionDataView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubmissionDataView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SubmissionDataView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
