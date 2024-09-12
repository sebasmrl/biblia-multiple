import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';



class BibleIO{

  

  static convertXmlToString({String path="assets/base", required String filename, required String ext}){
  
    final file = File('$path/$filename.$ext');
    final xmlString = file.readAsStringSync().split('?>')[1];

    RegExp regExpLibro = RegExp(r"<b n='([^']+)'>");
    RegExp regExpCapitulo = RegExp(r"<c n='([^']+)'>");
    RegExp regExpVersiculo = RegExp(r"<v n='([^']+)'>");

    String updatingString = xmlString.replaceAll('"',"'") //algunas versiones traen "" y deben formatearse a comillas simples aquí
      .replaceAll('<bible>','{ \n "libros": { ');

      updatingString = updatingString.replaceAllMapped(regExpLibro, (match) => '"${match.group(1)}": {')
      .replaceAllMapped(regExpCapitulo, (match) => '"${match.group(1)}": {')
      .replaceAllMapped(regExpVersiculo, (match) => '"${match.group(1)}": "');

   updatingString = updatingString
                .replaceAll('</v>', '", ')
                .replaceAll('</c>', '},')
                .replaceAll('</b>', '},')
                .replaceAll('</bible>', '}')
                .replaceAll('  ', ' ')                        //quitar posibles dobles espacio entre versiculos
                .replaceAll(RegExp(r'"\s*\n\s*'), '" ')       //saltos de linea "clave": \salto
                .replaceAll(RegExp(r',\s*\n\s*}'), '\n}');    //quitar de ultima linea de versiculo
                
     //quitar saltos de linea dentro de ""
    String textWitoutBreaks = updatingString.replaceAllMapped(RegExp(r'"[^"]*"'), (match) {
      return match.group(0)!.replaceAll('\n', ' '); 
    });
    return '$textWitoutBreaks } ';
  }

  static void convertStringToFile({required String data, String path='assets/base', required String filename, String ext='txt'})async{
    File file = File('$path/$filename.$ext');
    await file.writeAsString(data);

     // ignore: avoid_print
     print('Archivo JSON creado exitosamente.');
  }



  static Future<String> readFileAsString({String path="assets/base", required String filename, required String ext})async{
      //final file = File('$path/$filename.$ext');
      //final string = file.readAsStringSync();
      //TODO: Implement path_provider with dart:io for all platforms available
    final String response = await rootBundle .loadString('$path/$filename.$ext');
    return response;
  }

  static Map<String, dynamic>  stringToJson({required String data}){
    final jsonObj =  json.decode(data);  //print(jsonObj['libros']['Génesis']["1"]["1"]);
    return jsonObj;
  } 



}