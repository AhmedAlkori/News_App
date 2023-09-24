

import 'package:final_news_app/Layout/Block/Cubit.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:final_news_app/Layout/Home_Screen.dart';
import 'package:final_news_app/Shared/Components/constens.dart';
import 'package:final_news_app/Shared/Network/Dio_Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Layout/Block/Block_Observer/blockObserver.dart';
import 'Moduls/Splash/Home_Splash_Screen.dart';
import 'Shared/Local/Cash_Helper.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  await CashHelper.initPreference();
  DioHelper.initDio();
  var lng=CashHelper.getCash(key: 'lang');
  if(lng != null)
    {
      LangType=lng;
    }
  else{}
  runApp( MyApp());


}

class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>NewsCubit()..getMode()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state)
        {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'AlamirReg',
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  elevation: 0.0,
                  color: Colors.white,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.white,

                  ),
                ),

                textTheme: TextTheme(
                  bodySmall:  TextStyle(
                    color:  Colors.grey,
                    fontSize: 14.0,
                    fontFamily: 'Janna',
                  ),
                  bodyMedium: TextStyle(
                    color:  HexColor('333739'),
                  ),
                ),


              ),
              darkTheme: ThemeData(
                fontFamily: 'AlamirReg',
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  elevation: 0.0,
                  color: HexColor('333739'),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,

                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: HexColor('333739'),

                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: HexColor('333739'),
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                ),
                textTheme: TextTheme(
                  bodySmall:  TextStyle(
                    color:  Colors.grey,
                    fontSize: 14.0,
                    fontFamily: 'Janna',
                  ),
                  bodyMedium: TextStyle(
                    color: Colors.white,

                  ),
                ),



              ),
              themeMode: NewsCubit.get(context).isDark! ? ThemeMode.dark:ThemeMode.light,
              home: HomeSplashScreen(),
            ),
          );
        },

      ),
    );
  }
}


