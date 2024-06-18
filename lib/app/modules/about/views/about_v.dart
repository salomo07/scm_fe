import 'package:flutter/material.dart';
import 'package:furniro_fe/app/modules/about/controllers/about_c.dart';
import 'package:furniro_fe/const/text_style.dart';
import 'package:furniro_fe/widgets/custom_textformfield.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

import '../../home/views/footer.dart';
import '../../home/views/guarantybar.dart';


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
                        alignment: WrapAlignment.center,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Categories",style: poppins24_500(),),
                                            const Gap(33),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                      const Gap(20),
                      pagination()
                      ],
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
  Row pagination() {
    return Row(
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
          child: Text("1",style: poppins16_600(),)
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
          child: Text("2",style: poppins16_400(),)
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
          child: Text("3",style: poppins16_400(),)
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
          child: Text("Next",style: poppins16_400(),)
        )
      ],
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
}
