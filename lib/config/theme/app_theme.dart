import 'package:flutter/material.dart';

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
    //final  background = ;
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      dialogBackgroundColor: isDarkMode ? Colors.black : Colors.white,
      brightness: isDarkMode ? Brightness.dark: Brightness.light,
      colorSchemeSeed: colorTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorTheme, 
        foregroundColor: isWhiteMenuText ? Colors.white : Colors.black
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: isDarkMode ? Colors.black : Colors.white
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