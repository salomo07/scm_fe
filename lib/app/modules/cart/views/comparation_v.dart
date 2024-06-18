
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:furniro_fe/widgets/custom_dropdown.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import '../../../../const/common_func.dart';
import '../../shop/controllers/shop_c.dart';


class ComparationView extends GetView<ShopController> {
  const ComparationView({super.key});

  @override
  Widget build(BuildContext context) {    
    return LayoutBuilder(
      builder: (context, constraints) {        
        return Scaffold(
      body: Container(
        width: Get.width,
        color: Colors.white,
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
                            Image.asset(
                              "/furniro/images/logo/logo.png",
                              height: 32,
                              width: 50,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "Product Comparison",
                              style: Get.width > 800 ? poppins48_500() : poppins16_500(),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Home", style: poppins16_500()),
                                const Icon(Icons.arrow_forward),
                                Text("Comparison", style: poppins16_300()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(34),
              Row(
                children: [
                  SizedBox(
                    width: 344,
                    child: Column(
                      children: [
                        Text(
                          "Go to Product page for more Products",
                          style: poppins20_500(),
                        ),
                        const Gap(34),
                        Text(
                          "View More",
                          style: poppins20_500().copyWith(
                            color: Colors.grey[500],
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [                          
                          SizedBox(
                            width: 344,
                            child:Column(
                              children: [
                                buildProductCard(
                                  "Asgaard Sofa",
                                  "Rp. 250,000.00",
                                  4.7,
                                  "204 Review",
                                  "/furniro/images/background/room5.png",
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 344,
                            child:buildProductCard(
                              "Asgaard Sofa",
                              "Rp. 250,000.00",
                              4.7,
                              "204 Review",
                              "/furniro/images/background/room5.png",
                            ),
                          ),
                          SizedBox(
                            width: 344,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add A Product",
                                  style: poppins24_600(),
                                ),
                                const Gap(10),
                                CustomDropDown(
                                  textStyle: poppins14_500().copyWith(color: Colors.white),
                                  colorButton: defaultColor,
                                  defaultValue: "Choose a product",
                                  onChanged: (val) {},
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Gap(40),
              const Divider(),
              const Gap(40),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(color: greyColor4)
                      )
                    ),
                    child: SizedBox(
                      width: 344,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("General",style: poppins28_500(),),
                            const Gap(28),
                            Text("Sales Package",style: poppins20_400(),),
                            const Gap(34),
                            Text("Model Number",style: poppins20_400(),),
                            const Gap(34),
                            Text("Secondary Material",style: poppins20_400(),),
                            const Gap(34),
                            Text("Configuration",style: poppins20_400(),),
                            const Gap(34),
                            Text("Upholstery Material",style: poppins20_400(),),
                            const Gap(34),
                            Text("Upholstery Color",style: poppins20_400(),),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Gap(56),
              guarantyBar(),
            ],
          ),
        ),
      ),
    );
      },
    );
  }
  Widget buildProductCard(String title, String price, double rating, String review, String imagePath) {
    return SizedBox(
      width: 344,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              imagePath,
              height: 177,
              width: 280,
            ),
          ),
          const Gap(18),
          Text(
            title,
            style: poppins24_500(),
          ),
          const Gap(6),
          Text(
            price,
            style: poppins18_500(),
          ),
          const Gap(10),
          Row(
            children: [
              Text(
                rating.toString(),
                style: poppins18_500(),
              ),
              const Gap(4),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20.0,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                height: 30,
                child: VerticalDivider(),
              ),
              const Gap(9),
              Text(
                review,
                style: poppins13_400().copyWith(color: Colors.grey[400]),
              ),
            ],
          ),
        ],
      ),
    );
  }
  guarantyBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: filterBarColor,
        height: 270,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(50),
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
