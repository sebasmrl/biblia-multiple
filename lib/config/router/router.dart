import 'package:biblia_multiple/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
final appRouter =  GoRouter(
  routes:[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/bible-reader',
      name: BibleReaderScreen.name,
      builder: (context, state) =>  BibleReaderScreen(),
    ),
    GoRoute(
      path: '/color-selector',
      name: ColorSelectorScreen.name,
      builder: (context, state) => const ColorSelectorScreen(),
    ),
    GoRoute(
      path: '/bible-version-selector',
      name: BibleVersionChooseScreen.name,
      builder: (context, state) => const BibleVersionChooseScreen(),
    ),
  ]
);