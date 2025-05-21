import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'units_localizations_ar.dart';
import 'units_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of UnitsLocalizations
/// returned by `UnitsLocalizations.of(context)`.
///
/// Applications need to include `UnitsLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'lib/units_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: UnitsLocalizations.localizationsDelegates,
///   supportedLocales: UnitsLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the UnitsLocalizations.supportedLocales
/// property.
abstract class UnitsLocalizations {
  UnitsLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static UnitsLocalizations? of(BuildContext context) {
    return Localizations.of<UnitsLocalizations>(context, UnitsLocalizations);
  }

  static const LocalizationsDelegate<UnitsLocalizations> delegate =
      _UnitsLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @knots.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{knots}=1{knot}other{knots}}'**
  String knots(num value);

  /// No description provided for @kilometersPerHours.
  ///
  /// In en, this message translates to:
  /// **'{kilometers} per {hours}'**
  String kilometersPerHours(Object kilometers, Object hours);

  /// No description provided for @milesPerHours.
  ///
  /// In en, this message translates to:
  /// **'{miles} per {hours}'**
  String milesPerHours(Object miles, Object hours);

  /// No description provided for @metersPerSeconds.
  ///
  /// In en, this message translates to:
  /// **'{meters} per {seconds}'**
  String metersPerSeconds(Object meters, Object seconds);

  /// No description provided for @kilometersPerLiters.
  ///
  /// In en, this message translates to:
  /// **'{kilometers} per {liters}'**
  String kilometersPerLiters(Object kilometers, Object liters);

  /// No description provided for @metersPerLiters.
  ///
  /// In en, this message translates to:
  /// **'{meters} per {liters}'**
  String metersPerLiters(Object meters, Object liters);

  /// No description provided for @milesPerImperialGallons.
  ///
  /// In en, this message translates to:
  /// **'{miles} per imperial {gallons}'**
  String milesPerImperialGallons(Object miles, Object gallons);

  /// No description provided for @milesPerUsGallons.
  ///
  /// In en, this message translates to:
  /// **'{miles} per US {gallons}'**
  String milesPerUsGallons(Object miles, Object gallons);

  /// No description provided for @miles.
  ///
  /// In en, this message translates to:
  /// **'{length,plural, =0{miles}=1{mile}other{miles}}'**
  String miles(num length);

  /// No description provided for @inches.
  ///
  /// In en, this message translates to:
  /// **'{length,plural, =0{inches}=1{inche}other{inches}}'**
  String inches(num length);

  /// No description provided for @meters.
  ///
  /// In en, this message translates to:
  /// **'{length,plural, =0{meters}=1{meter}other{meters}}'**
  String meters(num length);

  /// No description provided for @kilometers.
  ///
  /// In en, this message translates to:
  /// **'{length,plural, =0{kilometers}=1{kilometer}other{kilometers}}'**
  String kilometers(num length);

  /// No description provided for @gramsPerMeters.
  ///
  /// In en, this message translates to:
  /// **'{grams} per {meters}'**
  String gramsPerMeters(Object grams, Object meters);

  /// No description provided for @gramsPerMiles.
  ///
  /// In en, this message translates to:
  /// **'{grams} per {miles}'**
  String gramsPerMiles(Object grams, Object miles);

  /// No description provided for @kilogramsPerKilometers.
  ///
  /// In en, this message translates to:
  /// **'{kilograms} per {kilometers}'**
  String kilogramsPerKilometers(Object kilograms, Object kilometers);

  /// No description provided for @kilogramsPerMeters.
  ///
  /// In en, this message translates to:
  /// **'{kilograms} per {meters}'**
  String kilogramsPerMeters(Object kilograms, Object meters);

  /// No description provided for @gramsPerKilometers.
  ///
  /// In en, this message translates to:
  /// **'{grams} per {kilometers}'**
  String gramsPerKilometers(Object grams, Object kilometers);

  /// No description provided for @micrograms.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{micrograms}=1{microgram}other{micrograms}}'**
  String micrograms(num value);

  /// No description provided for @milligrams.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{milligrams}=1{milligram}other{milligrams}}'**
  String milligrams(num value);

  /// No description provided for @grams.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{grams}=1{gram}other{grams}}'**
  String grams(num value);

  /// No description provided for @tons.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{tons}=1{ton}other{tons}}'**
  String tons(num value);

  /// No description provided for @ounce.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{ounces}=1{ounce}other{ounces}}'**
  String ounce(num value);

  /// No description provided for @stone.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{stones}=1{stone}other{stones}}'**
  String stone(num value);

  /// No description provided for @pounds.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{pounds}=1{pound}other{pounds}}'**
  String pounds(num value);

  /// No description provided for @kilograms.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{kilograms}=1{kilogram}other{kilograms}}'**
  String kilograms(num value);

  /// No description provided for @pascals.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{pascal}=1{pascal}other{pascals}}'**
  String pascals(num value);

  /// No description provided for @bars.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{bar}=1{bar}other{bars}}'**
  String bars(num value);

  /// No description provided for @poundForcePerSquareInch.
  ///
  /// In en, this message translates to:
  /// **'{pounds} force per square {inches}'**
  String poundForcePerSquareInch(Object pounds, Object inches);

  /// No description provided for @celsius.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{celsius}=1{celsius}other{celsius}}'**
  String celsius(num value);

  /// No description provided for @fahrenheit.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{fahrenheit}=1{fahrenheit}other{fahrenheit}}'**
  String fahrenheit(num value);

  /// No description provided for @kelvin.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{kelvin}=1{kelvin}other{kelvins}}'**
  String kelvin(num value);

  /// No description provided for @rankine.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{rankine}=1{rankine}other{rankines}}'**
  String rankine(num value);

  /// No description provided for @romer.
  ///
  /// In en, this message translates to:
  /// **'{value,plural, =0{rømer}=1{rømer}other{rømer}}'**
  String romer(num value);

  /// No description provided for @century.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{centuries}=1{century}other{centuries}}'**
  String century(num time);

  /// No description provided for @decade.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{decades}=1{decade}other{decades}}'**
  String decade(num time);

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{year}=1{year}other{years}}'**
  String year(num time);

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{month}=1{month}other{months}}'**
  String month(num time);

  /// No description provided for @monthAbbreviation.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{mo}=1{mo}other{mos}}'**
  String monthAbbreviation(num time);

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{week}=1{week}other{weeks}}'**
  String week(num time);

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{days}=1{day}other{days}}'**
  String day(num time);

  /// No description provided for @hour.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{hours}=1{hour}other{hours}}'**
  String hour(num time);

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{minute}=1{minute}other{minutes}}'**
  String minute(num time);

  /// No description provided for @second.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{seconds}=1{second}other{seconds}}'**
  String second(num time);

  /// No description provided for @millisecond.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{millisecond}=1{millisecond}other{milliseconds}}'**
  String millisecond(num time);

  /// No description provided for @microsecond.
  ///
  /// In en, this message translates to:
  /// **'{time,plural, =0{microsecond}=1{microsecond}other{microseconds}}'**
  String microsecond(num time);

  /// No description provided for @imperialGallonsPerMiles.
  ///
  /// In en, this message translates to:
  /// **'imp {gallons} per {miles}'**
  String imperialGallonsPerMiles(Object gallons, Object miles);

  /// No description provided for @usGallonsPerMiles.
  ///
  /// In en, this message translates to:
  /// **'US {gallons} per {miles}'**
  String usGallonsPerMiles(Object gallons, Object miles);

  /// No description provided for @litersPerMeters.
  ///
  /// In en, this message translates to:
  /// **'{liters} per {meters}'**
  String litersPerMeters(Object liters, Object meters);

  /// No description provided for @litersPerKilometers.
  ///
  /// In en, this message translates to:
  /// **'{liters} per {kilometers}'**
  String litersPerKilometers(Object liters, Object kilometers);

  /// No description provided for @cubicFoot.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{cubic foot}=1{cubic foot}other{cubic foot}}'**
  String cubicFoot(num volume);

  /// No description provided for @cubicInch.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{cubic inch}=1{cubic inch}other{cubic inch}}'**
  String cubicInch(num volume);

  /// No description provided for @cubicMeter.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{cubic meter}=1{cubic meter}other{cubic meter}}'**
  String cubicMeter(num volume);

  /// No description provided for @cup.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{cups}=1{cup}other{cups}}'**
  String cup(num volume);

  /// No description provided for @fluidOunces.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{fluid ounces}=1{fluid ounce}other{fluid ounces}}'**
  String fluidOunces(num volume);

  /// No description provided for @quart.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{quarts}=1{quart}other{quarts}}'**
  String quart(num volume);

  /// No description provided for @pint.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{pint}=1{pint}other{pints}}'**
  String pint(num volume);

  /// No description provided for @tablespoon.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{tablespoon}=1{tablespoon}other{tablespoons}}'**
  String tablespoon(num volume);

  /// No description provided for @teaspoon.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{teaspoon}=1{teaspoon}other{teaspoons}}'**
  String teaspoon(num volume);

  /// No description provided for @gallons.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{gallons}=1{gallon}other{gallons}}'**
  String gallons(num volume);

  /// No description provided for @milliliters.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{milliliters}=1{milliliter}other{milliliters}}'**
  String milliliters(num volume);

  /// No description provided for @liters.
  ///
  /// In en, this message translates to:
  /// **'{volume,plural, =0{liters}=1{liter}other{liters}}'**
  String liters(num volume);
}

class _UnitsLocalizationsDelegate
    extends LocalizationsDelegate<UnitsLocalizations> {
  const _UnitsLocalizationsDelegate();

  @override
  Future<UnitsLocalizations> load(Locale locale) {
    return SynchronousFuture<UnitsLocalizations>(
        lookupUnitsLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_UnitsLocalizationsDelegate old) => false;
}

UnitsLocalizations lookupUnitsLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return UnitsLocalizationsAr();
    case 'en':
      return UnitsLocalizationsEn();
  }

  throw FlutterError(
      'UnitsLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
