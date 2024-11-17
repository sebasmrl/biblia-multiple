
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';



class ShellScreen extends ConsumerStatefulWidget {
  final Widget child;
  const ShellScreen({super.key, required this.child});

  @override
  ConsumerState<ShellScreen> createState() => _ShellScreenState();
}


class _ShellScreenState extends ConsumerState<ShellScreen> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final theme = ref.read(themeNotiferProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        currentPage = _goToIndexFromRoute(context);
      });
    });

    return Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
            //backgroundColor: Colors.blue,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: const Icon(Icons.home_filled),
                  label: 'Inicio',
                  backgroundColor: theme.colorTheme,
                  tooltip: "Inicio"),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.auto_stories_outlined),
                  label: 'Lectura',
                  activeIcon: const Icon(Icons.auto_stories),
                  backgroundColor: theme.colorTheme,
                  tooltip: "Lectura de la bíblia"),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite_border_outlined),
                  label: 'Favoritos',
                  activeIcon: const Icon(Icons.favorite),
                  backgroundColor: theme.colorTheme,
                  tooltip: "Favoritos"),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search_outlined),
                label: 'Buscar',
                activeIcon: const Icon(Icons.search),
                backgroundColor: theme.colorTheme,
                tooltip: "Buscar versículo"),
            ],
            currentIndex: currentPage,
            showUnselectedLabels: true,
            unselectedItemColor: theme.isWhiteMenuText
                ? Colors.white70
                : const Color.fromARGB(168, 0, 0, 0),
            selectedItemColor:
                theme.isWhiteMenuText ? Colors.white : Colors.black,
            onTap: (value) {
              if(value ==currentPage) return;
              setState(() {
                currentPage = value;
                _goToRouteFromIndex(currentPage, context);
              });
            }));
  }
}

// Helpers
void _goToRouteFromIndex(int indexPage, BuildContext context) {
  switch (indexPage) {
    case 0:
      context.go('/');
      break;
    case 1:
      context.push('/bible-reader');
      break;
    case 2:
      context.push('/bible-version-selector');
      break;
    case 3:
      context.push('/color-selector');
      break;
    default:
      break;
  }
}

int _goToIndexFromRoute(BuildContext context) {
  final currentRoute = GoRouterState.of(context).fullPath;
  int index;
  switch (currentRoute) {
    case '/':
      index = 0;
      break;
    case '/bible-reader':
      index = 1;
      break;
    case '/bible-version-selector':
      index = 2;
      break;
    case '':
      index = 3;
      break;
    default:
      index = 0;
      break;
  }
  return index;
}
