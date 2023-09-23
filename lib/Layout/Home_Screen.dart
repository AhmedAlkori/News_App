import 'package:final_news_app/Layout/Block/Cubit.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:final_news_app/Moduls/Business/Business_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Moduls/Search/Search_Screen.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context)
      {
        return BlocConsumer<NewsCubit,NewsState>(
          listener: (context,state){},
          builder: (context,state)
          {
            NewsCubit cubit=NewsCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                      'أخبار نيوز',
                    style: TextStyle(
                      fontFamily: 'AlamirBold'
                    ),
                  ),
                  actions:
                  [
                    IconButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                        },
                        icon: Icon(Icons.search)
                    ),
                    IconButton(
                        onPressed: ()
                        {
                          cubit.changeMode();
                        },
                        icon: Icon(Icons.brightness_4)
                    ),
                  ],
                ),
                body:  Padding(
                  padding: EdgeInsets.all(8.0),
                  child: cubit.Screens[cubit.currentIndex],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index)
                  {
                    print(index);
                    cubit.changeBottomNavIndex(index);
                  },
                  items:
                  [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.business_outlined),
                      label: 'أقتصاد',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.sports),
                      label: 'رياضة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.science_outlined),
                      label: 'صحة',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'اعدادات',
                    ),
                  ],
                ),
              ),
            );
          },

        );
      },

    );
  }
}
