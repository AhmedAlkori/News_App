import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../Layout/Block/Cubit.dart';
import '../../Layout/Block/States.dart';
import '../../Shared/Components/components.dart';

class SportScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context)
        {
          NewsCubit.get(context).getSports();
          return BlocConsumer<NewsCubit,NewsState>(
            listener: (context,state){},
            builder: (context,state)
            {
              NewsCubit cubit =NewsCubit.get(context);
              return Directionality(
                textDirection: TextDirection.rtl,
                child:ScreenTypeLayout.builder(
                  mobile: (context)=> ConditionalBuilder(
                      condition: cubit.sportsList.length >0,
                      builder: (context)=>NewsList(context,cubit.sportsList),
                      fallback: (context)=>LoadingList(context)),
                  desktop: (context)=> ConditionalBuilder(
                      condition: cubit.sportsList.length >0,
                      builder: (context)=>desktopItem(cubit.sportsList,context),
                      fallback: (context)=>desktopLoadingItem(context)),
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
}
