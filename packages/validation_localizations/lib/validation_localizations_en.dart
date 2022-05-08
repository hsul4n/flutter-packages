
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'validation_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for English (`en`).
class ValidationLocalizationsEn extends ValidationLocalizations {
  ValidationLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String accepted(String attribute) {
    return '${attribute} must be accepted';
  }

  @override
  String blank(String attribute) {
    return '${attribute} can\'t be blank';
  }

  @override
  String confirmation(String attribute, String other) {
    return '${attribute} doesn\'t match ${other}';
  }

  @override
  String empty(String attribute) {
    return '${attribute} can\'t be empty';
  }

  @override
  String equalTo(String attribute, Object count) {
    return '${attribute} must be equal to ${count}';
  }

  @override
  String even(String attribute) {
    return '${attribute} must be even';
  }

  @override
  String exclusion(String attribute) {
    return '${attribute} is reserved';
  }

  @override
  String greaterThan(String attribute, Object count) {
    return '${attribute} must be greater than ${count}';
  }

  @override
  String greaterThanOrEqualTo(String attribute, Object count) {
    return '${attribute} must be greater than or equal to ${count}';
  }

  @override
  String inclusion(String attribute) {
    return '${attribute} is not included in the list';
  }

  @override
  String invalid(String attribute) {
    return '${attribute} is invalid';
  }

  @override
  String lessThan(String attribute, Object count) {
    return '${attribute} must be less than ${count}';
  }

  @override
  String lessThanOrEqualTo(String attribute, Object count) {
    return '${attribute} must be less than or equal to ${count}';
  }

  @override
  String notANumber(String attribute) {
    return '${attribute} is not a number';
  }

  @override
  String notAnInteger(String attribute) {
    return '${attribute} must be an integer';
  }

  @override
  String odd(String attribute) {
    return '${attribute} must be odd';
  }

  @override
  String otherThan(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${attribute} must be other than ${count}',
    );
  }

  @override
  String present(String attribute) {
    return '${attribute} must be blank';
  }

  @override
  String required(String attribute) {
    return '${attribute} must exist';
  }

  @override
  String taken(String attribute) {
    return '${attribute} has already been taken';
  }

  @override
  String tooLong(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '${attribute} is too long (maximum is 1 character)',
      other: '${attribute} is too long (maximum is ${count} characters)',
    );
  }

  @override
  String tooShort(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '${attribute} is too short (minimum is 1 character)',
      other: '${attribute} is too short (minimum is ${count} characters)',
    );
  }

  @override
  String wrongLength(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      one: '${attribute} is the wrong length (should be 1 character)',
      other: '${attribute} is the wrong length (should be ${count} characters)',
    );
  }
}
