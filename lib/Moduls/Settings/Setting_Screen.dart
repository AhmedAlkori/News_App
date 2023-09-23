import 'package:final_news_app/Layout/Block/Cubit.dart';
import 'package:final_news_app/Layout/Block/States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/components.dart';

class SettingScreen extends StatelessWidget {

  List<String> rdbOptions=['Arabic','English (US)'];
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context)
      {
        NewsCubit.get(context).initValIndex();
        return BlocConsumer<NewsCubit,NewsState>(
          listener: (context,state){},
          builder: (context,state)
          {
            NewsCubit cubit=NewsCubit.get(context);
            return Column(
              children:
              [
                SizedBox(
                  height: 5.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(
                      'نوع الأخبار',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Column(
                      children: rdbOptions.map((e) => RadioListTile(
                        title: Text('${e}'),
                        value: e,
                        groupValue: cubit.selectedVal,
                        activeColor: Colors.green,
                        selectedTileColor: Colors.blue,
                        onChanged: (val)
                        {

                          print(val.toString().length);
                          cubit.changeStatueType(value:val.toString());

                        },
                      )).toList(),

                    ),
                  ],
                ),



                MyDivider(),

                SizedBox(
                  height: 20,
                ),
                if(cubit.valueIndex > 0)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadiusDirectional.circular(8.0)
                  ),
                  child: MaterialButton(
                    elevation: 0.0,
                    onPressed: ()
                    {

                    },
                    child: Text(
                      'حفظ ',
                      style: TextStyle(

                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                      ),
                    ),
                  ),
                ),
              ],
            );
          },

        );
      }
    );



  }
}
