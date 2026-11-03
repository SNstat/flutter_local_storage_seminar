import 'package:flutter/material.dart';

class ConstantStrings {
  // appbar titles
  static const String crudAppBarTitle = "CRUD operacije (Drift)";
  static const String crossJoinAppBarTitle = "Prirodno spajanje (Drift)";
  static const String hiveAppBarTitle = "Izolirana pohrana (Hive)";

  // drawer titles
  static const String mainDrawerTitle = "Lokalna pohrana u Flutter-u";
  static const String crudDrawerTitle = "CRUD operacije";
  static const String crossJoinDrawerTitle = "Prirodno spajanje";
  static const String hiveDrawerTitle = "Izolirana pohrana";

  // details titles
  static const String addAuthor = "Dodavanje novog autora";
  static const String editAuthor = "Uređivanje autora";
  static const String addBook = "Dodavanje nove knjige";
  static const String editBook = "Uređivanje knjige";

  // controller decorations
  static const String decoFirst = "Ime autora";
  static const String decoLast = "Prezime autora";
  static const String decoTitle = "Naslov knjige";
  static const String decoDesc = "Opis knjige";
  static const String decoPCount = "Broj stranica";
  static const String decoLang = "Jezik";

  //hive labels
  static const String hiveAddEntry = "Dodaj u Hive kutiju";
  static const String hiveKey = "Ključ:";
  static const String hiveValue = "Vrijednost:";


  // misc
  static const String emptySelect = "Nema stavki za prikazati!";
  static const String addBookList = "Dodaj knjigu";
}

class ConstantIcons {
  // drawer icons
  static const IconData crud = Icons.data_array;
  static const IconData crossJoin = Icons.one_x_mobiledata;
  static const IconData hive = Icons.key;

  // crud controls
  static const IconData edit = Icons.edit;
  static const IconData delete = Icons.delete;
  static const IconData floatingAdd = Icons.add;
  static const IconData floatingSave = Icons.save;
}