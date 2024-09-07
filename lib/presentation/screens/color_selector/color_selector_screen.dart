import 'package:biblia_multiple/config/theme/app_theme.dart';
import 'package:biblia_multiple/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorSelectorScreen extends ConsumerWidget {
  const ColorSelectorScreen({super.key});
  static const name = "color_selector_screen";

  @override
  Widget build(BuildContext context, ref) {

    final theme = ref.watch(themeNotiferProvider);

    return 
    Scaffold(
      appBar: AppBar(
        title: const  Center(
          child: Text(
            'Tema', 
            textScaler: TextScaler.linear(1.1),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600), 
          )
        ),
        leading:  IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.arrow_back_rounded)
        ),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(themeNotiferProvider.notifier).toggleDarkMode();
            }, 
            icon: !theme.isDarkMode ? const Icon(Icons.light_mode, size: 27,): const Icon(Icons.dark_mode, size: 27)
          )
        ],
      ),
      body: _ColorSelectorView(theme: theme),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        elevation: 2,
        child: const Icon(Icons.arrow_back_ios_new_outlined),
    ),
    );
    
  }
}

class _ColorSelectorView extends ConsumerWidget {
  const _ColorSelectorView({
    required this.theme,
  });

  final AppTheme theme;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SwitchListTile(
            title: const Text(
              '1. Texto de Menu claro:', 
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              
            ), 
            subtitle: const Text(
              'Intercambia entre blanco y negro como color del texto del menu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)
            ),
            value: theme.isWhiteMenuText, 
            onChanged: (value){  
              ref.read(themeNotiferProvider.notifier).toggleWhiteMenuText(value);
            }
          ), 

          const SizedBox(height: 10,),
          const Divider(), 
          const SizedBox(height: 10,),

          const ListTile( 
            title: Text(
              "2. Color del Tema: ", 
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold), 
            ),
            subtitle: Text(
              'Selecciona el color que deseas mantener como tema de tu aplicacón. \n¡Los cambios son automaticos!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)
              ),

          ),

          const SizedBox(height: 20,),

          SlidePicker(  //HugRing, ColorPicker, MaterialPicker, BlockPicker, SlidePicker (favorito)
            pickerColor: theme.colorTheme, //seleccionado
            //colorModel: ColorModel.rgb,
            showIndicator: true,
            indicatorBorderRadius: BorderRadius.circular(15),
    
            enableAlpha: false,
            indicatorSize: const Size(300,150),
            onColorChanged: (color){
              ref.read(themeNotiferProvider.notifier).changeColorTheme(color);
            },
          ),
          
          const SizedBox(height: 40,)

        ] 

      ),
    );
  }
}