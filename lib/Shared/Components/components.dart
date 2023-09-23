import 'package:final_news_app/Moduls/WebView/Web_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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

Widget LoadingList(context)=>ListView.separated(
  physics: BouncingScrollPhysics(),
    itemBuilder: (context,index)=>getShimmerLoading(context),
    separatorBuilder: (context,index)=>SizedBox(height: 15,),
    itemCount: 8,
);






Widget MyDivider()=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    color: Colors.grey,
    width: double.infinity,
    height: 2,
  ),
);
Widget NewsItem(context, dynamic model)=>InkWell(
  onTap: ()
  {
   Navigator.push(context, MaterialPageRoute(builder: (context)=>WebScreen(model['url'])));
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
                    Icons.access_time,
                    size: 18,
                    color: Colors.grey[600],
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


Shimmer getShimmerLoading(context)
{
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(8),
            ),

          ),

          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: Colors.white,
                ),

                Spacer(),
                Row(
                  children:
                  [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius:8,

                    ),

                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        // width: double.infinity,
                        height: 10.0,
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}