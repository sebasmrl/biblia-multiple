
import 'package:biblia_multiple/domain/entities/bible.dart';
import 'package:biblia_multiple/helpers/bible_io.dart';
import 'package:biblia_multiple/shared/bible_versions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';






final bibleNotifierProvider = StateNotifierProvider<BibleNotifier, Bible>( (ref) => BibleNotifier() );

class BibleNotifier extends StateNotifier<Bible>{
  BibleNotifier():super(
    const Bible(version: "", acronym: "", books: {})
  ){
    _initBibleFromPreferences(BiblesEnum.reinaValera);
  }


  changeBible(BiblesEnum bible)async{

    final index = bibleVersions.indexWhere((version) => version.enumValue == bible);
    final bibleSelected = bibleVersions[index].filename;

    state = Bible.fromJson( 
        BibleIO.stringToJson(
          data: await BibleIO.readFileAsString(filename: bibleSelected, ext: 'json')
        )
    );
  }

  void _initBibleFromPreferences(BiblesEnum bible)async{

    // TODO: Get bibleSelected from localDatabe 
    await changeBible(bible);

  }



}