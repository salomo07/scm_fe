import 'package:flutter/material.dart';
import 'package:furniro_fe/app/modules/home/views/footer.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:furniro_fe/widgets/custom_button.dart';
import 'package:furniro_fe/widgets/custom_dropdown.dart';
import 'package:furniro_fe/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../../../const/common_func.dart';
import '../../home/views/guarantybar.dart';
import '../../shop/controllers/shop_c.dart';


class CheckoutView extends GetView<ShopController> {
  const CheckoutView({super.key});

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
                                  "Checkout",
                                  style: poppins48_500(),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Home", style: poppins16_500()),
                                    const Icon(Icons.arrow_forward),
                                    Text("Checkout", style: poppins16_300()),
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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:isDesktop(Get.width)?100: 10),
                      child: Wrap(
                        spacing: 26,
                        runSpacing: 26,                  
                        children: [
                          SizedBox(
                            width: 508,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Gap(95),
                                Text("Billing details",style: poppins36_600()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text("First Name",style: poppins16_500(),),
                                        const Gap(22),
                                        CustomTextFormField(
                                          width: 211,
                                          height: 75,
                                          controller: TextEditingController(),
                                          label: "",
                                          textStyle: poppinsTextFont,
                                        )
                                      ],                                      
                                    ),
                                    const Gap(31),
                                    Column(
                                      children: [
                                        Text("Last Name",style: poppins16_500(),),
                                        const Gap(22),
                                        CustomTextFormField(
                                          width: 211,
                                          height: 75,
                                          controller: TextEditingController(),
                                          label: "",
                                          textStyle: poppinsTextFont,
                                        )
                                      ],                                      
                                    ),
                                  ],
                                ),
                                const Gap(36),
                                Text("Company Name (Optional)",style: poppins16_500(),),
                                const Gap(22),
                                CustomTextFormField(
                                  width: 453,
                                  height: 75,
                                  controller: TextEditingController(),
                                  label: "",
                                  textStyle: poppinsTextFont,
                                ),
                                const Gap(36),
                                Text("Country / Region",style: poppins16_500(),),
                                const Gap(22),
                                SizedBox(
                                  width: 453,
                                  child: CustomDropDown(
                                    stringItems: const ["Sri Lanka","Indonesia","Malay"],
                                    onChanged: (val) {
                                      
                                    },
                                  ),
                                ),
                                const Gap(36),
                                Text("Street address",style: poppins16_500(),),
                                const Gap(22),
                                CustomTextFormField(
                                  width: 453,
                                  height: 75,
                                  controller: TextEditingController(),
                                  label: "",
                                  textStyle: poppinsTextFont,
                                ),
                                const Gap(36),
                                Text("Town / City",style: poppins16_500(),),
                                const Gap(22),
                                CustomTextFormField(
                                  width: 453,
                                  height: 75,
                                  controller: TextEditingController(),
                                  label: "",
                                  textStyle: poppinsTextFont,
                                ),
                                const Gap(36),
                                Text("Province",style: poppins16_500(),),
                                const Gap(22),
                                SizedBox(
                                  width: 453,
                                  child: CustomDropDown(
                                    defaultValue: "Pilih provinsi",
                                    stringItems:const  ["Jambi"],
                                    onChanged: (val) {
                                      
                                    },
                                  ),
                                ),
                                const Gap(36),
                                Text("ZIP code",style: poppins16_500(),),
                                const Gap(22),
                                CustomTextFormField(
                                  width: 453,
                                  height: 75,
                                  controller: TextEditingController(),
                                  label: "",
                                  textStyle: poppinsTextFont,
                                ),
                                const Gap(36),
                                Text("Phone",style: poppins16_500(),),
                                const Gap(22),
                                CustomTextFormField(
                                  width: 453,
                                  height: 75,
                                  controller: TextEditingController(),
                                  label: "",
                                  textStyle: poppinsTextFont,
                                ),
                                const Gap(36),
                                Text("Email address",style: poppins16_500(),),
                                const Gap(22),
                                CustomTextFormField(
                                  width: 453,
                                  height: 75,
                                  controller: TextEditingController(),
                                  label: "",
                                  textStyle: poppinsTextFont,
                                ),
                                const Gap(22),
                                CustomTextFormField(
                                  maxLines:3,
                                  textInputType: TextInputType.multiline,
                                  width: 453,
                                  height: 75,
                                  controller: TextEditingController(),
                                  label: "Additional information",
                                  textStyle: poppinsTextFont,
                                ),
                              ],                              
                            ),
                          ),
                          SizedBox(
                            width: 608,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 38),
                              child: Column(
                                children: [
                                  const Gap(87),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Product",style: poppins24_500()),
                                      Text("Subtotal",style: poppins24_500(),),
                                    ],
                                  ),
                                  const Gap(14),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Asgaard sofa",style: poppins16_400().copyWith(color: greyColor4)),
                                          const Gap(20),
                                          const Text("X"),
                                          const Gap(20),
                                          const Text("1"),
                                        ],
                                      ),
                                      Text("Rp. 250,000.00",style: poppins16_300(),),
                                    ],
                                  ),
                                  const Gap(22),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Subtotal",style: poppins16_400()),
                                      Text("Rp. 250,000.00",style: poppins16_300(),),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total",style: poppins16_400()),
                                      Text("Rp. 250,000.00",style: poppins24_700().copyWith(color: defaultColor),),
                                    ],
                                  ),
                                  const Gap(33.5),
                                  const Divider(),
                                  const Gap(22.5),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                              color: blackColor2,
                                              borderRadius: const BorderRadius.all(Radius.circular(50))
                                            ),
                                          ),
                                          const Gap(15),
                                          Text("Direct Bank Transfer",style: poppins16_400(),), 
                                        ],
                                      ),
                                      const Gap(11),
                                      Text("Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.",style: poppins16_300().copyWith(color: greyColor4),),
                                      const Gap(25),
                                      Row(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                              color: greyColor4,
                                              borderRadius: const BorderRadius.all(Radius.circular(50))
                                            ),
                                          ),
                                          const Gap(15),
                                          Text("Direct Bank Transfer",style: poppins16_500(),)
                                        ],
                                      ),
                                      const Gap(25),
                                      Row(
                                        children: [
                                          Container(
                                            height: 14,
                                            width: 14,
                                            decoration: BoxDecoration(
                                              color: greyColor,
                                              border: Border.all(color: greyColor4),
                                              borderRadius: const BorderRadius.all(Radius.circular(50))
                                            ),
                                          ),
                                          const Gap(15),
                                          Text("Cash On Delivery",style: poppins16_500(),)
                                        ],
                                      ),
                                      const Gap(22),
                                      Text("Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our privacy policy.",style: poppins16_600(),),
                                      const Gap(39),
                                      CustomButton(
                                        colorButton: whiteColor,
                                        colorBorder: blackColor2,
                                        textStyle: poppins20_400().copyWith(color: blackColor2),
                                        width: 318,
                                        height: 64,
                                        text: "Place order", onPressed: () {
                                          
                                        },
                                      )
                                    ],
                                  )

                                ],
                              ),
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(56),
                  const GuarantyBar(),
                  const FooterView()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
