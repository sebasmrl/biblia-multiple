import 'package:animate_do/animate_do.dart';
import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class BibleChapterView extends ConsumerWidget {
  const BibleChapterView(this.chapterIndex, {super.key});
  final String chapterIndex;

  @override
  Widget build(BuildContext context, ref) {
    final options = ref.watch(bibleOptionsSelectedNotifierProvider);
    final bible = ref.watch(bibleNotifierProvider);
    final book = bible.getBook(options.book);


    final scrollController = ItemScrollController();
    // Ejecuta el scroll después de construir el widget
    WidgetsBinding.instance.addPostFrameCallback((_) {

      //ir a ubicacion especifica
      if (options.verse > 3) {
        scrollController.scrollTo(
          index: options.verse, // Cambia este índice según tu necesidad
          duration: const Duration(milliseconds: 1),
        );
        //reset
        if (int.parse(chapterIndex) != options.chapter && options.verse != 1) {
          ref.read(bibleOptionsSelectedNotifierProvider.notifier).changeVerse(1);
        }
      }
    });


    

    return ScrollablePositionedList.builder(
      //map de capitulos
      itemScrollController: scrollController,
      itemBuilder: (context, index) {
        //map de versiculos

        final verse = bible.getCite(
            bookName: options.book,
            chapterIndex: int.parse(chapterIndex),
            verseIndex: index + 1);
        print(
            "Versiculo creado --- se esperan ${book[chapterIndex].length} impresiones");

        if (verse.trim().isEmpty) {
          return SizedBox(
              height: (index == book[chapterIndex].length)
                  ? 100
                  : 0); //para versiculos vacios
        }
        return ListTile(
          title: FadeIn(child: Text(
            ' ${index + 1}.$verse',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          )),
          contentPadding: EdgeInsets.fromLTRB(
              15, 3, 15, (index == book[chapterIndex].length) ? 130 : 0),
          visualDensity: const VisualDensity(vertical: -4),
          style: ListTileStyle.list,
          onTap: () {
            
          },
          onLongPress: (){
            ref.read(bibleOptionsSelectedNotifierProvider.notifier).changeVerse(index);
          },
        );
      },
      itemCount: book[chapterIndex].length,
    );
  }
}
