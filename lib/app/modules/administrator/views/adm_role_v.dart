import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scm_fe/app/modules/administrator/controllers/adm_role_c.dart';


class AdmRoleView extends GetView<AdministratorController> {
  const AdmRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'AdmRoleView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
