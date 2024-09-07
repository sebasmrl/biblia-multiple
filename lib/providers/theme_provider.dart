import 'package:biblia_multiple/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final themeNotiferProvider = StateNotifierProvider<ThemeNotifier, AppTheme>( (ref)=> ThemeNotifier());



class ThemeNotifier extends StateNotifier<AppTheme>{

  ThemeNotifier():super( const AppTheme() );


  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !(state.isDarkMode));
  }

  void changeColorTheme(Color color){
    state = state.copyWith(colorTheme: color);
  }

  void toggleWhiteMenuText(bool isWhiteMenuText){
    state = state.copyWith(isWhiteMenuText: isWhiteMenuText);
  }


}