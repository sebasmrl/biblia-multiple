class Bible{

  final String version, sigle;
      //{ "genesis": { "1" :{ "1" : "versiculoText"  }}
  final Map<String, dynamic> books;  //Map<String,  Map<String,  Map< String, String> >>

  const Bible({required this.version , required this.sigle, required this.books});

  factory Bible.fromJson( Map<String, dynamic> json ){
    return Bible(
    version: json["version"],
    sigle: json["sigla"],
    books: json["libros"]
  );
  }

  List<String> getBooksAllNames(){
    return books.keys.toList();
  }

  List<String> getOldTestamentBooksNames(){
    return books.keys.toList().sublist(0,39);
  }
  List<String> getNewTestamentBooksNames(){
    return books.keys.toList().sublist(39);
  }

  // { "capitulo1": { "versiculo1": "versiculoTexto" }}
  Map<String,  dynamic> getBook(String bookName){
     final book = books[bookName] ;
     return book!;
  }
  //{ "vesiculo1": "texto versiculo" }
  Map< String, dynamic> getChapter({ required Map<String, dynamic > book, required int chapter}){
    if(chapter < 1 || chapter > book.length ) chapter = 1;
    final  Map<String, dynamic>? chapterMap = book["$chapter"];
     chapterMap?.removeWhere((key, value) =>  (value == "" || value ==" ") ? true: false );
    return chapterMap!;
  }

  String getVerse({ required  Map< String, dynamic>  chapter, required int verse}){
    final String? versumText = chapter['$verse'];
    return versumText!;
  }

  

  String getCite(String bookName, int chapterIndex, int verseIndex){
    final book = getBook(bookName);
    final chapter = getChapter(book: book, chapter: chapterIndex);
    final versum = getVerse(chapter: chapter, verse: verseIndex);
    return versum;
  }

}