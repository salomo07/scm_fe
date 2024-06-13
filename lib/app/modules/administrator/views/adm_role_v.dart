import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../../const/text_style.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_dialog.dart';
import '../../../../widgets/custom_plutogrid.dart';
import '../../../../widgets/custom_textformfield.dart';
import '../../home/controllers/home_c.dart';
import '../controllers/adm_role_c.dart';


class AdmRoleView extends GetView<AdministratorController> {
  AdmRoleView({super.key});
  final HomeController homeController=Get.find<HomeController>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: 550,
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.8),
                borderRadius:const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.transparent)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    SizedBox( //SearchBar
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(homeController.selectedSubMenu.value.label!,style: poppinsTextFont.copyWith(fontSize: 18,color: defaultColor.withOpacity(0.7),fontWeight: FontWeight.w700),),
                          Row(
                            children: [ 
                              IconButton(
                                onPressed: () {
                                  
                                }, 
                                icon: const Icon(Icons.refresh_sharp)
                              ),
                              Tooltip(
                                message:"Ketikkan nama, deskripsi, kode Role yang anda inginkan",
                                child: CustomTextFormField(
                                  width: 200,
                                  label: "Search Role", 
                                  textStyle: poppinsTextFont, 
                                  controller: TextEditingController(),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      
                                    }, 
                                    icon: const Icon(Icons.close)
                                  ),
                                ),
                              ),                                  
                            ],
                          )
                        ],
                      )
                    ),
                    const Gap(20),
                    CustomPlutoGrid(
                      listColumn:controller.generateColumn(), 
                      listRow:controller.generateRow(),                            
                      onRowChecked: (PlutoGridOnRowCheckedEvent event) {
                        
                      },
                      onLoaded: (event) {
                        
                      },
                    ),
                    CustomButton(
                      text: "Add", 
                      onPressed: () {
                        CustomDialog(
                          title: "Add Role",
                          heightContent: 500,
                          onClick: () {
                            
                          },
                          widgetContent: ListView(
                            children: [
                              Row(
                                children: [ 
                                  const SizedBox(
                                    width: 160,
                                    child:Text("Name") ,
                                  ),
                                  CustomTextFormField(
                                    label: "Name", 
                                    textStyle: poppinsTextFont, 
                                    controller: TextEditingController()
                                  )
                                ],
                              )
                            ],
                          ),
                        ).show();
                    },)
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
