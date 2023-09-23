import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_news_app/Layout/Block/Cubit.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../Shared/Components/components.dart';

class SearchScreen extends StatelessWidget {


  var searchController=TextEditingController();
  var index=0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsState>(
        listener: (context,state){},
        builder: (context,state)
        {
          NewsCubit cubit =NewsCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: Text('بـحـث',
                style: TextStyle(
                    fontFamily: 'AlamirBold'
                ),
                ),

              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children:
                  [
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller:searchController ,
                     // keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'بحث في الأخبار',

                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value)
                      {
                        print(value.length);
                        index=value.length;
                        cubit.getSearch(data: value);
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    if(index > 0)
                    Expanded(
                      child: ConditionalBuilder(
                          condition: state is NewsSearchLoadingState,
                          builder: (context)=>LoadingList(context),
                          fallback: (context)=>ConditionalBuilder(
                              condition: cubit.searchList.length>0,
                              builder: (context)=>NewsList(context,cubit.searchList),
                              fallback: (context)=>SizedBox())),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }




}


