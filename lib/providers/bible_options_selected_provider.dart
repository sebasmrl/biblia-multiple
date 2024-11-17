

import 'package:biblia_multiple/domain/entities/bible_options_selected.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:biblia_multiple/shared/bible_versions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final bibleOptionsSelectedNotifierProvider = 
  StateNotifierProvider<BibleOptionsSelectedProvider, BibleOptionsSelected>(
    (ref) => BibleOptionsSelectedProvider(ref) 
  );


class BibleOptionsSelectedProvider extends StateNotifier<BibleOptionsSelected>{
  final Ref ref;

   BibleOptionsSelectedProvider(this.ref) :super( const BibleOptionsSelected()){
      final String acronym = ref.read(bibleNotifierProvider).acronym;
      final index = bibleVersions.indexWhere( (bibleItem)=> bibleItem.acronym ==acronym );

      changeBibleVersionSelected(version: bibleVersions[index].enumValue);
   }
  

  

  
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

  void changeBibleVersionSelected({required BiblesEnum version})async {
    state = state.copyWith( versionSelected: version);
  }

}