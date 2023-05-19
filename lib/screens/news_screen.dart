import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_news_app/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:youtube_news_app/models/models.dart';
import 'package:youtube_news_app/screens/search_screen.dart';

import '../cubit/states.dart';
import '../widgets.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(listener: (context, state) {
      // do stuff here based on BlocA's state
    }, builder: (context, state) {
      List<String> categories = NewsCubit.get(context).categories;
      List<ArticleModel> list = NewsCubit.get(context)
          .categoriesList[NewsCubit.get(context).currentIndex];
      return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).changeToDarkMode();
                  },
                  icon: const Icon(Icons.dark_mode_rounded)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SearchScreen()));
                  },
                  icon: const Icon(Icons.search_rounded)),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                categoriesRowBuilder(categories),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: list.isNotEmpty,
                    builder: (context) => ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            articleItem(list[index], context),
                        separatorBuilder: (context, index) => separatedItem(),
                        itemCount: list.length),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ));
    });
  }
}
