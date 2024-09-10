
import 'package:biblia_multiple/presentation/widgets/side_menu_bible.dart';
import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BibleReaderScreen extends ConsumerWidget{
  static const name = "bible_reader_screen";
  BibleReaderScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();
  //final TabController tabController;
  


  @override
  Widget build(BuildContext context, ref) {
    
    final options = ref.watch(bibleOptionsSelectedNotifierProvider);
    final bible = ref.watch(bibleNotifierProvider);

    final book = bible.getBook(options.book);
    //final chapter = bible.getChapter(book: book, chapter: options.chapter); //siempre agarra lo del primero que se hace porque viene de options

    //final TabController tabController = DefaultTabController.of(context);


      return DefaultTabController(
        initialIndex: options.chapter-1,
        length: book.length,
        child: Scaffold(
            key: scaffoldKey,
             drawer: SideMenuBible(scaffoldkey: scaffoldKey),
            appBar: AppBar(
              title:  Text(options.book),
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
                ...book.keys.map( (value)=>ListView.builder(
                  itemBuilder: (context, index){
                   final verse =  bible.getCite(bookName: options.book, chapterIndex:int.parse(value), verseIndex:index+1);
          
                    if(verse.isEmpty) return  SizedBox(height: (index == book[value].length) ? 100 :0);
                    return ListTile(
                      title: Text(' ${index+1}.$verse', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
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


/*
 [
            ...book.keys.map( (value)=>ListView(
              children: [
                ...bible.getChapter(book: book, chapter: int.parse(value) )
                    .values.map( (verse) => 
                    ListTile( 
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      title: Text(verse), 
                      onTap: (){},) ),
                const SizedBox(height: 20,)
              ],
            ))
             
          ],*/