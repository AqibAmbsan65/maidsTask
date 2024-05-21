import 'package:flutter/material.dart';

import '../../../Const/App_Navigation/App_navigation.dart';
import '../../../Const/Colors/App_Colors.dart';
import '../../../Const/Strings/App_Strings.dart';
import '../../../Const/constants/MyConst.dart';
import '../../../GlobleWidgets/CustomButton.dart';
import '../../../GlobleWidgets/CustomText.dart';
import '../../../GlobleWidgets/TextEditField.dart';


class AddEditWidget extends StatelessWidget {
  AddEditWidget(
      {super.key,
        required GlobalKey<FormState> fromKey,
        required this.todoMessage,
        this.saveontap,
        this.mainTitle})
      : _fromKey = fromKey;

  final GlobalKey<FormState> _fromKey;
  final TextEditingController todoMessage;

  String? mainTitle;

  VoidCallback? saveontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: h15v10,
      padding: h10v5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: App_Colors.forthColor,
      ),
      child: Form(
        key: _fromKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            h10,
            CustomText(
              text: "$mainTitle",
              textcolor: App_Colors.primaryColor,
              fontsize: 22,
              weight: FontWeight.bold,
            ),
            h10,
            TextFormFiled(
              controller: todoMessage,
              maxlength: 500,
              hint: "Todo Message",
              validator: (val) {
                if (val!.isEmpty) {
                  return "Todo Message ${AppStrings.Field_EMPTY_ERROR}";
                }
              },
            ),
            h20,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onpress: () {
                      AppNavigation.navigateCloseDialog(context);
                    },
                    text: "Cancel",
                    radius: 10,
                    textcolor: App_Colors.THEME_COLOR_RED,
                    btnColor: App_Colors.THEME_COLOR_WHITE,
                  ),
                ),
                w10,
                Expanded(
                  child: CustomButton(
                    onpress: saveontap,
                    text: "Save",
                    btnColor: App_Colors.THEME_COLOR_GREEN,
                    radius: 10,
                  ),
                ),
              ],
            ),
            h10,
          ],
        ),
      ),
    );
  }
}

