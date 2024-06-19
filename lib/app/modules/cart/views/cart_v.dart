import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/material.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../../../const/common_func.dart';
import '../../../../widgets/custom_button.dart';
import '../../home/views/footer.dart';
import '../../home/views/guarantybar.dart';
import '../controllers/cart_c.dart';


class CartView extends GetView<CartController> {
  const CartView({super.key});

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
                                  "Cart",
                                  style: poppins48_500(),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Home", style: poppins16_500()),
                                    const Icon(Icons.arrow_forward),
                                    Text("Cart", style: poppins16_300()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:isDesktop(Get.width)?100: 10),
                      child: Wrap(
                        spacing: 30,
                        runSpacing: 30,                  
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: 781,
                              child: DataTable(
                                headingRowColor: WidgetStateColor.resolveWith((states) => filterBarColor),
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
                                                borderRadius: const BorderRadius.all(Radius.circular(10))
                                              ),
                                              child: Image.asset("/furniro/images/background/room5.png",width: 100,height: 100,fit: BoxFit.contain,)),
                                            const Gap(20),
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
                            child: Center(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(56),
                  const GuarantyBar(),
                  SizedBox(width: Get.width,child: const FooterView())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
