import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../const/common_func.dart';
import '../../../routes/pages.dart';
import '../controllers/shop_c.dart';


class ShopView extends GetView<ShopController> {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        return GetRouterOutlet(
          initialRoute:Paths.shop+Paths.shopList,
          anchorRoute: Paths.shop,
        );
      },
    );
  }
}

class ShopListView extends GetView<ShopController> {
  const ShopListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: LayoutBuilder(
      builder: (context, constraints) {
        if(isDesktop(Get.width)){print("isDesktop");}
        else if(isTablet(Get.width)){print("isTablet");}
        else{print("isMobile");}
        
        return Scaffold(
          body: Container(
            color: whiteColor,
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: Get.width,
                        height: 318, // Adjust the height as needed
                        child: Image.asset(
                          "/furniro/images/background/background2.png",
                          width: Get.width,
                          fit: BoxFit.fill,
                          // alignment: Alignment.topCenter,
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
                                Text(
                                  "Shop",
                                  style: poppins48_500(),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Home", style: poppins16_500()),
                                    const Icon(Icons.arrow_forward),
                                    Text("Shop", style: poppins16_300()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  filterBar(),
                  Gap(63),
                  Container(
                    width: 1236,
                    color: whiteColor,
                    child: Obx(() {
                      return Center(
                        child: Wrap(
                          spacing: 30,
                          runSpacing: 30,
                          children: controller.listProducts.map((element) {
                            return createProductView(element,controller.idProductEntered.value==element["id"]);
                          },).toList(),
                        ),
                      );
                    },),
                  ),
                  Gap(70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: defaultColor,// Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3), // Reduced corner radius
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          maximumSize: const Size(66, 66),
                        ),                                  
                        onPressed: () {
                          
                        }, 
                        child: Text("1",style: GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),)
                      ),
                      const Gap(38),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: filterBarColor,// Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3), // Reduced corner radius
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          maximumSize: const Size(66, 66),
                        ),                                  
                        onPressed: () {
                          
                        }, 
                        child: Text("2",style: GoogleFonts.poppins(color: blackColor2 ,fontSize: 16,fontWeight: FontWeight.w400),)
                      ),
                      const Gap(38),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: filterBarColor,// Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3), // Reduced corner radius
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          maximumSize: const Size(66, 66),
                        ),                                  
                        onPressed: () {
                          
                        }, 
                        child: Text("3",style: GoogleFonts.poppins(color: blackColor2 ,fontSize: 16,fontWeight: FontWeight.w400),)
                      ),
                      const Gap(38),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: filterBarColor,// Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3), // Reduced corner radius
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          maximumSize: const Size(166,66),
                        ),                                  
                        onPressed: () {
                          
                        }, 
                        child: Text("Next",style: GoogleFonts.poppins(color: blackColor2 ,fontSize: 16,fontWeight: FontWeight.w400),)
                      )
                    ],
                  ),
                  Gap(85),
                  guarantyBar()
                ],
              ),
            ),
          ),
          bottomNavigationBar: !isDesktop(Get.width)?BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
              ),
            ],
          ):null,
        );
      },
    ),
    );
  }

  guarantyBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: filterBarColor,
        height: 270,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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

  filterBar() {
    return Container(
      width: Get.width,
      color: filterBarColor,
      // height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Wrap(
          runAlignment: WrapAlignment.center,
          spacing: 5, // Spasi antara widget dalam baris
          runSpacing: 5, // Spasi antara baris
          alignment: WrapAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.filter_list_outlined),
                          Gap(12),
                          Text("Filter",style: poppins20_400(),)
                        ],
                      ),
                      SizedBox(child: Icon(Icons.grid_view_rounded)),
                      Icon(Icons.calendar_view_day_sharp),
                    ],
                  ),
                  Gap(20),
                  SizedBox(height: 50, child: VerticalDivider()),
                  Gap(34), // Menggunakan VerticalDivider untuk memisahkan secara vertikal
                  Flexible(child: Text("Showing 1–16 of 32 results",style: poppins20_400(),)),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Text("Show",style: poppins20_400(),),
                      Gap(17),
                      SizedBox(width: 55, child: TextFormField())
                    ],
                  ),
                  Gap(20),
                  Row(
                    children: [
                      Text("Short by",style: poppins20_400(),),
                      Gap(17),
                      SizedBox(width: 120, child: TextFormField())
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
