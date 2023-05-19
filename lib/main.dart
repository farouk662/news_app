import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';
import 'screens/news_screen.dart';
import 'styles/themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isDark, {Key? key}) : super(key: key);
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getNews()
        ..changeToDarkMode(cacheIsDark: isDark),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme(),
            darkTheme: darkTheme(),
            debugShowCheckedModeBanner: false,
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            home:  const Directionality(
              textDirection: TextDirection.ltr,
              child: NewsScreen(),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
