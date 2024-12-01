import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/Cubit/statues.dart';
import 'package:islamic_app/data/lang_data.dart';
import 'package:islamic_app/widget/custom_lang_mode.dart';
import 'package:islamic_app/widget/custom_mode_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Directionality(
              textDirection: appCubit.isArabic ?TextDirection.rtl:TextDirection.ltr, // Ensures right-to-left layout
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageHelper.mode(appCubit.isArabic),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          appCubit.changeMode();
                        },
                        child: CustomModeButton(text:LanguageHelper.textMode(appCubit.isLight, appCubit.isArabic), mode:appCubit.isLight)
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageHelper.lang(appCubit.isArabic),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          appCubit.changeLang();
                        },
                        child: CustomLangButton( text: LanguageHelper.langMode(appCubit.isArabic), isArabic: appCubit.isArabic, mode: appCubit.isLight)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {

        },);

  }
}
