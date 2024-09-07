import 'package:biblia_multiple/config/router/router.dart';
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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

    return MaterialApp.router(
      title: 'Biblia Multiple',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      routerConfig: appRouter,
    );
  }
}


