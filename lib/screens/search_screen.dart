import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    var list = NewsCubit.get(context).searchList;
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                TextFormField(textDirection: TextDirection.rtl,
                  //controller: searchController,
                 // autofocus: true,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    NewsCubit.get(context).search(value);
                    //print(list);
                  },
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'search must not be empty';
                  //   }
                  //   return null;
                  // },
                  decoration:  InputDecoration(
                      hintText: 'Search',
                      //hintTextDirection: TextDirection.l,
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                      suffixIcon: const Icon(Icons.search)),
                ),
                const SizedBox(height: 20,),
                if (NewsCubit.get(context).searchList.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            articleItem(NewsCubit.get(context).searchList[index], context),
                        separatorBuilder: (context, index) => separatedItem(),
                        itemCount: NewsCubit.get(context).searchList.length),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
