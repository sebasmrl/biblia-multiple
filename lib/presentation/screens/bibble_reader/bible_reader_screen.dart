
import 'package:biblia_multiple/presentation/screens/bible_version_choose/bible_version_choose_screen.dart';
import 'package:biblia_multiple/presentation/widgets/side_menu_bible.dart';
import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';



class BibleReaderScreen extends ConsumerWidget{
  static const name = "bible_reader_screen";
  BibleReaderScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  //final TabController tabController;
  


  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeNotiferProvider);
    final options = ref.watch(bibleOptionsSelectedNotifierProvider);
    final bible = ref.watch(bibleNotifierProvider);

    final book = bible.getBook(options.book);
    


      return DefaultTabController(
        initialIndex: options.chapter-1,
        length: book.length,
        child: Scaffold(
            key: scaffoldKey,
            drawer: SideMenuBible(scaffoldkey: scaffoldKey),
            appBar: AppBar(
              title:  Text(options.book),
              actions: [ 
                TextButton.icon(
                  label: Text(bible.acronym,),
                  style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(theme.isWhiteMenuText ? Colors.white : Colors.black),
                    foregroundColor: WidgetStatePropertyAll(theme.isWhiteMenuText ? Colors.white : Colors.black),
                  ),
                  onPressed: (){
                  context.pushNamed(BibleVersionChooseScreen.name);
                }, 
                icon: const Icon(Icons.bookmark_rounded))
              ],
              bottom:  TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                indicatorPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero, 
                labelPadding: const EdgeInsets.only(right: 20, left: 20),
                indicatorWeight: 1,
                
                tabs: [
                  ...book.keys.map( (value)=> Tab(
                      //icon: const Icon(Icons.cloud_outlined),
                      child: Text("Capitulo $value")
                    )
                  )
                ],
                
              ),
            ),
            
            body: TabBarView(
              children: [
                ...book.keys.map( (value)=>ListView.builder( //map de capitulos
                  itemBuilder: (context, index){ //map de versiculos 
                   final verse =  bible.getCite(bookName: options.book, chapterIndex:int.parse(value), verseIndex:index+1);
          
                    if(verse.trim().isEmpty) return  SizedBox(height: (index == book[value].length) ? 100 :0); //para versiculos vacios
                    return ListTile(
                      title: FadeIn(child: Text(' ${index+1}.$verse', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),)),
                      contentPadding: EdgeInsets.fromLTRB(15, 3, 15, (index == book[value].length) ? 130:0),
                      visualDensity: const VisualDensity(vertical: -4),
                      style: ListTileStyle.list,
                      onTap: (){},
                    );
                    
                  },
                  itemCount: book[value].length,
                  
                ))
                 
              ],
            ),
          ),
      );
      
    
  }
}


