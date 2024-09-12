import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme{

  final bool isDarkMode ;
  final bool isWhiteMenuText;
  final Color colorTheme;
 

 const AppTheme({
    this.isDarkMode=false,
    this.colorTheme =const Color.fromARGB(255, 46, 122, 253),
    this.isWhiteMenuText = true
  });


  ThemeData getTheme(){


   
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: isDarkMode ? const Color.fromARGB(255, 19, 19, 34): Colors.white,
      dialogBackgroundColor: isDarkMode ? const Color.fromARGB(255, 19, 19, 34): Colors.white,
      brightness: isDarkMode ? Brightness.dark: Brightness.light,
      colorSchemeSeed: colorTheme,
      appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: isWhiteMenuText ? Colors.white: Colors.black, ),
        titleTextStyle:  TextStyle( 
          fontWeight: FontWeight.bold, 
          fontSize: 21,
          color: isWhiteMenuText ? Colors.white : Colors.black
        ),
        backgroundColor: colorTheme, 
        foregroundColor: isWhiteMenuText ? Colors.white : Colors.black
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 19, 19, 34) : Colors.white
      ),
      tabBarTheme: TabBarTheme(
        labelColor: isWhiteMenuText ? Colors.white : Colors.black,
        indicatorColor: isWhiteMenuText ? Colors.white : Colors.black,
        unselectedLabelColor: isWhiteMenuText ? Colors.white70 : Colors.black,
        labelStyle: const TextStyle( fontWeight: FontWeight.bold, fontSize: 16),
        unselectedLabelStyle:  const TextStyle( fontWeight: FontWeight.normal),

      )
    );
  }

  AppTheme copyWith({ bool? isDarkMode, bool? isWhiteMenuText, Color? colorTheme}){
    return AppTheme(
      isDarkMode: isDarkMode ?? this.isDarkMode, 
      colorTheme: colorTheme ?? this.colorTheme,
      isWhiteMenuText: isWhiteMenuText ?? this.isWhiteMenuText
    );
  }

}