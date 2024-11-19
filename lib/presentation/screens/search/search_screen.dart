import 'package:biblia_multiple/domain/entities/bible.dart';
import 'package:biblia_multiple/domain/entities/bible_verse_data.dart';
import 'package:biblia_multiple/helpers/search_match.dart';
import 'package:biblia_multiple/presentation/widgets/message_field_box.dart';
import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:biblia_multiple/providers/search_verses_provider.dart';
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerWidget {
  static const name = "search_screen";
  SearchScreen({super.key});

  final List<BibleVerseData> searchVerses = [];

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeNotiferProvider).isDarkMode;
    final bible = ref.watch(bibleNotifierProvider);
    final searchVerses = ref.watch(searchVersesNotifierProvider);
    print(searchVerses.length);
    final bibleOptionsNotifier = ref.read(bibleOptionsSelectedNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        /*actions: const [SizedBox(width: 30,)], */

        title: const Center(child: Text("Busqueda Avanzada")),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black),
        backgroundColor: Colors.transparent,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // Color de la barra de estado
            statusBarIconBrightness: isDarkMode
                ? Brightness.light
                : Brightness.dark // Color de los iconos de la barra de estado
            ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              //const ListTile(),
              Expanded(
                  child: ListView.builder(
                      itemCount: searchVerses.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            searchVerses[index].text, 
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          subtitle: Text('${searchVerses[index].bookName} ${searchVerses[index].chapter}:${searchVerses[index].verse}', style: TextStyle(fontWeight: FontWeight.bold),),
                          contentPadding: EdgeInsets.fromLTRB(15, 3, 15,
                              (index == searchVerses.length) ? 130 : 0),
                          visualDensity: const VisualDensity(vertical: -4),
                          style: ListTileStyle.list,
                          onTap: (){
                            bibleOptionsNotifier
                              ..changeBook(searchVerses[index].bookName)
                              ..changeChapter(searchVerses[index].chapter)
                              ..changeVerse(searchVerses[index].verse-1);
                            Future.delayed( const Duration(milliseconds: 200), () {
                              context.pop();
                              context.push('/bible-reader');
                            },);
                            
                          },
                        );  
                      })),
              const Gap(2),
              MessageFieldBox(onValue: (value) {
                //final searchVerses = _matches(bible, value);
                ref.read(searchVersesNotifierProvider.notifier).reset();
                if(value.isEmpty) return;
                ref.read(searchVersesNotifierProvider.notifier).add(_matches(bible, value));
              }),
              const Gap(8)
            ],
          ),
        ),
      ),
    );
  }
}

List<BibleVerseData> _matches(Bible bible, String textToSearch) {
  final sm = SearchMatch(inputText: textToSearch);
  List<BibleVerseData> matches = [];

  for (var bookName in bible.getBooksAllNames()) {
    final book = bible.getBook(bookName);

    for (var chapterKey in book.keys) {
      final chapter =
          bible.getChapter(book: book, chapter: int.parse(chapterKey));

      for (var verseKey in chapter.keys) {
        final verse =
            bible.getVerse(chapter: chapter, verse: int.parse(verseKey));
        final isMatch = sm.hasMatchWithContent(textContent: verse);

        if (isMatch) {
          matches.add(BibleVerseData(
              text: verse,
              bookName: bookName,
              chapter: int.parse(chapterKey),
              verse: int.parse(verseKey)));
        }
      }
    }
  }
  return matches;
}
