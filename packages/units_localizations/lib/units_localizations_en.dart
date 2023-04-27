import 'package:intl/intl.dart' as intl;

import 'units_localizations.dart';

/// The translations for English (`en`).
class UnitsLocalizationsEn extends UnitsLocalizations {
  UnitsLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String knots(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'knots',
      one: 'knot',
      zero: 'knots',
    );
    return '$_temp0';
  }

  @override
  String kilometersPerHours(Object kilometers, Object hours) {
    return '$kilometers per $hours';
  }

  @override
  String milesPerHours(Object miles, Object hours) {
    return '$miles per $hours';
  }

  @override
  String metersPerSeconds(Object meters, Object seconds) {
    return '$meters per $seconds';
  }

  @override
  String kilometersPerLiters(Object kilometers, Object liters) {
    return '$kilometers per $liters';
  }

  @override
  String metersPerLiters(Object meters, Object liters) {
    return '$meters per $liters';
  }

  @override
  String milesPerImperialGallons(Object miles, Object gallons) {
    return '$miles per imperial $gallons';
  }

  @override
  String milesPerUsGallons(Object miles, Object gallons) {
    return '$miles per US $gallons';
  }

  @override
  String miles(num length) {
    String _temp0 = intl.Intl.pluralLogic(
      length,
      locale: localeName,
      other: 'miles',
      one: 'mile',
      zero: 'miles',
    );
    return '$_temp0';
  }

  @override
  String inches(num length) {
    String _temp0 = intl.Intl.pluralLogic(
      length,
      locale: localeName,
      other: 'inches',
      one: 'inche',
      zero: 'inches',
    );
    return '$_temp0';
  }

  @override
  String meters(num length) {
    String _temp0 = intl.Intl.pluralLogic(
      length,
      locale: localeName,
      other: 'meters',
      one: 'meter',
      zero: 'meters',
    );
    return '$_temp0';
  }

  @override
  String kilometers(num length) {
    String _temp0 = intl.Intl.pluralLogic(
      length,
      locale: localeName,
      other: 'kilometers',
      one: 'kilometer',
      zero: 'kilometers',
    );
    return '$_temp0';
  }

  @override
  String gramsPerMeters(Object grams, Object meters) {
    return '$grams per $meters';
  }

  @override
  String gramsPerMiles(Object grams, Object miles) {
    return '$grams per $miles';
  }

  @override
  String kilogramsPerKilometers(Object kilograms, Object kilometers) {
    return '$kilograms per $kilometers';
  }

  @override
  String kilogramsPerMeters(Object kilograms, Object meters) {
    return '$kilograms per $meters';
  }

  @override
  String gramsPerKilometers(Object grams, Object kilometers) {
    return '$grams per $kilometers';
  }

  @override
  String micrograms(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'micrograms',
      one: 'microgram',
      zero: 'micrograms',
    );
    return '$_temp0';
  }

  @override
  String milligrams(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'milligrams',
      one: 'milligram',
      zero: 'milligrams',
    );
    return '$_temp0';
  }

  @override
  String grams(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'grams',
      one: 'gram',
      zero: 'grams',
    );
    return '$_temp0';
  }

  @override
  String tons(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'tons',
      one: 'ton',
      zero: 'tons',
    );
    return '$_temp0';
  }

  @override
  String ounce(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'ounces',
      one: 'ounce',
      zero: 'ounces',
    );
    return '$_temp0';
  }

  @override
  String stone(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'stones',
      one: 'stone',
      zero: 'stones',
    );
    return '$_temp0';
  }

  @override
  String pounds(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'pounds',
      one: 'pound',
      zero: 'pounds',
    );
    return '$_temp0';
  }

  @override
  String kilograms(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'kilograms',
      one: 'kilogram',
      zero: 'kilograms',
    );
    return '$_temp0';
  }

  @override
  String pascals(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'pascals',
      one: 'pascal',
      zero: 'pascal',
    );
    return '$_temp0';
  }

  @override
  String bars(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'bars',
      one: 'bar',
      zero: 'bar',
    );
    return '$_temp0';
  }

  @override
  String poundForcePerSquareInch(Object pounds, Object inches) {
    return '$pounds force per square $inches';
  }

  @override
  String celsius(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'celsius',
      one: 'celsius',
      zero: 'celsius',
    );
    return '$_temp0';
  }

  @override
  String fahrenheit(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'fahrenheit',
      one: 'fahrenheit',
      zero: 'fahrenheit',
    );
    return '$_temp0';
  }

  @override
  String kelvin(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'kelvins',
      one: 'kelvin',
      zero: 'kelvin',
    );
    return '$_temp0';
  }

  @override
  String rankine(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'rankines',
      one: 'rankine',
      zero: 'rankine',
    );
    return '$_temp0';
  }

  @override
  String romer(num value) {
    String _temp0 = intl.Intl.pluralLogic(
      value,
      locale: localeName,
      other: 'rømer',
      one: 'rømer',
      zero: 'rømer',
    );
    return '$_temp0';
  }

  @override
  String century(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'centuries',
      one: 'century',
      zero: 'centuries',
    );
    return '$_temp0';
  }

  @override
  String decade(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'decades',
      one: 'decade',
      zero: 'decades',
    );
    return '$_temp0';
  }

  @override
  String year(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'years',
      one: 'year',
      zero: 'year',
    );
    return '$_temp0';
  }

  @override
  String month(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'months',
      one: 'month',
      zero: 'month',
    );
    return '$_temp0';
  }

  @override
  String monthAbbreviation(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'mos',
      one: 'mo',
      zero: 'mo',
    );
    return '$_temp0';
  }

  @override
  String week(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'weeks',
      one: 'week',
      zero: 'week',
    );
    return '$_temp0';
  }

  @override
  String day(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'days',
      one: 'day',
      zero: 'days',
    );
    return '$_temp0';
  }

  @override
  String hour(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'hours',
      one: 'hour',
      zero: 'hours',
    );
    return '$_temp0';
  }

  @override
  String minute(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'minutes',
      one: 'minute',
      zero: 'minute',
    );
    return '$_temp0';
  }

  @override
  String second(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'seconds',
      one: 'second',
      zero: 'seconds',
    );
    return '$_temp0';
  }

  @override
  String millisecond(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'milliseconds',
      one: 'millisecond',
      zero: 'millisecond',
    );
    return '$_temp0';
  }

  @override
  String microsecond(num time) {
    String _temp0 = intl.Intl.pluralLogic(
      time,
      locale: localeName,
      other: 'microseconds',
      one: 'microsecond',
      zero: 'microsecond',
    );
    return '$_temp0';
  }

  @override
  String imperialGallonsPerMiles(Object gallons, Object miles) {
    return 'imp $gallons per $miles';
  }

  @override
  String usGallonsPerMiles(Object gallons, Object miles) {
    return 'US $gallons per $miles';
  }

  @override
  String litersPerMeters(Object liters, Object meters) {
    return '$liters per $meters';
  }

  @override
  String litersPerKilometers(Object liters, Object kilometers) {
    return '$liters per $kilometers';
  }

  @override
  String cubicFoot(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'cubic foot',
      one: 'cubic foot',
      zero: 'cubic foot',
    );
    return '$_temp0';
  }

  @override
  String cubicInch(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'cubic inch',
      one: 'cubic inch',
      zero: 'cubic inch',
    );
    return '$_temp0';
  }

  @override
  String cubicMeter(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'cubic meter',
      one: 'cubic meter',
      zero: 'cubic meter',
    );
    return '$_temp0';
  }

  @override
  String cup(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'cups',
      one: 'cup',
      zero: 'cups',
    );
    return '$_temp0';
  }

  @override
  String fluidOunces(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'fluid ounces',
      one: 'fluid ounce',
      zero: 'fluid ounces',
    );
    return '$_temp0';
  }

  @override
  String quart(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'quarts',
      one: 'quart',
      zero: 'quarts',
    );
    return '$_temp0';
  }

  @override
  String pint(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'pints',
      one: 'pint',
      zero: 'pint',
    );
    return '$_temp0';
  }

  @override
  String tablespoon(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'tablespoons',
      one: 'tablespoon',
      zero: 'tablespoon',
    );
    return '$_temp0';
  }

  @override
  String teaspoon(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'teaspoons',
      one: 'teaspoon',
      zero: 'teaspoon',
    );
    return '$_temp0';
  }

  @override
  String gallons(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'gallons',
      one: 'gallon',
      zero: 'gallons',
    );
    return '$_temp0';
  }

  @override
  String milliliters(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'milliliters',
      one: 'milliliter',
      zero: 'milliliters',
    );
    return '$_temp0';
  }

  @override
  String liters(num volume) {
    String _temp0 = intl.Intl.pluralLogic(
      volume,
      locale: localeName,
      other: 'liters',
      one: 'liter',
      zero: 'liters',
    );
    return '$_temp0';
  }
}
