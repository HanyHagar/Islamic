
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/Cubit/statues.dart';
import 'package:islamic_app/data/lang_data.dart';
import 'package:islamic_app/screens/layouts/home_screen.dart';
import 'package:islamic_app/screens/sub_screen/add_azkar_container.dart';
import 'package:islamic_app/widget/custom_button.dart';
String selectedValue = '33';
String addAzkarText = 'Add Azkar';
class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit.get(context);
    TextEditingController controller = TextEditingController(text: 'اللهم صلي على سيدنا محمد');
    return BlocBuilder<AppCubit,AppStates>(
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        onPressed: () {appCubit.resetTasbeehCounter();},
                        text: LanguageHelper.resetText(appCubit.isArabic),
                        color: Colors.red,
                        fontSize: 18,
                        fontFamily: 'Cairo',
                        textColor: appCubit.isLight ? const Color(0xffe0e1e1):const Color(0xff1a233e),
                      ),
                      Container(
                        width: 137,
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: appCubit.isLight ? const Color(0xFFB7935F):const Color(0xffFcc440) ,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: appCubit.tasbeehValue.toString(),
                              dropdownColor: appCubit.isLight ? const Color(0xFFB7935F):const Color(0xffFcc440),
                              icon:  Padding(
                                padding:  const EdgeInsetsDirectional.only(end: 16),
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: appCubit.isLight ? const Color(0xffe0e1e1):const Color(0xff1a233e),
                                ),
                              ),
                              items: appCubit.dropdownItems.map((String item) {
                                return DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding:  const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      item,
                                      style:  TextStyle(color:appCubit.isLight ? const Color(0xffe0e1e1):const Color(0xff1a233e) ), // Dropdown item text color
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue){
                                appCubit.changeTasbeehValueState(int.parse(newValue!));
                              },
                              style: TextStyle(
                                  color: appCubit.isLight ? const Color(0xffe0e1e1):const Color(0xff1a233e),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      'الأذكار',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        appCubit.showBottomSheet(
                            scaffoldKey,
                            AddAzkarContainer(
                              controller: controller,
                              cont:context,
                              text: addAzkarText = appCubit.isArabic ?'إضافة ذكر' : ' Add Zikr',
                              backgroundColor: AppCubit.get(context).isLight ? const Color(0xffB7935F) : const Color(0xFF141A2E),
                              inputColor: appCubit.isLight ? Colors.black : Colors.white,
                              buttonColor: appCubit.isLight ? const Color(0xFFB7935F):const Color(0xffFcc440) ,
                              textButtonColor: AppCubit.get(context).isLight ? Colors.white : const Color(0xFF141A2E),
                            ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: appCubit.isLight ? const Color(0xFFB7935F): Colors.black38,
                            borderRadius: const BorderRadius.all(Radius.circular(20),)
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              controller.text,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Transform.rotate(
                        angle: appCubit.tasbeehCounter.toDouble(),
                        child: Image.asset(
                          appCubit.isLight ? 'assets/image/body of seb7a2.png':'assets/image/seb7a1.png',
                          height: 227,
                          width: double.infinity,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(90),
                          child: Text(
                            '${appCubit.tasbeehCounter}',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: () {appCubit.changeTasbeehCounter();},
                    text: LanguageHelper.tasbeehText(appCubit.isArabic),
                    color: appCubit.isLight ? const Color(0xFFB7935F):const Color(0xffFcc440) ,
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    textColor: appCubit.isLight ? const Color(0xffe0e1e1):const Color(0xff1a233e),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
    );
  }
}
