import 'package:biblia_multiple/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
final appRouter =  GoRouter(
  routes:[
    GoRoute(
      path: '/',
      name: "home",
      builder: (context, state) => const HomeScreen(),
    )
  ]
);