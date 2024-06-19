import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/text_style.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    super.key,
    required this.label,
    this.width = 100,
    this.height,
    required this.textStyle,
    this.overflow,
    this.align,
    this.onchanged,
    this.prefixFontSize = 16,
    this.hintFontSize = 16,
    this.hintColor = 0xff808080,
    this.borderColor = 0xff4285F4,
    required this.controller,
    this.textInputType,
    this.isMandatory = false,
    this.textInputFormater,
    this.prefixIcon,
    this.suffixIcon,
    this.secureText = false,
    this.onSuffixTap,
    this.onPrefixTap,
    this.onTap,
    this.isEnabled = true,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.maxLength,
    this.hint="",
    this.borderRadius=8, 
    this.focusNode
  });

  final String label,hint;
  final TextStyle textStyle;
  final TextOverflow? overflow;
  final TextAlign? align;
  final Function(String)? onchanged;
  final int hintColor, borderColor, maxLines;
  final int? maxLength;
  final double hintFontSize, prefixFontSize, width; 
  final double? height;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool isMandatory, isEnabled;
  final List<TextInputFormatter>? textInputFormater;
  final IconButton? suffixIcon, prefixIcon;
  final bool secureText;
  final Function()? onSuffixTap, onPrefixTap, onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final double borderRadius;
  late FocusNode? focusNode=FocusNode();

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override  
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [        
        SizedBox(
          width: widget.width,
          child: TextFormField(
            focusNode:widget.focusNode,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            style: widget.textStyle,
            cursorColor: defaultColor,
            obscureText: widget.secureText,
            onTap: widget.onTap,
            onChanged: widget.onChanged,
            validator: widget.validator,
            enabled: widget.isEnabled,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            keyboardType: widget.textInputType,
            decoration: InputDecoration( 
              counterText: '',             
              hintText: widget.hint,
              contentPadding: widget.textInputType==TextInputType.multiline? const EdgeInsets.symmetric(vertical: 12,horizontal: 12): const EdgeInsets.symmetric(horizontal: 12),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              label: Text(
                widget.label,
                style: poppinsTextFont.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: (widget.isEnabled) ? Colors.black : Colors.grey),
              ),
              errorStyle: poppinsTextFont.copyWith(fontSize: 10, color: Colors.red),
              labelStyle: poppinsTextFont.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(color: defaultColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
