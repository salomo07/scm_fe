import 'package:flutter/material.dart';
import 'package:furniro_fe/const/text_style.dart';

class CustomDropDown extends StatelessWidget {
  final defaultStyle = poppins16_400();

  CustomDropDown({
    super.key,
    this.enable = true,
    this.labelText = "",
    this.defaultValue = "Select some item",
    this.stringItems = const [],
    this.selectedValue,
    this.textStyle,
    this.colorButton,
    this.colorBorder = const Color(0xffFFFFFF),
    this.height = 45,
    this.width = 250,
    required this.onChanged,
    this.borderRadius = 8,
    this.icon,
  });

  final List<String> stringItems;
  final String? labelText;
  final String? defaultValue;
  final String? selectedValue;
  final Color? colorButton;
  final Color colorBorder;
  final double height, width;
  final void Function(String?)? onChanged;
  final double borderRadius;
  final TextStyle? textStyle;
  final Icon? icon;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = this.textStyle ?? defaultStyle;
    List<String> modifiedItems = List.from(stringItems);

    if (!modifiedItems.contains(defaultValue)) {
      modifiedItems.insert(0, defaultValue!);
    }

    return Container(
      decoration: BoxDecoration(
        color: colorButton
      ),
      child: DropdownButtonFormField<String>(
        value: selectedValue ?? defaultValue,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(            
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        items: modifiedItems.map<DropdownMenuItem<String>>((dynamic value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style: textStyle,),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
