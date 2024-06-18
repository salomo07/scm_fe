import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../const/common_func.dart';
import '../../../../const/text_style.dart';
import '../../../routes/pages.dart';
import '../../home/views/footer.dart';
import '../controllers/dashboard2_c.dart';

class Dashboard2View extends GetView<Dashboard2Controller> {
  const Dashboard2View({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets padding=isDesktop(Get.width)? const EdgeInsets.only(bottom: 30,left: 30,right: 30,top: 30):isTablet(Get.width)?const EdgeInsets.all(20):const EdgeInsets.all(15);
    double containerWidth=1196;
    double containerHeight=721;
    final random = Random();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: whiteColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [                    
                    ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.9,
                        child: SizedBox(
                          width: Get.width,
                          height: Get.height,
                          child: Image.asset("/furniro/images/background/background1.jpg",
                            width: Get.width,
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width:isDesktop(Get.width)?600:isTablet(Get.width)?400:300,
                            height: isDesktop(Get.width)?400:isTablet(Get.width)?300:300,
                            color: const Color(0xffFFF3E3),
                            child: Padding(
                              padding: padding,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [            
                                  Text("New Arrival",style: GoogleFonts.poppins(fontSize: !isDesktop(Get.width)?14:24,color: const Color(0xff333333),fontWeight: FontWeight.w600),),
                                  Text("Discover Our",style: GoogleFonts.poppins(fontSize: isDesktop(Get.width)?50:isTablet(Get.width)?42:30,color: defaultColor,fontWeight: FontWeight.w700),),
                                  Text("New Collection",style: GoogleFonts.poppins(fontSize: isDesktop(Get.width)?50:isTablet(Get.width)?42:30,color: defaultColor,fontWeight: FontWeight.w700)),
                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis.",style: GoogleFonts.poppins(fontSize:!isDesktop(Get.width)?12:18,color: const Color(0xff333333),fontWeight: FontWeight.w500)),                                      
                                  isDesktop(Get.width)?const Gap(40):const Gap(20),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: defaultColor,// Button background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3), // Reduced corner radius
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                      minimumSize: isDesktop(Get.width)? const Size(220, 75):isTablet(Get.width)?const Size(120, 35):const Size(120, 35),
                                    ),                                  
                                    onPressed: () {
                                      Get.rootDelegate.toNamed(Paths.shop);
                                    }, 
                                    child: Text("Buy Now",style: GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w700),)
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(56),
                if(isDesktop(Get.width))
                segmentCategoriesDesktop(),
                if(!isDesktop(Get.width))
                segmentCategoriesNotDesktop(),
                const Gap(56),                        
                if(isDesktop(Get.width))
                segmentProductsDesktop(),
                if(!isDesktop(Get.width))
                segmentProductsNotDesktop(),
                const Gap(56),
                Container(
                  height: 670,
                  color: const Color(0xffFCF8F3),
                  child: Padding(
                    padding:isDesktop(Get.width)?const EdgeInsets.only(left: 100):const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        leftRoom(),
                        if(isDesktop(Get.width))
                        const Gap(42),
                        Obx(() {
                          if(controller.listImageRooms.isNotEmpty){
                          return Expanded(
                            child:SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: controller.listImageRooms.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  var element = entry.value;
                                  return Row(
                                    children: [
                                      SizedBox(                                    
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              element["image"],
                                              height: index==0?582:486,
                                              width: index==0?404:372,
                                              fit: BoxFit.fill,                                          
                                            ),
                                            Positioned(
                                              bottom: 24,
                                              left: 24,
                                              child: Container(
                                                width: 217,
                                                height: 130,
                                                color: whiteColor.withOpacity(0.7),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("01",style: poppins16_500().copyWith(color: greyColor3),),
                                                      const Gap(10),
                                                      const SizedBox(width: 27,child: Divider()),
                                                      const Gap(10),
                                                      Text("Bed Room",style: poppins16_500().copyWith(color: greyColor3)),
                                                    ],
                                                  ),
                                                  Text("Inner Peace",style: poppins28_500(),)
                                                ],),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const Gap(24)
                                    ],
                                  );
                                },).toList(),
                              ),
                            )
                          );
                          }
                          return const Text("");
                        },)
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text("Share your setup with",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,color: greyColor3),),
                        Text("#FuniroFurniture",style: GoogleFonts.poppins(fontSize: 40,fontWeight: FontWeight.w700,color: blackColor2),),
                        SingleChildScrollView(
                          scrollDirection: !isDesktop(Get.width)?Axis.horizontal:Axis.vertical,
                          child: SizedBox(
                            width: containerWidth,
                            height: containerHeight,
                            child: Obx(() {
                              final shuffledList = controller.listImageRooms.toList();
                              shuffledList.shuffle(Random());
                              return Wrap(
                                spacing: 30,
                                runSpacing: 30,
                                children: shuffledList.map((e) {
                                  final width = 100 + random.nextInt(200);
                                  final height = 100 + random.nextInt(200);
                                  return Image.asset(
                                    e["image"],
                                    fit: BoxFit.cover,
                                    width: width.toDouble(),
                                    height: height.toDouble(),
                                  );
                                },).toList(),
                              );
                            },),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                if(isDesktop(Get.width-100))
                Gap(containerHeight),
                const FooterView()                    
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox leftRoom() {
    return SizedBox(
      width: isDesktop(Get.width)? 422:200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text("50+ Beautiful rooms inspiration",style: poppins40_700(),),
          const Gap(7),
          Text("Our designer already made a lot of beautiful prototipe of rooms that inspire you",style: poppins16_500().copyWith(color: const Color(0xff616161))),
          const Gap(25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: defaultColor,
              side: BorderSide(color: defaultColor, width: 2.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3), // Reduced corner radius
              ),
              minimumSize: const Size(176, 48)
            ),
            onPressed: () {
              
            }, 
            child:Text("Explore More",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w600,color: whiteColor),) 
          ),                            
        ],
      ),
    );
  }

  Column segmentCategoriesDesktop() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120),
          child: SizedBox(
            child: Column(
              children: [                          
                Text("Browse The Range",style: GoogleFonts.poppins(fontSize: 32,fontWeight: FontWeight.w700),),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w400),),
              ],
            ),
          ),
        ),
        const Gap(56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            runSpacing: 20,
            spacing: 20,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("/furniro/images/background/dining.png")
                    ),
                  ),
                  const Gap(10),
                  Text("Dining",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("/furniro/images/background/living.png")
                    ),
                  ),
                  const Gap(10),
                  Text("Living",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("/furniro/images/background/badroom.png")
                    ),
                  ),
                  const Gap(10),
                  Text("Badroom",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  Column segmentCategoriesNotDesktop() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [                          
              Text("Browse The Range",style: GoogleFonts.poppins(fontSize: 32,fontWeight: FontWeight.w700),),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w400),),
            ],
          ),
        ),
        const Gap(20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("/furniro/images/background/dining.png")
                      ),
                    ),
                    const Gap(10),
                    Text("Dining",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("/furniro/images/background/living.png")
                      ),
                    ),
                    const Gap(10),
                    Text("Living",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("/furniro/images/background/badroom.png")
                      ),
                    ),
                    const Gap(10),
                    Text("Badroom",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600),)
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  segmentProductsNotDesktop() {    
    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Our Products",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                TextButton(
                  onPressed: () {
                    Get.rootDelegate.toNamed(Paths.shop);
                  }, 
                  child: Text("Show More",style: GoogleFonts.poppins(color: defaultColor),)
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: controller.listProducts.map((element) {
                  return Row(
                    children: [
                      createProductView(element,controller.idProductEntered.value==element["id"]),
                      const Gap(30)
                    ],
                  );
                },).toList(),
              ),
            ),
          ),
        ],
      );
    },);
  }
  segmentProductsDesktop() {    
    return Obx(() {
      return Column(
        children: [
          const Text("Our Products",style: TextStyle(fontSize: 48,fontWeight: FontWeight.w700),),
          const Gap(32),
          SizedBox(
            width: 1236,
            child: Center(
              child: Wrap(
                spacing: 30,
                runSpacing: 30,
                children: controller.listProducts.map((element) {
                  return createProductView(element,controller.idProductEntered.value==element["id"]);
                },).toList(),
              ),
            ),
          ),
          const Gap(30),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: defaultColor, width: 2.0),
                textStyle: GoogleFonts.poppins(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3), // Reduced corner radius
                )
              ),
              onPressed: () {
                Get.rootDelegate.toNamed(Paths.shop);
              },
              child: Text("Show More",style: GoogleFonts.poppins(color: defaultColor),),
            ),
          ),
        ],
      );
    },);
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
