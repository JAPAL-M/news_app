import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/home_layout.dart';
import 'package:news_app/shared/BlocObserver/Bloc_Observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/cubit_all.dart';
import 'package:news_app/shared/cubit/states_all.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => AppCubit()),
        BlocProvider(create: (BuildContext context) => NewsCubit()..getBusinessData()..getSportsData()..getScienceData(),)
      ],
          child: BlocConsumer<AppCubit, AppStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: const HomeLayout(),
                  themeMode: cubit.isDark? ThemeMode.dark : ThemeMode.light,
                  darkTheme: ThemeData(
                      textTheme: const TextTheme(
                          bodyText1: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                      ),
                      scaffoldBackgroundColor: HexColor('333739'),
                      primarySwatch: Colors.deepOrange,
                      appBarTheme: AppBarTheme(
                          titleTextStyle: const TextStyle(color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: HexColor('333739'),
                            statusBarIconBrightness: Brightness.light,
                          ),
                          elevation: 0.0,
                          color: HexColor('333739'),
                          iconTheme: const IconThemeData(
                              color: Colors.white
                          )
                      ),
                      bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        selectedItemColor: Colors.deepOrange,
                        unselectedItemColor: Colors.grey,
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: HexColor('333739'),
                        elevation: 5.0,
                      )
                  ),
                  theme: ThemeData(
                      textTheme: const TextTheme(
                        bodyText1: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),
                      ),
                      primarySwatch: Colors.deepOrange,
                      scaffoldBackgroundColor: Colors.white,
                      appBarTheme: const AppBarTheme(
                          titleTextStyle: TextStyle(color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          systemOverlayStyle: SystemUiOverlayStyle(
                            statusBarColor: Colors.white,
                            statusBarIconBrightness: Brightness.dark,
                          ),
                          elevation: 0.0,
                          color: Colors.white,
                          iconTheme: IconThemeData(
                              color: Colors.black
                          )
                      ),
                      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                        selectedItemColor: Colors.deepOrange,
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.white,
                        elevation: 5.0,
                      )
                  ),
                );
              }
          )
    );
  }
}
