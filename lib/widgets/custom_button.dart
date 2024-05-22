import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../const/text_style.dart';

class CustomButton extends StatelessWidget {
  
  final defaultStyle= poppinsTextFont.copyWith(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white,);
  CustomButton({    
    super.key,
    this.enable=true,
    required this.text,
    this.textStyle,
    this.colorButton,
    this.colorBorder=const Color(0xffFFFFFF),
    this.height = 45,
    this.width = 250,
    required this.onPressed,
    this.borderRadius=8,
    this.icon,
  });

  final String text;
  final Color? colorButton; 
  final Color colorBorder;
  final double height, width;
  final void Function()? onPressed;
  final double borderRadius;
  final TextStyle? textStyle;
  final Icon? icon;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = this.textStyle ?? defaultStyle;
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed:enable==true? onPressed:null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: colorButton ?? defaultColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)),
          backgroundColor: colorButton ?? defaultColor,
          side: BorderSide(color: colorBorder)
        ),
        child:icon==null?
        Text(text,style: textStyle):
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon!,
            const Gap(10),
            Text(text,style: textStyle)
          ],
        )
      )
    );
  }
}
