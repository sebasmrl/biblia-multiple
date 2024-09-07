/// - Description: Permite evaluar una expresion sin tener en cuenta  mayusculas ni minusculas y/o caracteres especiales. 
/// No se aceptan conindencidencias de cadenas vacias
/// 
/// - Params: 
/// ```dart
///     - required this.inputText,  // Valor que se quiere encontrar en un textContent
///     - caseSensitive=false       // inputText es sensible a mayúsculas y minúsculas
/// ```
/// 
///- Methods: 
///```dart
///     bool hasMatchWithContent({ required String textContent })
/// ```
/// Setters: 
///```dart
///     - inputText( String value)
///     - caseSensitive(bool value)
/// ```
/// 
class SearchMatch{

  late String _inputText;
  late bool _caseSensitive;
  late RegExp _regExp;
 

  SearchMatch({ required String inputText, caseSensitive=false })
  {
    _inputText = inputText;
    _caseSensitive = caseSensitive;
    _regExp = RegExp(r'' + RegExp.escape(_inputText.trim()) + r'', caseSensitive: _caseSensitive);
  }

   

  //public method
  bool hasMatchWithContent({required String textContent}){
    if(textContent.trim().isEmpty) return false;

    textContent = textContent
      // Eliminar símbolos especiales excepto letras con tildes
      .replaceAll(RegExp(r'[^a-zA-Z0-9áéíóúÁÉÍÓÚ\s]'), '') 
      // Reemplazar vocales con tildes por vocales sin tildes
      .replaceAll(RegExp(r'[áÁ]'), 'a') 
      .replaceAll(RegExp(r'[éÉ]'), 'e')
      .replaceAll(RegExp(r'[íÍ]'), 'i')
      .replaceAll(RegExp(r'[óÓ]'), 'o')
      .replaceAll(RegExp(r'[úÚ]'), 'u');

    // evaluate userInput with textContent
    print('input: $_inputText');
    bool insideOnTextContent= _regExp.hasMatch(textContent);
    return insideOnTextContent;
  }


  //Setters
  set caseSensitive(bool value){
    if(_caseSensitive == value) return;
    _caseSensitive = value;
     _regExp= RegExp(r'' + RegExp.escape(_inputText.trim()) + r'', caseSensitive: _caseSensitive);
  }

  set inputText(String value){
    if(value.isEmpty || value == _inputText) return;
    
    _inputText = value;
     _regExp= RegExp(r'' + RegExp.escape(_inputText.trim()) + r'', caseSensitive: _caseSensitive);
  }

  
}




