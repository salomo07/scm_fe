import 'package:flutter/material.dart';
import 'package:furniro_fe/app/modules/about/controllers/about_c.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:furniro_fe/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

import '../../home/views/footer.dart';


class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

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
                                  "Blog",
                                  style: poppins48_500(),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Home", style: poppins16_500()),
                                    const Icon(Icons.arrow_forward),
                                    Text("Blog", style: poppins16_300()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(100),
                  SizedBox(
                    child: Column(
                      children: [
                      const Gap(50),
                      Wrap(
                        spacing: 30,
                        children: [
                          SizedBox(
                            width: 820,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headlinePost("/furniro/images/products/blog1.png","Going all-in with millennial design","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mus mauris vitae ultricies leo integer malesuada nunc. In nulla posuere sollicitudin aliquam ultrices. Morbi blandit cursus risus at ultrices mi tempus imperdiet. Libero enim sed faucibus turpis in. Cursus mattis molestie a iaculis at erat. Nibh cras pulvinar mattis nunc sed blandit libero. Pellentesque elit ullamcorper dignissim cras tincidunt. Pharetra et ultrices neque ornare aenean euismod elementum.","Admin","14 Oct 2022","Wood"),
                                  headlinePost("/furniro/images/products/blog2.png","Going all-in with millennial design","Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mus mauris vitae ultricies leo integer malesuada nunc. In nulla posuere sollicitudin aliquam ultrices. Morbi blandit cursus risus at ultrices mi tempus imperdiet. Libero enim sed faucibus turpis in. Cursus mattis molestie a iaculis at erat. Nibh cras pulvinar mattis nunc sed blandit libero. Pellentesque elit ullamcorper dignissim cras tincidunt. Pharetra et ultrices neque ornare aenean euismod elementum.","Admin","14 Oct 2022","Wood"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 393,
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      CustomTextFormField(width: 311,label: "", textStyle: poppinsTextFont,suffixIcon: IconButton(onPressed: () {
                                        
                                      }, icon: const Icon(Icons.search)), controller: TextEditingController()),
                                      const Gap(43),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Categories",style: poppins24_500(),),
                                            const Gap(33),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  categoriesItem("Crafts",2.toString()),
                                                  categoriesItem("Design",8.toString()),
                                                  categoriesItem("Handmade",7.toString()),
                                                  categoriesItem("Interior",1.toString()),
                                                  categoriesItem("Wood",6.toString()),
                                                ],
                                              ),
                                            )
                                            
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Recent Posts",style: poppins24_500(),),
                                        const Gap(26),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              recentPost("/furniro/images/products/postmini1.png","Going all-in with millennial design","03 Aug 2022"),
                                              recentPost("/furniro/images/products/postmini2.png","Exploring new ways of decorating","03 Aug 2022"),
                                              recentPost("/furniro/images/products/postmini3.png","Handmade pieces that took time to make","03 Aug 2022"),                                          
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
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

  recentPost(image,title,date) {
    return Column(
    children: [
      SizedBox(
        height: 80,
        child: InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: poppins14_400(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      date,
                      style: poppins12_300().copyWith(color: greyColor4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10), // Adding gap between posts
    ],
  );
  }

  categoriesItem(name,qty) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style: poppins16_400().copyWith(color: greyColor4),),
              Text(qty,style: poppins16_400().copyWith(color: greyColor4),),
            ],
          ),
          const Gap(40)
        ],
      ),
    );
  }

  headlinePost(image,title,desc,username,postdate,tags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(image,
            width: 817,
            height: 500
          ),
        ),
        const Gap(17),
        metaData(username,postdate,tags),
        const Gap(15),
        Text(title,style: poppins30_500(),),
        const Gap(12),
        Text(desc,style: poppins14_400(),),
        const Gap(30),
        InkWell(
          onTap: () {},
          child: Text("Read More",style: poppins16_400(),)),
        const Gap(30),
      ],
    );
  }

  Row metaData(username,postdate,tags) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.person,color: greyColor4,),
            const Gap(2),
            Text(username,style: poppins16_400().copyWith(color: greyColor4),),
          ],
        ),
        const Gap(35),
        Row(
          children: [
            Icon(Icons.calendar_month,color: greyColor4,),
            const Gap(2),
            Text(postdate,style: poppins16_400().copyWith(color: greyColor4),),
          ],
        ),
        const Gap(35),
        Row(
          children: [
            Icon(Icons.text_rotation_angledown,color: greyColor4,),
            const Gap(2),
            Text(tags,style: poppins16_400().copyWith(color: greyColor4),),
          ],
        )
      ],
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
                          const Icon(Icons.filter_list_outlined),
                          const Gap(12),
                          Text("Filter",style: poppins20_400(),)
                        ],
                      ),
                      const SizedBox(child: Icon(Icons.grid_view_rounded)),
                      const Icon(Icons.calendar_view_day_sharp),
                    ],
                  ),
                  const Gap(20),
                  const SizedBox(height: 50, child: VerticalDivider()),
                  const Gap(34), // Menggunakan VerticalDivider untuk memisahkan secara vertikal
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
                      const Gap(17),
                      SizedBox(width: 55, child: TextFormField())
                    ],
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Text("Short by",style: poppins20_400(),),
                      const Gap(17),
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
}
