import 'package:flutter/material.dart';
import 'package:islamic_app/Cubit/cubit.dart';
import 'package:islamic_app/data/data.dart';
import 'package:islamic_app/screens/sub_screen/details_screen.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return Directionality(
      textDirection: TextDirection.ltr, // Set text direction to RTL
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/image/quran_header_icn.png',
            height: 227,
            width: double.infinity,
          ),
          const SizedBox(height:10 ,),
          Expanded(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Column(
                        children: [
                          Divider(
                            thickness: 3,
                            color: appCubit.isLight ? const Color(0xffB7935F):const Color(0xFFFACC1D),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'عدد الآيات',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                  '                  إسم السورة',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 3,
                            color: appCubit.isLight ? const Color(0xffB7935F):const Color(0xFFFACC1D),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: surahs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              appCubit.getMoshafData('${index + 1}.txt');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(title: 'سورة ${surahs[index]["name"]}',),));
                            },
                            child: Row(
                              children: [
                                const Spacer(flex: 2,),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '${surahs[index]["ayahs"]}',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ),
                                const Spacer(flex: 1),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: Text(
                                      '${surahs[index]["name"]}',
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),

                                  ),
                                ),
                                const Spacer(flex: 2),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Center(
                  child: VerticalDivider(
                  indent: 9,
                  thickness: 3,
                  color: appCubit.isLight ? const Color(0xffB7935F):const Color(0xFFFACC1D),
                ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
