import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/Cubit/statues.dart';
import 'package:islamic_app/screens/sub_screen/details2_screen.dart';
import 'package:islamic_app/screens/sub_screen/error_screen.dart';
import 'package:islamic_app/screens/sub_screen/loading_screen.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      builder: (context, state) {
        if (state is FailedGetHadithDataState) {
          return ErrorScreen(error: state.error);
        } else if (state is SuccessGetHadithDataState) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  'assets/image/hadith_header.png',
                  height: 227,
                  width: double.infinity,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Divider(
                              thickness: 3,
                              color: appCubit.isLight
                                  ? const Color(0xffB7935F)
                                  : const Color(0xFFFACC1D),
                            ),
                            Text(
                              'الأحاديث',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Divider(
                              thickness: 3,
                              color: appCubit.isLight
                                  ? const Color(0xffB7935F)
                                  : const Color(0xFFFACC1D),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.value.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                const Spacer(flex: 2,),
                                Expanded(
                                  flex:3,
                                  child: Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Details2Screen(
                                              title: state.value[index].title,
                                              details: state.value[index].details,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        state.value[index].title,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(flex: 1,),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const LoadingScreen();
        }
      },
      listener: (context, state) {},
    );
  }
}
