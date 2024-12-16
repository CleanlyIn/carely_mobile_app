// import 'dart:convert';
// import 'package:cleanly/models/language.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';



// class AppLocalizations {
//   final  Locale locale;
//   AppLocalizations( this.locale);



//   static AppLocalizations? of (BuildContext context) =>
//     Localizations.of<AppLocalizations>(context, AppLocalizations);

//   Map<String, String> _localizationValues;

//   Future<AppLocalizations?> load() async {
//     final String jsonStringValues = await rootBundle
//       .loadString('lib/lang/${locale.languageCode}.json');

//     final Map<String, dynamic> mappedJson = json.decode(jsonStringValues) as Map<String, dynamic>;
//     print(json.decode(jsonStringValues));
//     _localizationValues = mappedJson.map((String key, dynamic value) =>
//         MapEntry<String, String>(key, value.toString()));
//   }

//   String? getTranslatedValue(String key) => _localizationValues[key];

//   static const LocalizationsDelegate<AppLocalizations> delegate =
//     _AppLocalizationsDelegate();
// }

// class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) => Language
//     .supportedLanguages.any((Language lang) => lang.languageCode == locale.languageCode);

//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     final AppLocalizations localization = AppLocalizations(locale);
//     await localization.load();
//     return localization;
//   }

//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }