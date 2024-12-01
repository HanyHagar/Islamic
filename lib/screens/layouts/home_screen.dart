import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/Cubit/statues.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/data/lang_data.dart';
import 'package:islamic_app/widget/custom_bottom_appBar_item.dart';

var scaffoldKey = GlobalKey<ScaffoldState>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit appCubit = AppCubit.get(context);
        return Directionality(
          textDirection: appCubit.isArabic
              ? TextDirection.rtl
              : TextDirection.ltr, // Set text direction to RTL
          child: Scaffold(
            key: scaffoldKey,
            extendBodyBehindAppBar: true,
            extendBody: true,
            backgroundColor:
                Colors.transparent, // Transparent Scaffold background
            appBar: AppBar(
              // Explicitly setting backgroundColor to transparent
              backgroundColor: Colors.transparent,
              elevation: 0, // No shadow
              title: Text(
                LanguageHelper.title(appCubit.isArabic),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor:
                    Colors.transparent, // Fully transparent status bar
                statusBarIconBrightness:
                    Brightness.light, // Light icons for better visibility
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    appCubit.isLight
                        ? 'assets/image/home_light_background.png'
                        : 'assets/image/home_dark_background.png',
                  ),
                ),
              ),
              child: SafeArea(child: screens[appCubit.currentScreen],),
            ),
            bottomNavigationBar: BottomAppBar(
              color: appCubit.isLight
                  ? const Color(0xffB7935F)
                  : const Color(0xFF141A2E),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomBottomAppBarItem(
                    index: 0,
                    image: 'assets/image/moshaf_gold.png',
                    label: LanguageHelper.quran(appCubit.isArabic),
                    onTap: () {
                      appCubit.changeScreen(0);
                    },
                  ),
                  CustomBottomAppBarItem(
                    index: 1,
                    image: 'assets/image/hadith.png',
                    label: LanguageHelper.hadiths(appCubit.isArabic),
                    onTap: () {
                      appCubit.getHadithData('ahadeth.txt');
                      appCubit.changeScreen(1);
                    },
                  ),
                  CustomBottomAppBarItem(
                    index: 2,
                    image: 'assets/image/sebha_blue.png',
                    label: LanguageHelper.tasbeeh(appCubit.isArabic),
                    onTap: () {
                      appCubit.changeScreen(2);
                    },
                  ),
                  CustomBottomAppBarItem(
                    index: 3,
                    image: 'assets/image/radio_blue.png',
                    label: LanguageHelper.radio(appCubit.isArabic),
                    onTap: () {
                      appCubit.getRadio();
                      appCubit.changeScreen(3);
                    },
                  ),
                  CustomBottomAppBarItem(
                    index: 4,
                    image: 'assets/image/settings.png',
                    label: LanguageHelper.settings(appCubit.isArabic),
                    onTap: () {
                      appCubit.changeScreen(4);
                    },
                  ),
                ],
              ),
              elevation: 0,
            ),
          ),
        );
      },
    );
  }
}
/*Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    appCubit.isLight
                        ? 'assets/image/home_light_background.png'
                        : 'assets/image/home_dark_background.png',
                    fit: BoxFit.fill,
                    height: double.infinity,
                  ),
                ),
                SafeArea(
                  child: screens[appCubit.currentScreen],
                ),
              ],
            ),*/
