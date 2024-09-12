import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:biblia_multiple/shared/bible_versions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenuBible extends ConsumerWidget {
  const SideMenuBible({super.key,  required this.scaffoldkey/* , required this.tabController */});
  final GlobalKey<ScaffoldState> scaffoldkey;
  //final TabController tabController;




  @override
  Widget build(BuildContext context, WidgetRef ref ) {
    final bible = ref.watch(bibleNotifierProvider);
    final bibleOptions = ref.watch(bibleOptionsSelectedNotifierProvider);
    final theme = ref.watch(themeNotiferProvider);
    
    final bookNames = (bibleOptions.newTestamentSelected)
            ? bible.getNewTestamentBooksNames()
            : bible.getOldTestamentBooksNames();

    
    

    return NavigationDrawer(
        onDestinationSelected: (value){
          //segun los libros del testamento seleccionar por indice
          ref.read(bibleOptionsSelectedNotifierProvider.notifier).changeBook( bookNames[value] );


          Future<void>.delayed(const Duration(milliseconds: 60), (){
            final TabController tabController = DefaultTabController.of(context);
            tabController.index =0;
            tabController.animateTo(0);
          });
          
          scaffoldkey.currentState?.closeDrawer();
          // controller?.dispose();
        },

        selectedIndex: bookNames.indexOf(bibleOptions.book),
        children: [
           Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Text( 
              bible.version, style: TextStyle( 
                height: .97,
                color: theme.isDarkMode ? Colors.white :theme.getTheme().primaryColor,
                fontWeight: FontWeight.bold, 
                fontSize: 25,
               ),
            )
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text("Testamento")
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ..._testamentButtons(ref)
              ],
            ),
          ),
          const Divider(),

          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text("Libros")
          ),

          ...(bibleOptions.newTestamentSelected) 
          ?
          bible.getNewTestamentBooksNames().map( 
              (value)=>NavigationDrawerDestination(icon: const Icon(Icons.book_rounded), label: Text(value))
          )
          : bible.getOldTestamentBooksNames().map( 
              (value)=>NavigationDrawerDestination(icon: const Icon(Icons.book_rounded), label: Text(value))
          )

        ],
      );
  }
}







List<Widget> _testamentButtons(WidgetRef ref){
    final bibleOptions = ref.watch(bibleOptionsSelectedNotifierProvider);

    void onPressedNew(){
      ref.read(bibleOptionsSelectedNotifierProvider.notifier).selectNewTestament();
    }

    void onPressedOld(){
      ref.read(bibleOptionsSelectedNotifierProvider.notifier).selectOldTestament();
    }


  return (bibleOptions.newTestamentSelected)         
    ? [
        TextButton.icon(  
          icon:const Icon(Icons.my_library_books_rounded),
           onPressed: onPressedOld,
          label:   const Text("Antiguo",
        )),
        FilledButton.icon( 
          icon:const Icon(Icons.my_library_books_outlined), 
          onPressed: onPressedNew,
          label:   const Text("Nuevo",
        )),    
      ]
    : [
        FilledButton.icon(  
          icon:const Icon(Icons.my_library_books_rounded),
           onPressed: onPressedOld,
          label:   const Text("Antiguo",
        )),
        TextButton.icon( 
          icon:const Icon(Icons.my_library_books_outlined), 
          onPressed: onPressedNew,
          label:   const Text("Nuevo",
        )),    
      ];
}
