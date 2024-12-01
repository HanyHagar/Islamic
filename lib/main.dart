import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/Cubit/statues.dart';
import 'package:islamic_app/screens/layouts/splash_screen.dart';
import 'Cubit/cubit.dart';
import 'Cubit/my_bloc_opserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme:  const TextTheme(
                  displayLarge: TextStyle(color: Color(0xFF242424),fontSize: 48,fontWeight: FontWeight.bold,fontFamily: "Cairo"),
                  displayMedium: TextStyle(color: Colors.transparent,fontSize: 24,fontWeight: FontWeight.bold,fontFamily: "Cairo"),
                  bodyLarge:TextStyle(color: Color(0xFF242424),fontSize: 24,fontWeight: FontWeight.w700,fontFamily: "Cairo"),
                  bodyMedium:  TextStyle(color: Color(0xFF242424),fontSize: 24,fontWeight: FontWeight.w700,fontFamily: "Cairo"),
                  bodySmall:  TextStyle(color: Color(0xFF242424),fontSize: 18,fontWeight: FontWeight.normal,fontFamily: "Cairo"),

                ),
                appBarTheme:  AppBarTheme(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  titleTextStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              darkTheme:ThemeData(
                textTheme:  const TextTheme(
                    displayLarge: TextStyle(color: Colors.white,fontSize: 48,fontWeight: FontWeight.bold,fontFamily: "Cairo"),
                    displayMedium: TextStyle(color: Colors.transparent,fontSize: 24,fontWeight: FontWeight.bold,fontFamily: "Cairo"),
                    bodyLarge:TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700, fontFamily: "Cairo"),
                    bodyMedium:  TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700, fontFamily: "Cairo"),
                    bodySmall:  TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.normal,fontFamily: "Cairo")

                ),
                appBarTheme:  AppBarTheme(
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  titleTextStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              themeMode: AppCubit.get(context).isLight?ThemeMode.light:ThemeMode.dark,
              home: const SplashScreen(),

          );
        },
      ),
    );
  }
}

