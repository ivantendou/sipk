import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/manager_scoring_detail_controller.dart';

class ManagerScoringDetailView extends GetView<ManagerScoringDetailController> {
  const ManagerScoringDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManagerScoringDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ManagerScoringDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
