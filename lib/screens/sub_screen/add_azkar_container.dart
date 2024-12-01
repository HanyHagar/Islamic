
import 'package:flutter/material.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/widget/custom_button.dart';
import 'package:islamic_app/widget/custom_text_form_field.dart';
var formKey = GlobalKey<FormState>();
class AddAzkarContainer extends StatelessWidget {
  final TextEditingController controller;
  final BuildContext cont;
  final String text ;
  final Color backgroundColor;
  final Color inputColor;
  final Color buttonColor;
  final Color textButtonColor;
  const AddAzkarContainer({super.key, required this.controller, required this.cont, required this.text, required this.backgroundColor, required this.inputColor, required this.buttonColor, required this.textButtonColor, });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        key: formKey,
        child: Container(
          height: 200,
          decoration:  BoxDecoration(
            border: const Border(top: BorderSide(color: Colors.white)),
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding:  const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: controller,
                  title: 'أذكار',
                  isLabelText: true,
                  keyboardType: TextInputType.text,
                  isHiddenInputBorder: false,
                  inputSize: 18,
                  borderColor: Colors.white,
                ),
                const SizedBox(height: 32),
                CustomButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        AppCubit.get(context).hiddenBottomSheet(cont);
                      }
                    },
                    text: text,
                  color: buttonColor,
                  textColor: textButtonColor,
                    fontFamily: 'Cairo',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

