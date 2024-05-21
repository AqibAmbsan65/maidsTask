import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../Const/Colors/App_Colors.dart';
import 'CustomText.dart';

class CustomDropDown2 extends StatelessWidget {
  final String? dropdownValue, hintText, labelText;
  final List<String>? dropDownData;
  final Function(String)? onChanged;
  final Color? color,dropdowntext, fillcolor;
  final double? width,
      fontSize,
      dropDownWidth,
      menuItemPadding,
      horizontalPadding;
  final Color? borderColor, hintTextColor;
  final Offset? offset;
  final String? Function(String?)? validator;
  bool? inputdecoptaion ;

  CustomDropDown2(
      {Key? key,
        this.inputdecoptaion = false,
        this.dropDownData,
        this.dropdownValue,
        this.width,
        this.labelText,
        this.onChanged,
        this.fontSize = 15.5,
        this.hintText = "",
        this.hintTextColor,
        this.horizontalPadding,
        this.validator,
        this.menuItemPadding,
        this.dropDownWidth,
        this.offset,
        this.fillcolor = App_Colors.THEME_COLOR_WHITE,
        this.borderColor,  this.color,this.dropdowntext = App_Colors.THEME_COLOR_BLACK})
      : super(key: key);
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        style: TextStyle(
            color: color ??  App_Colors.THEME_COLOR_BLACK, fontSize: fontSize!),
        validator: validator!,
        hint: Text(
          hintText!,
          style: TextStyle(
            fontSize: 16,
            color:
            hintTextColor ?? App_Colors.THEME_COLOR_BLACK.withOpacity(0.5),
          ),
        ),
        decoration: inputdecoptaion == false?_inputDecoration2():_inputDecoration(),
        menuItemStyleData: MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: menuItemPadding ?? 10),
        ),
        iconStyleData: IconStyleData(
          icon: Icon(Icons.arrow_drop_down_rounded)
          // icon: Image.asset(Assets.iconsDown, scale: 4.0),
          // iconSize: 30,
        ),
        isExpanded: true,
        items: dropDownData!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: _text(text: value, color: dropdowntext),
          );
        }).toList(),
        value: dropdownValue,
        onChanged: (String? newValue) {
          onChanged!(newValue!);
        },
        selectedItemBuilder: (BuildContext context) {
          return dropDownData!.map<Widget>((dynamic item) {
            return CustomText(text: item, textcolor: color ?? Colors.white,fontsize: 16,);
          }).toList();
        },
        dropdownStyleData: DropdownStyleData(
          padding: EdgeInsets.only(left: horizontalPadding ?? 2),
          elevation: 1,
          width: dropDownWidth ?? double.infinity,
          offset: offset ?? Offset(-5, -20),
          isOverButton: false,
        ),
      ),
    );
  }
  TextStyle _errorStyle() {
    return TextStyle(
      color: Colors.red,
      height: 0.7,
      fontSize: 11,
    );
  }
  Widget _text({String? text, Color? color}) {
    return CustomText(
      text: text ?? "",
      fontsize: fontSize!,
      // textAlign: TextAlign.start,
      textcolor: color ?? App_Colors.THEME_COLOR_WHITE,
    );
  }
  InputDecoration _inputDecoration() {
    return InputDecoration(
      isDense: true,
      labelText: labelText,
      labelStyle: TextStyle(
          color: _focusNode.hasFocus
              ? color ?? App_Colors.THEME_COLOR_WHITE
              : color ?? App_Colors.THEME_COLOR_WHITE,
          fontSize: 15),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLUE.withOpacity(0.5)),borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLUE.withOpacity(0.5)),borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLUE.withOpacity(0.5)),borderRadius: BorderRadius.circular(10)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_BLUE.withOpacity(0.5)),borderRadius: BorderRadius.circular(10)),

      errorStyle: _errorStyle(),
    );
  }

  InputDecoration _inputDecoration2(){
    return InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: fillcolor,
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(10)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: App_Colors.THEME_COLOR_WHITE),borderRadius: BorderRadius.circular(10)),
    );
  }
}