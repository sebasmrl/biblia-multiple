

import 'package:biblia_multiple/shared/bible_versions.dart';

class BibleOptionsSelected{

  final String book;
  final int chapter;
  final int verse;
  final bool newTestamentSelected;
  final BiblesEnum versionSelected;

  const BibleOptionsSelected({this.book="Génesis", this.chapter=1, this.verse=1, this.newTestamentSelected = false, this.versionSelected=BiblesEnum.reinaValera});

  
  BibleOptionsSelected copyWith({String? book, int? chapter, int? verse, bool? newTestamentSelected, BiblesEnum? versionSelected}){
    return BibleOptionsSelected(
      book: book ?? this.book,
      chapter: chapter ?? this.chapter, 
      verse: verse ?? this.verse,
      newTestamentSelected: newTestamentSelected ?? this.newTestamentSelected,
      versionSelected: versionSelected ?? this.versionSelected
    );
    
  }


}