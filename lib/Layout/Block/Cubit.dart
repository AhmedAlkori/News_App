import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:final_news_app/Moduls/Business/Business_Screen.dart';
import 'package:final_news_app/Moduls/Science/Science_Screen.dart';
import 'package:final_news_app/Moduls/Sports/Sport_Screen.dart';
import 'package:final_news_app/Shared/Local/Cash_Helper.dart';
import 'package:final_news_app/Shared/Network/Dio_Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState>
{
  NewsCubit(): super(NewsInitState());

  static NewsCubit get(context)=> BlocProvider.of(context);

  List<Widget> Screens=
  [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];
  int currentIndex=0;
  bool isDark=false;

  void changeBottomNavIndex(index)
  {
    currentIndex=index;
    emit(NewsChangeBottomNavIndexState());
  }
  void getMode()
  {
    var getDarkMode=CashHelper.getCash(key: 'isDark');
    if(getDarkMode == null)
      {
        CashHelper.saveCash(key: 'isDark', value: false);
        isDark=false;
      }
    else if(getDarkMode == true)
      {
        isDark=true;
      }
    else
      {
        isDark=false;
      }

  }

  void changeMode()
  {
    isDark= !isDark;
    CashHelper.saveCash(key: 'isDark', value: isDark).then((value)
    {
      emit(NewsChangeModeState());
    }).catchError((error){
      print('some error ocure when change dark mode ${error.toString()}');
    });

  }


  List<dynamic> businessList=[];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    String path='v2/top-headlines';
    Map<String,dynamic> query={
      'country':'eg',
      'category':'business',
      'apiKey':'e628559e2ddb4665988c49859217ba1a'
    };


    DioHelper.getData(
        path: path,
        query: query
    )
        .then((value)
    {
      businessList=value.data['articles'];
      emit(NewsGetBusinessSuccessState());

    }).catchError((error)
    {
      print('error when get business ${error.toString()}');
      emit(NewsGetBusinessErrorState());
    });
  }

}