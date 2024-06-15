
import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniro_fe/app/modules/cart/controllers/cart_c.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../const/common_func.dart';
import '../../../../const/text_style.dart';
import '../../../../widgets/custom_button.dart';
import '../../shop/controllers/shop_c.dart';

class CartView extends GetView<CartController> {
  CartView({super.key});
  ShopController shopController =Get.find();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: whiteColor,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal:isDesktop(Get.width)?100: 10),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 30,                  
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: 781,
                          child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith((states) => filterBarColor),
                            columns: [
                              DataColumn(label: SizedBox(width: 250, child: Text("Product",style: poppins16_500(),)),),
                              DataColumn(label:SizedBox(width: 100, child: Text("Price",style: poppins16_500())),),
                              DataColumn(label:SizedBox(width: 100, child: Text("Quantity",style: poppins16_500()))),
                              DataColumn(label:SizedBox(width: 100, child: Text("Subtotal",style: poppins16_500())),)
                            ],
                            rows: [
                              DataRow(                            
                                cells: [
                                  DataCell(
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 500,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: filterBarColor,
                                            borderRadius: BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: Image.asset("/furniro/images/background/room5.png",width: 100,height: 100,fit: BoxFit.contain,)),
                                        Gap(20),
                                        Text("Asgaard sofa",style: poppins16_400().copyWith(color: greyColor4))
                                      ],),),
                                  DataCell(Center(child: Text("Rp. 250,000.00",style: poppins16_400().copyWith(color: greyColor4)))),
                                  DataCell(CountStepper(
                                    iconColor: Colors.black,
                                    defaultValue: 1,
                                    max: 10,
                                    min: 1,
                                    iconDecrementColor: Colors.black,
                                    splashRadius: 25,
                                    onPressed: (value) {
                                      // controller.selectedQty.value=value;
                                      },
                                    ),),
                                  DataCell(Center(child: Text("Rp. 250,000.00",style: poppins16_400())))
                                ]
                              )
                            ],
                          ),
                        )
                          
                      ),
                      Container(
                        width:340,
                        height:340,
                        color: filterBarColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:  15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [            
                              Text("Cart Totals",style: poppins36_500()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Subtotal",style: poppins16_500()),
                                  Text("Rp. 250.000",style: poppins16_400().copyWith(color: greyColor4)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",style: poppins16_500()),
                                  Text("Rp. 250.000",style: poppins20_500().copyWith(color: defaultColor)),
                                ],
                              ),
                              CustomButton(
                                width: 222,
                                height: 59,
                                borderRadius: 50,
                                colorButton: whiteColor,
                                colorBorder: blackColor2,
                                textStyle: poppins20_400().copyWith(color: blackColor2),
                                text: "Check Out", 
                                onPressed: () {
                                  
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(56),
              guarantyBar()                
            ],
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
