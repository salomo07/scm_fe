import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_c.dart';

class DefaultView extends GetView<DashboardController> {
  const DefaultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Page is working... But still on progress',
                style: TextStyle(fontSize: 20),
              ),
              Text('Time: ${controller.now.value.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
