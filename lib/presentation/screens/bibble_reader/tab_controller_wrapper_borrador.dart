
import 'package:biblia_multiple/providers/bible_options_selected_provider.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabControllerWrapper extends ConsumerWidget {
  const TabControllerWrapper({super.key, required this.child});
  final  Widget child;

  @override
  Widget build(BuildContext context, ref) {

    final options = ref.watch(bibleOptionsSelectedNotifierProvider);
    final bible = ref.watch(bibleNotifierProvider);

    final book = bible.getBook(options.book);
    
    return DefaultTabController(
      length: book.length,
      child: child,
    );
  }
}