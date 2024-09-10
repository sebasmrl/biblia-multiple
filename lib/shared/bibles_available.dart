

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


//Options for 
const List<Map<String, dynamic>> biblesAvailable =  [
    { "name": "Biblia Reina Valera",
      "filename": "reina_valera_1960",
      "sigla":"RVR",
      "enum": BiblesEnum.reinaValera
    },
    { "name": "Biblia Reina Valera Contemporanea",
      "filename": "reina_valera_contemporanea",
      "sigla":"RVC",
      "enum": BiblesEnum.reinaValeraContemporanea
    },
    { "name": "Nueva Traducción Viviente",
      "filename": "nueva_traduccion_viviente",
      "sigla":"NTV",
      "enum": BiblesEnum.nuevaTraduccionViviente
    },
    { "name": "Nueva Version Internacional",
      "filename": "nueva_version_internacional",
      "sigla":"NVI",
      "enum": BiblesEnum.nuevaVersionInternacional
    },
    { "name": "Traducción al Lenguaje Actual",
      "filename": "traduccion_lenguaje_actual",
      "sigla":"TLA",
      "enum": BiblesEnum.traduccionLenguajeActual
    },
    { "name": "Biblia de las Americas",
      "filename": "biblia_de_las_americas",
      "sigla":"LBLA",
      "enum": BiblesEnum.bibliaDeLasAmericas
    },
    { "name": "Nueva Biblia Latinoamericana de Hoy",
      "filename": "nueva_biblia_latinoamericana_de_hoy",
      "sigla":"NBLH",
      "enum": BiblesEnum.nuevaBibliaLatinoamericanaDeHoy
    },
    { "name": "Palabra de Dios para todos",
      "filename": "palabra_de_dios_para_todos",
      "sigla":"PDT",
      "enum": BiblesEnum.palabraDeDiosParaTodos
    },
    { "name": "Bible King James 2000",
      "filename": "king_james_2000",
      "sigla":"KJ",
      "enum": BiblesEnum.kingJames
    },
    { "name": "Modern King James",
      "filename": "modern_king_james_version",
      "sigla":"MKJ",
      "enum": BiblesEnum.modernKingJames
    },
  ];
