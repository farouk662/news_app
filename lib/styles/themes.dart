import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() => ThemeData(
    //primaryColor: Colors.orange,

    textTheme: const TextTheme(
        subtitle1: TextStyle(
             fontWeight: FontWeight.w600, color: Colors.black)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black, size: 28),
// backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        //showUnselectedLabels: false,
      //  showSelectedLabels: false,
        unselectedItemColor: Colors.grey
//elevation: 100
// selectedIconTheme: IconThemeData(),
        ));

ThemeData darkTheme() => ThemeData(
    textTheme: const TextTheme(
        subtitle1: TextStyle(
            fontWeight: FontWeight.w600, color: Colors.white)),
    scaffoldBackgroundColor: Colors.grey[800],
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey[800],
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.grey[800],
      elevation: 0.0,
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.w900),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[800], unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,

      selectedItemColor: Colors.black,

      //elevation: 100
      // selectedIconTheme: IconThemeData(),
    )

//          scaffoldBackgroundColor: Colors.grey[700]
    );
