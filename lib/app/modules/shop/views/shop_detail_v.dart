import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../const/common_func.dart';
import '../controllers/shop_c.dart';

class ShopDetailView extends GetView<ShopController> {
  const ShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              color: whiteColor,
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    navBar(),
                    Gap(63),
                    Padding(
                      padding:EdgeInsets.only(top: 35,left: 99,right: 99),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration:BoxDecoration(
                                  color: filterBarColor,
                                  borderRadius:const BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(color: Colors.transparent)
                                ) ,
                                height: 80,
                                width: 76,
                              )
                            ],
                          )
                        ],
                      ) ,
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      routerDelegate: Get.rootDelegate,
    );
  }

  guarantyBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: filterBarColor,
        height: 270,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 337,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.emoji_events, size: 52),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text content to start
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text("High Quality", style: poppins25_600()),
                        Gap(2),
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
                    Icon(Icons.shield, size: 52),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text content to start
                      mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
                      children: [
                        Text("Warranty Protection", style: poppins25_600()),
                        Gap(2),
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
                    Icon(Icons.delivery_dining_outlined, size: 52),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, 
                      children: [
                        Text("Free Shipping", style: poppins25_600()),
                        Gap(2),
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
                    Icon(Icons.support_agent, size: 52),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align text content to start
                      mainAxisAlignment: MainAxisAlignment.center, // Center children vertically
                      children: [
                        Text("24 / 7 Support", style: poppins25_600()),
                        Gap(2),
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

  navBar() {
    return Container(
      width: Get.width,
      height: 100,
      color: filterBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Wrap(
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 14, // Spasi antara widget dalam baris
          runSpacing: 5, // Spasi antara baris
          alignment: WrapAlignment.start,
          children: [
            Text("Home",style: poppins16_400().copyWith(color: greyColor4),),
            Icon(Icons.arrow_forward_ios,color: Colors.black,),
            Text("Shop",style: poppins16_400().copyWith(color: greyColor4)),
            SizedBox(height: 50, child: VerticalDivider()),
            Text("Asgaard sofa",style: poppins16_400().copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget createProductView(dynamic data,bool entered) {
    return MouseRegion(
      onEnter: (event) {
        controller.idProductEntered.value=data["id"];
      },
      onExit: (event) {
        controller.idProductEntered.value="";
      },
      child: Stack(
        children: [
          Container(
            height: 446,
            width: 285,
            color: const Color(0xffF4F5F7),
            child: Column(
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [                        
                        Image.asset(data["image"],
                          height: 300,
                          width : 285,
                        ),
                        if(data["note"]!="")
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: data["note"]=="New"?const Color(0xff2EC1AC):const Color(0xffE97171),
                                shape: BoxShape.circle,
                              ),
                              child: Center(child: Text(data["note"])),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  color: const Color(0xffF4F5F7),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data["name"],style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),),
                        Text(data["desc"],style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data["price"],style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600),),
                            if(data["from"]!="")
                            Text(data["from"],style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,decoration: TextDecoration.lineThrough,color: Colors.grey),),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          if(entered)
          Positioned.fill(
            child: Container(
              color: Colors.grey.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,// Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3), // Reduced corner radius
                        ),
                      ),
                      onPressed: () {
                        controller.toDetailProduct(data);
                      }, 
                      child: Text("Add to cart",style: GoogleFonts.poppins(color: const Color(0xffE89F71),fontSize: 16,fontWeight: FontWeight.w600),)
                    ),
                    const Gap(24),
                    SizedBox(
                      width: 252,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            const Icon(Icons.share,color: Colors.white),
                            Text("Share",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
                          ],),
                          const Gap(10),
                          Row(children: [
                            const Icon(Icons.arrow_downward_sharp,color: Colors.white),
                            Text("Compare",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
                          ],),
                          const Gap(10),
                          Row(children: [
                            const Icon(CupertinoIcons.heart,color: Colors.white,),
                            Text("Like",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),)
                          ],)
                        ],
                      ),
                    ),
                    const Gap(24),
                  ],
                ),
              ),
            ),
          )
          
        ],
      ),
    );
  }
}