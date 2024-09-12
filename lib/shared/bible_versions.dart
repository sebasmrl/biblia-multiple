import 'package:biblia_multiple/domain/entities/_bible_version.dart';

enum BiblesEnum{
  reinaValera,
  reinaValeraContemporanea,
  nuevaTraduccionViviente,
  nuevaVersionInternacional,
  traduccionLenguajeActual,
  bibliaDeLasAmericas,
  nuevaBibliaLatinoamericanaDeHoy,
  palabraDeDiosParaTodos,
  kingJames,
  modernKingJames
}
   // <uses-permission android:name="android.permission.INTERNET"/>

//todo: delete after

//Options for 
  List<BibleVersion> bibleVersions =  [

    const BibleVersion(name: "Biblia Reina Valera" , filename: "reina_valera_1960", acronym: "RVR", enumValue: BiblesEnum.reinaValera),
    const BibleVersion(name: "Biblia Reina Valera Contemporanea", filename: "reina_valera_contemporanea", acronym:"RVC" , enumValue: BiblesEnum.reinaValeraContemporanea ),
    const BibleVersion(name: "Nueva Traducción Viviente", filename: "nueva_traduccion_viviente", acronym: "NTV", enumValue: BiblesEnum.nuevaTraduccionViviente),
    const BibleVersion(name: "Nueva Version Internacional", filename: "nueva_version_internacional", acronym: "NVI", enumValue: BiblesEnum.nuevaVersionInternacional),
    const BibleVersion(name: "Traducción al Lenguaje Actual", filename: "traduccion_lenguaje_actual", acronym: "TLA", enumValue: BiblesEnum.traduccionLenguajeActual),
    const BibleVersion(name: "Biblia de las Americas", filename: "biblia_de_las_americas", acronym: "LBLA", enumValue: BiblesEnum.bibliaDeLasAmericas),
    const BibleVersion(name: "Nueva Biblia Latinoamericana de Hoy", filename:"nueva_biblia_latinoamericana_de_hoy" , acronym: "NBLH", enumValue: BiblesEnum.nuevaBibliaLatinoamericanaDeHoy),
    const BibleVersion(name: "Palabra de Dios para todos", filename: "palabra_de_dios_para_todos", acronym: "PDT", enumValue: BiblesEnum.palabraDeDiosParaTodos),
    const BibleVersion(name: "Bible King James 2000", filename: "king_james_2000", acronym: "KJV", enumValue: BiblesEnum.kingJames),
    const BibleVersion(name: "Modern King James", filename: "modern_king_james_version", acronym: "NKJV" , enumValue: BiblesEnum.modernKingJames),
];







  