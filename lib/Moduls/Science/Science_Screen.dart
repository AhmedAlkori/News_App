import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Layout/Block/Cubit.dart';
import '../../Layout/Block/States.dart';
import '../../Shared/Components/components.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context)
        {
          NewsCubit.get(context).getScience();
          return BlocConsumer<NewsCubit,NewsState>(
            listener: (context,state){},
            builder: (context,state)
            {
              NewsCubit cubit =NewsCubit.get(context);
              return Directionality(
                  textDirection: TextDirection.rtl,
                  child: ConditionalBuilder(
                      condition: cubit.scienceList.length >0,
                      builder: (context)=>NewsList(context,cubit.scienceList),
                      fallback: (context)=>LoadingList(context))
              );
            },

          );
        }
    );
  }
}
