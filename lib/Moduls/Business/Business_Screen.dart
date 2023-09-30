import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_news_app/Layout/Block/Cubit.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';


import '../../Shared/Components/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context)
      {
        NewsCubit.get(context).getBusiness();
        return BlocConsumer<NewsCubit,NewsState>(
          listener: (context,state){},
          builder: (context,state)
          {
            NewsCubit cubit =NewsCubit.get(context);
            return Directionality(
              textDirection: TextDirection.rtl,
              child:ScreenTypeLayout.builder(
                mobile: (context)=> ConditionalBuilder(
                    condition: cubit.businessList.length >0,
                    builder: (context)=>NewsList(context,cubit.businessList),
                    fallback: (context)=>LoadingList(context)),
                desktop: (context)=> ConditionalBuilder(
                    condition: cubit.businessList.length >0,
                    builder: (context)=>desktopItem(cubit.businessList,context),
                    fallback: (context)=>Center(child: CircularProgressIndicator())),
                breakpoints: ScreenBreakpoints(
                  desktop: 600,
                 tablet: 300,
                    watch: 300),
              ),
            );
          },

        );
      }
    );
  }


Widget desktopItem(List<dynamic> ls,context)=>Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisSize: MainAxisSize.max,
  children:
  [
    Expanded(
      child: Container(
       // width: 500,

          child: NewsList(context, ls)),
    ),
    Expanded(

      child: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(8),
        height: double.infinity,
        child: Text(
          '${ls[NewsCubit.get(context).hoverIndex]['title']}',
          style: TextStyle(
            fontFamily: 'AlamirBold',
          ),
        ),

      ),
    ),
  ],
);


}


