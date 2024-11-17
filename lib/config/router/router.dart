import 'package:biblia_multiple/presentation/screens/screens.dart';
import 'package:biblia_multiple/presentation/screens/shell_screen/shell_screen.dart';
import 'package:biblia_multiple/providers/references/global_keys.dart';
import 'package:go_router/go_router.dart';

final appRouter =
    GoRouter(
      navigatorKey: rootNavigatorKey, 
      initialLocation: '/', 
      routes: [
        ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => ShellScreen(child: child),
          routes: [
              GoRoute(
                path: '/',
                name: HomeScreen.name,
                builder: (context, state) => const HomeScreen(),
              ),
              GoRoute(
                path: '/bible-reader',
                name: BibleReaderScreen.name,
                builder: (context, state) => BibleReaderScreen(),
              ),
              
          ]),

          GoRoute(
            path: '/bible-version-selector',
            name: BibleVersionChooseScreen.name,
            builder: (context, state) => const BibleVersionChooseScreen(),
          ),
          GoRoute(
            path: '/color-selector',
            name: ColorSelectorScreen.name,
            builder: (context, state) => const ColorSelectorScreen(),
          ),
      ]);




 /* GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ), */