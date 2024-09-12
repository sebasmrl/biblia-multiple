
import 'package:biblia_multiple/config/router/router.dart';
import 'package:biblia_multiple/providers/bible_provider.dart';
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

 
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final theme = ref.watch(themeNotiferProvider);
    //colocar una biblia por defecto mediante metodo asincrono del notifier
    //ref.read(bibleNotifierProvider.notifier).changeBible(BiblesEnum.reinaValera); 
    ref.watch(bibleNotifierProvider.notifier); 

    return MaterialApp.router(
      title: 'Biblia Multiple',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      routerConfig: appRouter,
    );
  }
}


