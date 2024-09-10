
class BibleOptionsSelected{

  final String book;
  final int chapter;
  final int verse;
  final bool newTestamentSelected;

  BibleOptionsSelected({this.book="Génesis", this.chapter=1, this.verse=1, this.newTestamentSelected = false});

  
  BibleOptionsSelected copyWith({String? book, int? chapter, int? verse, bool? newTestamentSelected }){
    return BibleOptionsSelected(
      book: book ?? this.book,
      chapter: chapter ?? this.chapter, 
      verse: verse ?? this.verse,
      newTestamentSelected: newTestamentSelected ?? this.newTestamentSelected
    );
  }


}