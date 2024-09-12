import 'package:biblia_multiple/shared/bible_versions.dart';

class BibleVersion{

    final String name, filename, acronym; 
    final BiblesEnum enumValue;

    const BibleVersion({ 
      required this.name, 
      required this.filename, 
      required this.acronym, 
      required this.enumValue
    });

  }