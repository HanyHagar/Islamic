import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/Cubit/statues.dart';
import 'package:islamic_app/data/lang_data.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  const DetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingGetHadithDataState,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            backgroundColor: Colors.transparent,
            // Transparent Scaffold background
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 24,
                  color: appCubit.isLight ? Colors.black : Colors.white,
                ),
              ),
              title: Text(
                LanguageHelper.title(appCubit.isArabic),
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                // Fully transparent status bar
                statusBarIconBrightness: appCubit.isLight
                    ? Brightness.dark
                    : Brightness.light, // Adjust icon brightness dynamically
              ),
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    appCubit.isLight
                        ? 'assets/image/home_light_background.png'
                        : 'assets/image/home_dark_background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: appCubit.isLight
                            ? const Color(0xffF8F8F8)
                            : const Color(0xff141A2E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyMedium,
                          ),
                          Divider(
                            thickness: 2,
                            indent: 5,
                            endIndent: 5,
                            color: appCubit.isLight
                                ? const Color(0xffB7935F)
                                : const Color(0xFFFACC1D),
                          ),
                          if(state is SuccessGetMoshafDataState)
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    state.value,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          if (state is FailedGetMoshafDataState)
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  state.error,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
