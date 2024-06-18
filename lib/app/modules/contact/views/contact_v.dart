
import 'package:flutter/material.dart';
import 'package:furniro_fe/app/modules/home/views/footer.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:furniro_fe/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../../../widgets/custom_button.dart';
import '../../home/views/home2_v.dart';
import '../controllers/contact_c.dart';


class ContactView extends GetView<ContactController> {
  ContactView({super.key});
  Home2View homeView=const Home2View();
  @override
  Widget build(BuildContext context) {    
    return LayoutBuilder(
      builder: (context, constraints) {        
        return Scaffold(
          body: Container(
            width: Get.width,
            color: whiteColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: 318,
                        child: Image.asset(
                          "/furniro/images/background/background2.png",
                          width: Get.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: Get.width, 
                            height: 318,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("/furniro/images/logo/logo.png",
                                  height: 32,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Contact",
                                  style: poppins48_500(),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Home", style: poppins16_500()),
                                    const Icon(Icons.arrow_forward),
                                    Text("Contact", style: poppins16_300()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                      const Gap(50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: 644,
                          child: Column(
                            children: [
                              Text("Get In Touch With Us",style: poppins36_600(),),
                              const Gap(7),
                              Text("For More Information About Our Product & Services. Please Feel Free To Drop Us An Email. Our Staff Always Be There To Help You Out. Do Not Hesitate!",style: poppins16_400().copyWith(color: greyColor4),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        // width: 1058,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Wrap(
                            children: [
                              SizedBox(
                                width: 393,
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Gap(100),
                                      Row(
                                        children: [
                                          const Icon(Icons.map),
                                          const Gap(20),
                                          SizedBox(
                                            width: 212,
                                            child: Column(
                                              children: [
                                                Text("Address",style: poppins24_500(),),
                                                Text("236 5th SE Avenue, New York NY10000, United States",style: poppins16_400(),),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Gap(42),
                                      Row(
                                        children: [
                                          const Icon(Icons.phone),
                                          const Gap(20),
                                          SizedBox(
                                            width: 212,
                                            child: Column(
                                              children: [
                                                Text("Phone",style: poppins24_500(),),
                                                Text("Mobile: +(84) 546-6789\nHotline: +(84) 456-6789",style: poppins16_400(),),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Gap(42),
                                      Row(
                                        children: [
                                          const Icon(Icons.timer_outlined),
                                          const Gap(20),
                                          SizedBox(
                                            width: 212,
                                            child: Column(
                                              children: [
                                                Text("Working Time",style: poppins24_500(),),
                                                Text("Monday-Friday: 9:00 - 22:00\nSaturday-Sunday: 9:00 - 21:00",style: poppins16_400(),),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 635,
                                child: Column(
                                  children: [
                                    const Gap(100),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Your name",style: poppins16_500(),),
                                        const Gap(22),
                                        CustomTextFormField(label: "",hint: "ABC",width: 329, textStyle: poppins16_400(), controller: TextEditingController())
                                      ],
                                    ),
                                    const Gap(36),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Email address",style: poppins16_500(),),
                                        const Gap(22),
                                        CustomTextFormField(label: "",hint: "Abc@def.com",width: 329, textStyle: poppins16_400(), controller: TextEditingController())
                                      ],
                                    ),
                                    const Gap(36),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Subject",style: poppins16_500(),),
                                        const Gap(22),
                                        CustomTextFormField(label: "",hint: "This is an optional",width: 329, textStyle: poppins16_400(), controller: TextEditingController())
                                      ],
                                    ),
                                    const Gap(36),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Message",style: poppins16_500(),),
                                        const Gap(22),
                                        CustomTextFormField(label: "",hint: "Hi! i’d like to ask about",width: 329, textStyle: poppins16_400(), controller: TextEditingController(),
                                        textInputType: TextInputType.multiline,
                                        height: 75,
                                        maxLines: 3,
                                        )
                                      ],
                                    ),
                                    const Gap(36),
                                    CustomButton(text: "Submit",width: 237,textStyle: poppins14_400().copyWith(color: whiteColor), onPressed: () {
                                      
                                    },colorButton: defaultColor,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                      ],
                    ),
                  ),
                  const Gap(56),
                  guarantyBar(),
                  const FooterView()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  guarantyBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: filterBarColor,
        height: 270,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 337,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.emoji_events, size: 52),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text content to start
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text("High Quality", style: poppins25_600()),
                        const Gap(2),
                        Flexible(
                          child: Text(
                            "crafted from top materials",
                            style: poppins20_500().copyWith(color: greyColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 337,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.shield, size: 52),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text content to start
                      mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
                      children: [
                        Text("Warranty Protection", style: poppins25_600()),
                        const Gap(2),
                        Text(
                          "Over 2 years",
                          style: poppins20_500().copyWith(color: greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 337,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.delivery_dining_outlined, size: 52),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text("Free Shipping", style: poppins25_600()),
                        const Gap(2),
                        Text(
                          "Order over 150 \$",
                          style: poppins20_500().copyWith(color: greyColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),              
              SizedBox(
                width: 337,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.support_agent, size: 52),
                    const Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text content to start
                      mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
                      children: [
                        Text("24 / 7 Support", style: poppins25_600()),
                        const Gap(2),
                        Flexible(
                          child: Text(
                            "Dedicated support",
                            style: poppins20_500().copyWith(color: greyColor),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
