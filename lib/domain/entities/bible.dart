class Bible{

  final String version;
  final String acronym;
  final bool isEmpty;
      //{ "genesis": { "1" :{ "1" : "versiculoText"  }}
  final Map<String, dynamic> books;  //Map<String,  Map<String,  Map< String, String> >>

  const Bible({required this.version , required this.acronym, required this.books, this.isEmpty=true });

  //This replace copyWith
  factory Bible.fromJson( Map<String, dynamic> json ){
    return Bible(
      version: json["version"],
      acronym: json["sigla"],
      books: json["libros"],
      isEmpty: false,
    );
  }


  List<String> getBooksAllNames(){
    return books.keys.toList();
  }

  List<String> getOldTestamentBooksNames(){
    if(books.isEmpty) return List.empty();
    return books.keys.toList().sublist(0,39);
  }
  List<String> getNewTestamentBooksNames(){
    if(books.isEmpty) return List.empty();
    return books.keys.toList().sublist(39);
  }

  // { "capitulo1": { "versiculo1": "versiculoTexto" }}
  Map<String,  dynamic> getBook(String bookName){
    if(bookName.isEmpty) return {};
    if(books.isEmpty) return {};

    final book = books[bookName];
    return book!;
  }

  //{ "vesiculo1": "texto versiculo" }
  Map< String, dynamic> getChapter({ required Map<String, dynamic > book, required int chapter}){
    if(books.isEmpty) return {};
    if(chapter < 1 || chapter > book.length ) chapter = 1;

    final  Map<String, dynamic>? chapterMap = book["$chapter"];
     //causa inconsistencias de .length en this.getBook(). Se debe presentar UI condicionalmente getverse().trim().isEmpty() 
     //chapterMap?.removeWhere((key, value) =>  (value == "" || value ==" ") ? true: false ); 
    return chapterMap!;
  }

  String getVerse({ required  Map< String, dynamic>  chapter, required int verse}){
    if(books.isEmpty) return "";
    if(verse<1 || verse > chapter.length) return "";

    final String? versumText = chapter['$verse'];
    return versumText!;
  }

  

  String getCite({required String bookName, required int chapterIndex, required int verseIndex}){
    if(books.isEmpty) return "";
    
    final book = getBook(bookName);
    final chapter = getChapter(book: book, chapter: chapterIndex);
    final versum = getVerse(chapter: chapter, verse: verseIndex);
    return versum;
  }

}