
import 'package:flutter/material.dart';
import 'package:youtube_news_app/cubit/cubit.dart';

import 'models/models.dart';

Widget articleItem(ArticleModel article, context) => Row(
  children: [
    Container(
        width: 145,
        height: 135,
        decoration: BoxDecoration(
          //color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48), // Image radius
            child: article.urlToImage != null
                ? FadeInImage(
              placeholder: const AssetImage('assets/loading2.gif'),
              image: NetworkImage('${article.urlToImage}'),
              fit: BoxFit.cover,
            )
                : Image.asset('assets/loading2.gif'),
          ),
        )),
    const SizedBox(
      width: 13,
    ),
    Expanded(
      child: Container(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Text('${article.title}',
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 3,
                textDirection: TextDirection.rtl,
                overflow: TextOverflow.ellipsis),
            Text(
              '${article.publishedAt}',
              style: TextStyle(color: Colors.grey[500]),
            )
          ],
        ),
      ),
    )
  ],
);

Widget separatedItem() => Padding(
  padding: const EdgeInsets.symmetric(vertical: 15),
  child: Container(
    height: 1,
    color: Colors.grey[300],
    width: double.infinity,
  ),
);

Widget categoriesRowBuilder(List<String> categories) => SizedBox(
  height: 50,
  child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => categoriesItemBuilder(
          title: categories[index],
          index: index,
          context: context,
          function: () {
            NewsCubit.get(context).changeCategory(index);
          }),
      separatorBuilder: (context, index) => const SizedBox(
        width: 7,
      ),
      itemCount: categories.length),
);

Widget categoriesItemBuilder(
    {required context,
      required String title,
      required int index,
      required void Function() function}) =>
    InkWell(
      onTap: function,
      child:  Container(
        padding:
        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:NewsCubit.get(context).currentIndex == index
                ? Colors.black:Colors.white,
            border: Border.all(width: 1, color: Colors.grey)),
        child: Center(
          child: Text(
            title,
            style:  TextStyle(
                fontSize: 18,
                letterSpacing: 1.1,
                color: NewsCubit.get(context).currentIndex != index
                    ? Colors.grey[600]:Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );