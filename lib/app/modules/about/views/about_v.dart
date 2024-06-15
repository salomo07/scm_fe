import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dashboard/controllers/dashboard_c.dart';

class AboutView extends GetView<DashboardController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Text("About");
  }
}