import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class BibleChapterWrapper extends ConsumerWidget {
  ///Deprecated
  const BibleChapterWrapper({super.key, required this.child, required this.chapterIndex, });
  final int chapterIndex;
  final Widget child;

  @override
  Widget build(BuildContext context, ref) {

    final options = ref.watch(bibleOptionsSelectedNotifierProvider);
    final optionsNotifier = ref.read(bibleOptionsSelectedNotifierProvider.notifier);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(options.chapter != chapterIndex ){
       optionsNotifier.changeChapter(chapterIndex);
    }
    });

    return child;
  }
}