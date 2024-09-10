




import 'package:biblia_multiple/domain/entities/bible_options_selected.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bibleOptionsSelectedNotifierProvider = 
  StateNotifierProvider<BibleOptionsSelectedProvider, BibleOptionsSelected>(
    (ref) => BibleOptionsSelectedProvider() 
  );


class BibleOptionsSelectedProvider extends StateNotifier<BibleOptionsSelected>{

  BibleOptionsSelectedProvider() :super(BibleOptionsSelected());
  
  
  void changeBook(String  book){
    if(book.isEmpty)return;
    state = state.copyWith(book: book.trim());
  }
  void changeChapter(int chapter){
    if(chapter<1)return;
    state = state.copyWith(chapter: chapter);
  }
  void changeVerse(int verse){
    if(verse<1)return;
    state = state.copyWith(verse: verse );
  }
  
  void selectNewTestament(){
    state = state.copyWith( newTestamentSelected: true);
  }
  
  void selectOldTestament(){
    state = state.copyWith( newTestamentSelected: false);
  }

}