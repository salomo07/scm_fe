import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../const/common_func.dart';
import '../../../../const/text_style.dart';
import '../../../../env.dart';
import '../../../../widgets/custom_button.dart';
import '../../home/controllers/home_c.dart';
import '../controllers/dashboard_c.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController rootController=Get.find<HomeController>();
    double heightCard = 300;
    
    return SizedBox(
      width: Get.width,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double totalWidth = constraints.maxWidth;                
                var companyFullname = "PT. Rodamas Palm";
                var joinDate = "02-08-2002";
                var employeesNumber = "2530";
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.start,
                  children: [
                    Container(      //Tour App 
                      width:isDesktop(Get.width)||isTablet(Get.width) ? (totalWidth / 10) * 5:null,
                      height: heightCard,
                      decoration: BoxDecoration(
                        borderRadius:const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.transparent)
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius:const BorderRadius.all(Radius.circular(20)),
                              child: Image.asset(
                                'images/background/1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration:BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Colors.white.withOpacity(0.8),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.25,0.9],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:70,vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [ 
                                    Text(
                                      "Hello, ${rootController.fullname.value}",
                                      style: playfairDisplayTextFont.copyWith(fontSize: 20,fontWeight: FontWeight.w700),
                                    ),
                                    const Gap(10),
                                    Text(
                                      "Speed, Efficiency, Convenience",
                                      style: playfairDisplayTextFont.copyWith(fontSize: 16,color: defaultColor, fontWeight: FontWeight.w700),
                                    ),
                                    const Gap(10),
                                    CustomButton(
                                      text: "Learn $appName", 
                                      height: 40,
                                      width: 200,
                                      onPressed: () {
                    
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(      //About Company
                      width:isDesktop(Get.width)||isTablet(Get.width)? ((totalWidth / 10) * 5)-20:null,
                      height: heightCard,   
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: heightCard-(heightCard*0.8)-2,
                                color: Colors.transparent, // Background color of the container
                              ),
                              Container(
                                width: double.infinity,
                                height: heightCard-(heightCard*0.2),                                
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius:const BorderRadius.all(Radius.circular(20)),
                                  border: Border.all(color: Colors.transparent)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [ 
                                      Text("About Company",style: playfairDisplayTextFont.copyWith(fontSize: 23,fontWeight: FontWeight.w700),),
                                      const Gap(10),
                                      Text(companyFullname,style: playfairDisplayTextFont.copyWith(fontSize: 18,fontWeight: FontWeight.w700,color: defaultColor),),
                                      const Gap(10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text("Join date",style: poppinsTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w500),)
                                          ),
                                          Expanded(
                                            child: Text(joinDate,style: poppinsTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: defaultColor),)
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("Employees",style: poppinsTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w500),)
                                          ),
                                          Expanded(
                                            child: Text("$employeesNumber employees",style: poppinsTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: defaultColor),)
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("Expired membership",style: poppinsTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w500),)
                                          ),
                                          Expanded(
                                            child: Text(employeesNumber,style: poppinsTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w500,color: defaultColor),)
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            child: Image.asset(                              
                              'images/logo/1.png',
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      )
    );
  }
}
