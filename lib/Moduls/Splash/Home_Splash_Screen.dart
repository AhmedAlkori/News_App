
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:final_news_app/Layout/Block/Cubit.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:final_news_app/Layout/Home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSplashScreen extends StatefulWidget {


  @override
  State<HomeSplashScreen> createState() => _HomeSplashScreenState();
}

class _HomeSplashScreenState extends State<HomeSplashScreen> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3),()
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });

  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsState>(
      listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(
          backgroundColor: Colors.deepOrange,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
              [

                SizedBox(
                  height: 10,
                ),

                Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 100),
                      totalRepeatCount: 1,
                      text: ['أخـبـار نـيـوز'],
                      textStyle:  TextStyle(
                        fontSize: 28,
                        fontFamily: 'AlamirBold',
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
