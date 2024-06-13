import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/text_style.dart';
import 'custom_button.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    this.height=500,
    this.width=500,
    required this.title,
    this.textContent="",
    this.widgetContent,
    this.showBackButton=false,
    this.showErrorButton=false,
    this.showYesButton=true,
    this.onClick,
    this.onErrorClick,
    this.heightContent=500,
    this.textYesButton="Ok",
    this.textErrorButton="Batal",
    this.widthYesButton=120,
    this.widthErrorButton=120,
  });

  final double height,width,heightContent,widthYesButton,widthErrorButton;
  final String title,textContent,textYesButton,textErrorButton;
  final Widget? widgetContent;
  final bool showBackButton,showErrorButton,showYesButton;
  final Function()? onClick,onErrorClick;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
  void show(){
    Get.dialog(this);
  }
}

class _CustomDialogState extends State<CustomDialog> {
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide()
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        height: widget.height,
        width: widget.width,
        child: Column(
          children: [
            Container(
              height: 57,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero,
                border: Border(bottom: BorderSide(color:Colors.black26))
              ),
              child: Padding(
                padding:  const EdgeInsets.only(left: 16,right: 16),
                child: Align (
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.title,style: poppinsTextFont.copyWith(color: defaultColor,fontSize: 16, fontWeight: FontWeight.w500),),
                      IconButton(onPressed: () {Get.back();}, icon:const Icon(Icons.close))
                    ],
                  )
                ),
              ),
            ),
            widget.widgetContent==null?
            Padding(
              padding: const EdgeInsets.only(left: 16,top: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 56,
                  child: Text(widget.textContent,style: poppinsTextFont,)
                ),
              ),
            ): 
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: widget.heightContent,
                  child: widget.widgetContent
                ),
              ),
            ),
            Container(
              height: 58,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero,
                border: Border(top: BorderSide(color:Colors.black26))
              ),
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align (
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.showBackButton? CustomButton(textStyle: poppinsTextFont.copyWith(color: defaultColor), text: "Kembali",height: 38,width: 106,colorButton: whiteColor,colorBorder: defaultColor, onPressed: () {
                        Get.back();
                      },):const Text(""),
                      const SizedBox(width: 8,),
                      widget.showErrorButton? CustomButton(textStyle: poppinsTextFont.copyWith(color: Colors.red), text:widget.textErrorButton!=""? widget.textErrorButton:"Batal",height: 38,width: widget.widthErrorButton,colorButton: whiteColor,colorBorder: Colors.red, onPressed:widget.showErrorButton?widget.onErrorClick:() {
                        Get.back();
                      },):const Text(""),
                      const SizedBox(width: 8,),
                      CustomButton(textStyle: poppinsTextFont.copyWith(color: whiteColor),text: widget.textYesButton,height: 38,width:widget.widthYesButton,colorButton: defaultColor, onPressed: widget.onClick,)
                    ],
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}