import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_news_app/Layout/Block/Cubit.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
              child: ConditionalBuilder(
                  condition: cubit.businessList.length >0,
                  builder: (context)=>NewsList(context,cubit.businessList),
                  fallback: (context)=>LoadingList(context))
            );
          },

        );
      }
    );
  }




}


