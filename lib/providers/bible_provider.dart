




import 'package:biblia_multiple/domain/entities/bible.dart';
import 'package:biblia_multiple/helpers/bible_io.dart';
import 'package:biblia_multiple/shared/bibles_available.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final bibleNotifierProvider = StateNotifierProvider<BibleNotifier, Bible>( (ref) => BibleNotifier() );

class BibleNotifier extends StateNotifier<Bible>{
  BibleNotifier():super(
    Bible.fromJson( 
      BibleIO.stringToJson(
        data: BibleIO.readFileAsString(filename: 'reina_valera_1960', ext: 'json')
  )));


  changeBible(BiblesEnum bible){

    final index = biblesAvailable.indexWhere((mapa) => mapa.containsValue(bible));
    final bibleSelected = biblesAvailable[index]["filename"];

    state = Bible.fromJson( 
        BibleIO.stringToJson(
          data: BibleIO.readFileAsString(filename: bibleSelected, ext: 'json')
        )
    );
  }


}