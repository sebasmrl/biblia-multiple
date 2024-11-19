import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
  });



  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focusNode = FocusNode(); // colocarlo cuando un elemeto necesita un foco


    //final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30),
    );


    final inputDecoration = InputDecoration(
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        hintText: '   Escribe una frase',
        filled: true,
        alignLabelWithHint: true,
        
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: (){
            final textValue = textController.value.text;
            onValue(textValue);
            textController.clear();
            focusNode.unfocus();
          },)
      );



    return TextFormField(
      onTapOutside: (e){
        focusNode.unfocus();
      },
      textAlignVertical: TextAlignVertical.center,
      focusNode: focusNode,
      controller: textController,
      decoration:  inputDecoration,
      onFieldSubmitted: (value){
        textController.clear();
      
        focusNode.unfocus();
        onValue(value);
      },  
      keyboardType: TextInputType.text ,
      //keyboardType:, //tipo admisible de dato
      /* onChanged: (value){
      }, */
    );
  }
}
