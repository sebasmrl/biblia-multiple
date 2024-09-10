import 'package:biblia_multiple/providers/references/scaffold_key.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        actions: [
          IconButton(onPressed: (){
              context.push('/color-selector');
          }, 
          icon: const Icon(Icons.color_lens_outlined))
        ],
        title: const Text('Home')
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.push('/bible-reader');
        },
        child: const Icon(Icons.read_more), 
      ),
    );
  }
}