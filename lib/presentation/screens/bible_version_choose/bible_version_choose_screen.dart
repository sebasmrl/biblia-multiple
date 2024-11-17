import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:biblia_multiple/shared/bible_versions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BibleVersionChooseScreen extends ConsumerWidget {
  const BibleVersionChooseScreen({super.key});
  static const name = "bible_version_choose_screen"; 
 

  @override
  Widget build(BuildContext context, ref) {

  final versionSelected = ref.watch(bibleOptionsSelectedNotifierProvider).versionSelected; 
  final isDarkMode = ref.watch(themeNotiferProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Versiones"),
        titleTextStyle: TextStyle( 
          fontWeight: FontWeight.bold, 
          fontSize: 25,
          color: isDarkMode ? Colors.white : Colors.black
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Color de la barra de estado
            statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark // Color de los iconos de la barra de estado
          ),
      ),
    
      body: ListView(
        children: [
          const SizedBox(height: 10,),
          ...bibleVersions.map( (version)=>RadioListTile(
              title: Text(version.name),
              subtitle: Text( version.acronym),
              value:  version.enumValue , 
              groupValue: versionSelected, 
              onChanged: (value)async{
                  ref.read(bibleNotifierProvider.notifier).changeBible(version.enumValue);
                  ref.read(bibleOptionsSelectedNotifierProvider.notifier).changeBibleVersionSelected(version: version.enumValue);
                  context.pop();
                //versionSelected = version.enumValue;
              }
            ))
        ],
      ),
    );
  }
}