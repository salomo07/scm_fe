import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../const/text_style.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textformfield.dart';
import '../../../routes/pages.dart';
import '../controllers/home_c.dart';

class FooterView extends GetView<HomeController> {
  const FooterView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Gap(48),
        const Divider(),
        const Gap(48),
        SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 50,
              children: [
                SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Funiro.",style: poppins24_700(),),
                      const Gap(50),
                      Flexible(child: Text("400 University Drive Suite 200 Coral Gables,\nFL 33134 USA",style: poppins16_400().copyWith(color: greyColor4),))
                    ],
                  ),
                ),
                Obx(() => 
                  Column(
                    children: [
                      Text("Links",style: poppins16_500().copyWith(color: greyColor4),),
                      const Gap(55),
                      Column(
                        children: controller.listMenu.map((e) {
                          return InkWell(
                            onTap: () {
                              Get.rootDelegate.toNamed(e.path!);
                            },
                            child: Column(
                              children: [
                                Text(e.label!,style: poppins16_500(),),
                                const Gap(20),
                              ],
                            ),
                          );
                        }).toList(),
                      ),              
                    ],
                  ),            
                ),
                Column(
                  children: [
                    Text("Help",style: poppins16_500().copyWith(color: greyColor4),),
                    const Gap(55),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.rootDelegate.toNamed(Paths.home);
                          },
                          child: Column(
                            children: [
                              Text("Payment Options",style: poppins16_500(),),
                              const Gap(20),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.rootDelegate.toNamed(Paths.home);
                          },
                          child: Column(
                            children: [
                              Text("Returns",style: poppins16_500(),),
                              const Gap(20),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.rootDelegate.toNamed(Paths.home);
                          },
                          child: Column(
                            children: [
                              Text("Privacy Policies",style: poppins16_500(),),
                              const Gap(20),
                            ],
                          ),
                        )
                      ],
                    ),              
                  ],
                ),
                SizedBox(
                  width: 330,
                  child: Column(
                    children: [
                      Text("Newsletter",style: poppins16_500().copyWith(color: greyColor4),),
                      const Gap(55),
                      Row(
                        children: [
                          CustomTextFormField(width: 150,label: "",hint:"Enter Your Email Address", textStyle: poppins14_400().copyWith(color: greyColor4), controller: TextEditingController()),
                          const Gap(20),                        
                          CustomButton(text: "SUBSCRIBE",width: 155,colorBorder: Colors.black, onPressed: () {
                            
                          },)
                        ],
                      )             
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
  }
