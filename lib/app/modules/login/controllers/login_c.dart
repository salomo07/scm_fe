import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import '../../../middleware/auth_controller.dart';
import '../../../routes/pages.dart';

class LoginController extends GetxController {
  AuthController authController=AuthController();
  Rx<TextEditingController> txtUsername =TextEditingController().obs;
  Rx<TextEditingController> txtPassword =TextEditingController().obs;

  //RegistrationForm
  Rx<TextEditingController> txtFullname =TextEditingController().obs;
  Rx<TextEditingController> txtBirthDate =TextEditingController().obs;
  Rx<TextEditingController> txtEmail =TextEditingController().obs;
  Rx<TextEditingController> txtPasswordRegis =TextEditingController().obs;
  Rx<String> errUsername ="".obs;
  Rx<String> errPassword ="".obs;
  RxBool isVisible =false.obs;
  RxBool isRememberMe =false.obs;
  Rx<double> screenWidth=(Get.width).obs;
  Rx<double> halfScreenWidth=(Get.width/2).obs;
  Rx<String> selectedForm="${Paths.dashboard}".obs;
  final List<String> imgList = [
    'images/background/landing1.jpg',
    'images/background/landing2.jpg',
    'images/background/landing3.jpg',
  ];

  @override
  void onReady() {
    screenWidth.value=Get.width;  
    super.onReady();
  }

  void toRegister(){
    
  }
  Future<DateTime?> callDatePicker(Function(DateTime) onChange) async {
    DateTime startDate = DateTime.now().subtract(const Duration(days: 50 * 365));
    DateTime twelveYearsAgo =DateTime.now().subtract(const Duration(days: 12 * 365));
    var datePicked = await DatePicker.showSimpleDatePicker(
      Get.context!,
      initialDate: DateTime(1992),
      firstDate: startDate,
      lastDate: twelveYearsAgo,
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.id,
      looping: true,
    );
    onChange(datePicked!);
    return datePicked;
  }
  Future<void> login() async {   
    authController.login("qweqsadasdadsfasdfsdf"); 
    // Get.rootDelegate.offNamed(Paths.home);
    // Future.delayed(const Duration(seconds: 1),() async {
    //   final thenTo = Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
    //   await Get.rootDelegate.offNamed(Paths.home);
    // },);
    await Get.rootDelegate.offNamed(Paths.login);
    // Get.rootDelegate.offNamed(thenTo ?? Paths.home);
  }
}
