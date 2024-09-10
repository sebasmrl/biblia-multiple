

import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animate_do/animate_do.dart';


class BibleReaderScreen3 extends ConsumerWidget{
  static const name = "bible_reader_screen";
  BibleReaderScreen3({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();
  


  @override
  Widget build(BuildContext context, ref) {
    

    
    final options = ref.watch(bibleOptionsSelectedNotifierProvider);
    final bible = ref.watch(bibleNotifierProvider);

    final book = bible.getBook(options.book);
    final chapter = bible.getChapter(book: book, chapter: options.chapter);

     return DefaultTabController(
      initialIndex:  options.chapter-1,
      length: book.length,
      child: Scaffold(
        key: scaffoldKey,
       
        appBar: AppBar(
          title:  Text(options.book),
          bottom:  TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            indicatorWeight: 1,
            indicatorPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero, 
            labelPadding: const EdgeInsets.only(right: 20, left: 20),
            //indicatorSize: TabBarIndicatorSize.tab,
            
            
            tabs: [
              ...book.keys.map( (value)=> Tab(
                  //icon: const Icon(Icons.cloud_outlined),
                  child: FadeIn(child: Text("Capitulo $value"))
                )
              )
            ],
            
          ),
        ),
         //drawer: SideMenuBible(scaffoldkey: scaffoldKey),
        
        body: TabBarView(
          children: [
            ...book.keys.map( (value)=>ListView.builder(
              itemBuilder: (context, index){
                print(index);
               final verse =  bible.getCite(bookName: options.book, chapterIndex:int.parse(value), verseIndex:index+1);

                //if(verse.isEmpty) return  SizedBox(height: index != chapter.length ? 0:100);
                return ListTile(
                  title: Text(' ${index+1}.$verse', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                  contentPadding: EdgeInsets.fromLTRB(15, 3, 15, index != chapter.length ? 0:0),
                  visualDensity: const VisualDensity(vertical: -4),
                  style: ListTileStyle.list,
                  onTap: (){},
                );
                
              },
              itemCount: 50,
              
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