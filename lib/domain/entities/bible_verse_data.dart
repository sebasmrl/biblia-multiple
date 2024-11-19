
class BibleVerseData{
  final String text;
  final String bookName;
  final int chapter;
  final int verse;

  const BibleVerseData({required this.text, required this.bookName, required this.chapter, required this.verse});


  @override
  String toString() {
    
    return "{ bookName:$bookName, chapter: $chapter, verse: $verse, text: $text }";
  }
}