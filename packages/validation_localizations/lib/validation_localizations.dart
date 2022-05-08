
import 'dart:async';

// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'validation_localizations_ar.dart';
import 'validation_localizations_en.dart';

/// Callers can lookup localized strings with an instance of ValidationLocalizations returned
/// by `ValidationLocalizations.of(context)`.
///
/// Applications need to include `ValidationLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'lib/validation_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ValidationLocalizations.localizationsDelegates,
///   supportedLocales: ValidationLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
/// be consistent with the languages listed in the ValidationLocalizations.supportedLocales
/// property.
abstract class ValidationLocalizations {
  ValidationLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  // ignore: unused_field
  final String localeName;

  static ValidationLocalizations? of(BuildContext context) {
    return Localizations.of<ValidationLocalizations>(context, ValidationLocalizations);
  }

  static const LocalizationsDelegate<ValidationLocalizations> delegate = _ValidationLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be accepted'**
  String accepted(String attribute);

  /// No description provided for @blank.
  ///
  /// In en, this message translates to:
  /// **'{attribute} can\'t be blank'**
  String blank(String attribute);

  /// No description provided for @confirmation.
  ///
  /// In en, this message translates to:
  /// **'{attribute} doesn\'t match {other}'**
  String confirmation(String attribute, String other);

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'{attribute} can\'t be empty'**
  String empty(String attribute);

  /// No description provided for @equalTo.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be equal to {count}'**
  String equalTo(String attribute, Object count);

  /// No description provided for @even.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be even'**
  String even(String attribute);

  /// No description provided for @exclusion.
  ///
  /// In en, this message translates to:
  /// **'{attribute} is reserved'**
  String exclusion(String attribute);

  /// No description provided for @greaterThan.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be greater than {count}'**
  String greaterThan(String attribute, Object count);

  /// No description provided for @greaterThanOrEqualTo.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be greater than or equal to {count}'**
  String greaterThanOrEqualTo(String attribute, Object count);

  /// No description provided for @inclusion.
  ///
  /// In en, this message translates to:
  /// **'{attribute} is not included in the list'**
  String inclusion(String attribute);

  /// No description provided for @invalid.
  ///
  /// In en, this message translates to:
  /// **'{attribute} is invalid'**
  String invalid(String attribute);

  /// No description provided for @lessThan.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be less than {count}'**
  String lessThan(String attribute, Object count);

  /// No description provided for @lessThanOrEqualTo.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be less than or equal to {count}'**
  String lessThanOrEqualTo(String attribute, Object count);

  /// No description provided for @notANumber.
  ///
  /// In en, this message translates to:
  /// **'{attribute} is not a number'**
  String notANumber(String attribute);

  /// No description provided for @notAnInteger.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be an integer'**
  String notAnInteger(String attribute);

  /// No description provided for @odd.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be odd'**
  String odd(String attribute);

  /// No description provided for @otherThan.
  ///
  /// In en, this message translates to:
  /// **'{count, plural,other{{attribute} must be other than {count}}'**
  String otherThan(String attribute, int count);

  /// No description provided for @present.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must be blank'**
  String present(String attribute);

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'{attribute} must exist'**
  String required(String attribute);

  /// No description provided for @taken.
  ///
  /// In en, this message translates to:
  /// **'{attribute} has already been taken'**
  String taken(String attribute);

  /// No description provided for @tooLong.
  ///
  /// In en, this message translates to:
  /// **'{count, plural,=1{{attribute} is too long (maximum is 1 character)}other{{attribute} is too long (maximum is {count} characters)}'**
  String tooLong(String attribute, int count);

  /// No description provided for @tooShort.
  ///
  /// In en, this message translates to:
  /// **'{count, plural,=1{{attribute} is too short (minimum is 1 character)}other{{attribute} is too short (minimum is {count} characters)}}'**
  String tooShort(String attribute, int count);

  /// No description provided for @wrongLength.
  ///
  /// In en, this message translates to:
  /// **'{count, plural,=1{{attribute} is the wrong length (should be 1 character)}other{{attribute} is the wrong length (should be {count} characters)}}'**
  String wrongLength(String attribute, int count);
}

class _ValidationLocalizationsDelegate extends LocalizationsDelegate<ValidationLocalizations> {
  const _ValidationLocalizationsDelegate();

  @override
  Future<ValidationLocalizations> load(Locale locale) {
    return SynchronousFuture<ValidationLocalizations>(_lookupValidationLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ValidationLocalizationsDelegate old) => false;
}

ValidationLocalizations _lookupValidationLocalizations(Locale locale) {
  


// Lookup logic when only language code is specified.
switch (locale.languageCode) {
  case 'ar': return ValidationLocalizationsAr();
    case 'en': return ValidationLocalizationsEn();
}


  throw FlutterError(
    'ValidationLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
