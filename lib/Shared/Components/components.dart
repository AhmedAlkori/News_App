import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NewsList(context,List<dynamic> myList)=>ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>NewsItem(context,myList[index]),
    separatorBuilder: (context,index)=>Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 2,
        color: Colors.grey,
      ),
    ),
    itemCount: myList.length);


Widget NewsItem(context, dynamic model)=>InkWell(
  onTap: ()
  {
    print(model['urlToImage']);
    print('Ahmed');
  },
  child: Container(

    height: 100,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(

            borderRadius: BorderRadiusDirectional.circular(8),

            image: DecorationImage(

                image: NetworkImage('${model['urlToImage']}'),

                fit: BoxFit.contain

            ),

          ),

        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Text(
                '${model['title']}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'AlamirBold',
                  height: 1.5,
                ),
              ),
              Spacer(),
              Row(
                children:
                [
                  Icon(
                    Icons.timer_outlined,
                    size: 20,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${model['publishedAt']}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);