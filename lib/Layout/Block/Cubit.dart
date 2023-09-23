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

import '../../Moduls/Settings/Setting_Screen.dart';

class NewsCubit extends Cubit<NewsState>
{
  NewsCubit(): super(NewsInitState());

  static NewsCubit get(context)=> BlocProvider.of(context);

  List<Widget> Screens=
  [
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
    SettingScreen(),
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
  List<dynamic> sportsList=[];
  List<dynamic> scienceList=[];
  List<dynamic> searchList=[];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    String path='v2/top-headlines';
    Map<String,dynamic> query={
      'country':'us',
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

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    String path='v2/top-headlines';
    Map<String,dynamic> query={
      'country':'us',
      'category':'sports',
      'apiKey':'e628559e2ddb4665988c49859217ba1a'
    };


    DioHelper.getData(
        path: path,
        query: query
    )
        .then((value)
    {
      sportsList=value.data['articles'];
      emit(NewsGetSportsSuccessState());

    }).catchError((error)
    {
      print('error when get sports  ${error.toString()}');
      emit(NewsGetSportsErrorState());
    });
  }

  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    String path='v2/top-headlines';
    Map<String,dynamic> query={
      'country':'us',
      'category':'science',
      'apiKey':'e628559e2ddb4665988c49859217ba1a'
    };


    DioHelper.getData(
        path: path,
        query: query
    )
        .then((value)
    {
      scienceList=value.data['articles'];
      emit(NewsGetScienceSuccessState());

    }).catchError((error)
    {
      print('error when get science  ${error.toString()}');
      emit(NewsGetScienceErrorState());
    });
  }

  void getSearch({
    required String data,
})
  {
    emit(NewsSearchLoadingState());
    String path='v2/everything';
    Map<String,dynamic> query={
      'q':'${data}',
      'apiKey':'e628559e2ddb4665988c49859217ba1a'
    };


    DioHelper.getData(
        path: path,
        query: query
    )
        .then((value)
    {
      searchList=value.data['articles'];
      emit(NewsSearchSuccessState());

    }).catchError((error)
    {
      print('error when get search  ${error.toString()}');
      emit(NewsSearchErrorState());
    });
  }

   var selectedVal;
  int valueIndex=0;
  void changeStatueType({
    required var value,
  })
  {
    selectedVal=value;
    if (value.toString().length > 6)
    {
      valueIndex=2;
    }
    else
    {
      valueIndex=1;
    }
    emit(NewsChangeDropItemState());
  }

  void initValIndex()
  {
    valueIndex=0;
  }
}