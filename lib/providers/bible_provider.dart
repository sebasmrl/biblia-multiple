




import 'package:biblia_multiple/domain/entities/bible.dart';
import 'package:biblia_multiple/helpers/bible_io.dart';
import 'package:biblia_multiple/shared/bibles_availables.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final bibleNotifierProvider = StateNotifierProvider<BibleNotifier, Bible>( (ref) => BibleNotifier() );

class BibleNotifier extends StateNotifier<Bible>{
  BibleNotifier():super(
    Bible.fromJson( 
      BibleIO.stringToJson(
        data: BibleIO.readFileAsString(filename: 'reina_valera_1960', ext: 'json')
  )));


  changeBible(String bibleName){
    
    bool flag =  false;
    for (var bible in biblesAvailables) {
      if(bibleName == bible["name"]){
        flag = true;
        break;
      }
    }
    if(!flag) return;

    state = Bible.fromJson( 
        BibleIO.stringToJson(
          data: BibleIO.readFileAsString(filename: bibleName, ext: 'json')
        )
    );
  }


}