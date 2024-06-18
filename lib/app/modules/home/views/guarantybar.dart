import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../const/text_style.dart';
import '../controllers/home_c.dart';

class GuarantyBar extends GetView<HomeController> {
  const GuarantyBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: filterBarColor,
        height: 270,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
  }
