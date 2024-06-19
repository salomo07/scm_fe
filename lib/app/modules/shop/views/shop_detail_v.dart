import 'package:count_stepper/count_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniro_fe/app/routes/pages.dart';
import 'package:furniro_fe/const/common_func.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:furniro_fe/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../home/views/footer.dart';
import '../controllers/shop_c.dart';

class ShopDetailView extends GetView<ShopController> {
  const ShopDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(      
      routerDelegate: Get.rootDelegate,
      builder: (context, delegate, currentRoute) {
        return LayoutBuilder(
          builder: (context, constraints) {
            controller.getDetailProduct(Get.parameters["id"]??"");
            controller.getRelatedProduct();
            return Container(
              color: whiteColor,
              child: SingleChildScrollView(
                child: Obx(() {
                  if (controller.productDetail.value.nama==null) {
                    return const Align(alignment: Alignment.center, child: SizedBox(width: 100, height: 100, child: CircularProgressIndicator()));
                  }else{
                    return Column(
                      children: [
                        navBar(),
                        desktopView(),
                        const Divider(),
                        const Gap(48),
                        DefaultTabController(
                          length: 3, 
                          child: Column(
                            children: [
                              TabBar(
                                labelPadding: EdgeInsets.zero,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorWeight: 0.1,
                                indicatorColor: greyColor4,
                                dividerColor: whiteColor,
                                labelColor: Colors.black,
                                unselectedLabelColor: greyColor4,
                                labelStyle: poppins18_500(),
                                unselectedLabelStyle: poppins20_500(),
                                tabs: [
                                  Tab(child: Text("Description", style: poppins24_500(),)),
                                  Tab(child: Text("Additional Information", style: poppins24_500(),)),
                                  Tab(child: Text("Reviews [${controller.productDetail.value.reviewCount}]", style: poppins24_500(),)),
                                ],
                              ),                              
                              SizedBox(
                                height: 744,
                                child: Padding(
                                  padding:isDesktop(Get.width)? const EdgeInsets.symmetric(horizontal:50):const EdgeInsets.symmetric(horizontal:10),
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(37),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Text(controller.productDetail.value.desc2!,style: poppins16_400().copyWith(color: greyColor4),),
                                              const Gap(36),
                                              Wrap(
                                                spacing: 29,
                                                runSpacing: 10,
                                                children: [
                                                  Container(
                                                    decoration:BoxDecoration(
                                                      color: filterBarColor,
                                                      borderRadius:const BorderRadius.all(Radius.circular(5)),
                                                      border: Border.all(color: Colors.transparent)
                                                    ) ,
                                                    height: 346,
                                                    width: 400,
                                                    child: Image.asset(controller.productDetail.value.images![0]),
                                                  ),
                                                  Container(
                                                    decoration:BoxDecoration(
                                                      color: filterBarColor,
                                                      borderRadius:const BorderRadius.all(Radius.circular(5)),
                                                      border: Border.all(color: Colors.transparent)
                                                    ),
                                                    height: 346,
                                                    width: 400,
                                                    child: Image.asset(controller.productDetail.value.images![1]),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(37),
                                        child: SingleChildScrollView(
                                          child: Text(controller.productDetail.value.addInfo!,style: poppins16_400().copyWith(color: greyColor4),),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(37),
                                        child: Text("Reviews"),
                                      ),
                                    ],
                                    ),
                                ),
                              )
                            ],
                          )
                        ),
                        const Divider(),
                        const Gap(66),
                        Text("Related Products",style: poppins36_500(),),
                        const Gap(26),
                        SizedBox(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: Row(
                                children: controller.listImageRelatedProduct.map((element) {
                                  return Row(
                                    children: [
                                      createProductView(element, controller.idProductEntered.value==element["id"]),
                                      const Gap(32),
                                    ],
                                  );
                                },).toList(),
                              ),
                            ),
                          ),
                        ),
                        const Gap(44),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: defaultColor, width: 2.0),
                              textStyle: poppinsTextFont,
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
                        const Gap(92),
                        SizedBox(width: Get.width, child: const FooterView())
                      ],
                    );
                  }                  
                },),
              ),
            );
          },
        );
      }
    );
  }

  Padding desktopView() {
    return Padding(
      padding:const EdgeInsets.only(top: 35,left: 35,right: 35),
      child:Wrap(
        spacing: 31,
        children: [
          previewImage(isMobile(Get.width)==true),
          Container(
            decoration:BoxDecoration(
              color: filterBarColor,
              borderRadius:const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.transparent)
            ) ,
            height: 500,
            width: 423,
            child: Image.asset(fit: BoxFit.fill,controller.selectedImage.value==""&&controller.productDetail.value.images!.isNotEmpty?controller.productDetail.value.images![0]:controller.selectedImage.value),
          ),
          const Gap(105),
          SizedBox(
            width: 606,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.productDetail.value.nama!,style:poppins42_400()),
                Text("Rp. ${controller.productDetail.value.harga !}",style:poppins24_500().copyWith(color: greyColor4)),
                const Gap(15),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: controller.productDetail.value.rating!,
                      itemBuilder: (context, index) {
                        return const Icon(Icons.star,color: Colors.yellow,);
                      }, 
                      onRatingUpdate: (value) {},
                    ),
                    const SizedBox(height: 50,child: VerticalDivider(),),
                    Text("${controller.productDetail.value.reviewCount} Customer Review",style: poppins13_400(),)
                  ],
                ),
                const Gap(18),
                Text(controller.productDetail.value.desc!,style: poppins13_400(),),
                const Gap(22),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Size",style: poppins14_500().copyWith(color: greyColor4),),
                    const Gap(12),
                    Row(
                      children:controller.productDetail.value.sizes!.map((e) {
                        return Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: e==controller.selectedSize.value?defaultColor:filterBarColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5), // Border radius
                                ),
                                minimumSize: const Size(30, 30),
                              ),
                              onPressed: () {
                                controller.selectedSize.value=e;                           
                              }, 
                              child:Text(e,style: poppins13_400(),)
                            ),
                            const Gap(16)
                          ],
                        );
                      },).toList(),
                    )
                  ],
                ),
                const Gap(16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Color",style: poppins14_500().copyWith(color: greyColor4),),
                    const Gap(12),
                    Row(
                      children:controller.productDetail.value.colors!.map((e) {
                        return Row(
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: hexToColor(e),
                                shape: const CircleBorder(),
                                minimumSize: const Size(40, 40),
                              ),
                              onPressed: () {    
                                controller.selectedColor.value=e;
                                Fluttertoast.showToast(
                                  msg: "Warna berhasil dipilih",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.black,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );                       
                              }, 
                              child:const Text("")
                            ),
                            const Gap(16)
                          ],
                        );
                      },).toList(),
                    )
                  ],
                ),
                const Gap(32),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CountStepper(
                        iconColor: Colors.black,
                        defaultValue: 1,
                        max: 10,
                        min: 1,
                        iconDecrementColor: Colors.black,
                        splashRadius: 25,
                        onPressed: (value) {
                          controller.selectedQty.value=value;
                        },
                      ),
                      const Gap(20),
                      CustomButton(textStyle: poppins16_500().copyWith(color: blackColor2),borderRadius: 15,width: 215,height: 64,text:"Add To Cart",colorBorder: blackColor2,colorButton: whiteColor , onPressed: () {
                        controller.addToCart(Get.parameters["id"]!);
                      },),
                      const Gap(20),
                      CustomButton(textStyle: poppins16_500().copyWith(color: blackColor2),borderRadius: 15,width: 215,height: 64,text:"Compare",colorBorder: blackColor2,colorButton: whiteColor , onPressed: () {
                        controller.addToCompare(Get.parameters["id"]!);
                      },icon: const Icon(Icons.add),),
                    ],
                  ),
                ),
                const Gap(60),
                const Divider(),
                const Gap(41),
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 91,
                          child: Text("SKU",style: poppins16_400().copyWith(color: greyColor4)),
                        ),
                        Text(":",style: poppins16_400().copyWith(color: greyColor4)),
                        const Gap(12),
                        Text(controller.productDetail.value.sku!,style: poppins16_400().copyWith(color: greyColor4),),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        SizedBox(
                          width: 91,
                          child: Text("Category",style: poppins16_400().copyWith(color: greyColor4)),
                        ),
                        Text(":",style: poppins16_400().copyWith(color: greyColor4)),
                        const Gap(12),
                        Text(controller.productDetail.value.category!,style: poppins16_400().copyWith(color: greyColor4),),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        SizedBox(
                          width: 91,
                          child: Text("Tags",style: poppins16_400().copyWith(color: greyColor4)),
                        ),
                        Text(":",style: poppins16_400().copyWith(color: greyColor4)),
                        const Gap(12),
                        Text(controller.productDetail.value.tags!,style: poppins16_400().copyWith(color: greyColor4),),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      children: [
                        SizedBox(
                          width: 91,
                          child: Text("Share",style: poppins16_400().copyWith(color: greyColor4)),
                        ),
                        Text(":",style: poppins16_400().copyWith(color: greyColor4)),
                        const Gap(12),
                        const Row(
                          children: [
                            Icon(Icons.facebook),
                            Gap(25),
                            Icon(Icons.linked_camera),
                            Gap(25),
                            Icon(Icons.telegram),
                          ],
                        )
                      ],
                    ),
                  ],
                  
                ),
                const Gap(69),
                // const Divider()
              ],
            ),
          ),
        ],
      ) ,
    );
  }

  previewImage(bool isMobile) {
    if(isMobile)
    {
      return Column(
        children: [
          Wrap(          
            spacing: 32,
            runSpacing: 10,
            children:controller.productDetail.value.images!.map((element) {
              return InkWell(
                onTap: () {
                  controller.selectedImage.value=element;
                },
                child: Container(
                  decoration:BoxDecoration(
                    color: filterBarColor,
                    borderRadius:const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.transparent)
                  ) ,
                  height: 80,
                  width: 76,
                  child: Image.asset(element),
                ),
              );
            },).toList()
          ),
          const Gap(10)
        ],
      );
    }
    return Column(
      children:controller.productDetail.value.images!.map((element) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                controller.selectedImage.value=element;
              },
              child: Container(
                decoration:BoxDecoration(
                  color: filterBarColor,
                  borderRadius:const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.transparent)
                ) ,
                height: 80,
                width: 76,
                child: Image.asset(element),
              ),
            ),
            const Gap(32)
          ],
        );
      },).toList()
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
            const Icon(Icons.arrow_forward_ios,color: Colors.black,),
            Text("Shop",style: poppins16_400().copyWith(color: greyColor4)),
            const SizedBox(height: 50, child: VerticalDivider()),
            Text(controller.productDetail.value.nama!,style: poppins16_400().copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
  Color hexToColor(String hex) {
    return Color(int.parse("0xFF$hex"));
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