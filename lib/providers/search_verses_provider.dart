

import 'package:biblia_multiple/domain/entities/bible_verse_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final searchVersesNotifierProvider = StateNotifierProvider<SearchVersesNotifier, List<BibleVerseData>>( (ref) => SearchVersesNotifier() );

class SearchVersesNotifier extends StateNotifier<List<BibleVerseData>>{

  SearchVersesNotifier():super ( List<BibleVerseData>.empty( growable: true));

  reset(){
    state = [];
  }

  add(List<BibleVerseData> verses){
    state = verses;
  }

}