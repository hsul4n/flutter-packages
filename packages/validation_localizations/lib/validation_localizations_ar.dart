
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'validation_localizations.dart';

// ignore_for_file: unnecessary_brace_in_string_interps

/// The translations for Arabic (`ar`).
class ValidationLocalizationsAr extends ValidationLocalizations {
  ValidationLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String accepted(String attribute) {
    return 'يجب أن تقبل ${attribute}';
  }

  @override
  String blank(String attribute) {
    return 'لا يمكن أن يكون محتوى ${attribute} فارغاً';
  }

  @override
  String confirmation(String attribute, String other) {
    return 'محتوى ${attribute} لا يتطابق مع ${other}';
  }

  @override
  String empty(String attribute) {
    return 'لا يمكن أن يكون محتوى ${attribute} فارغاً';
  }

  @override
  String equalTo(String attribute, Object count) {
    return 'يجب أن يساوي طول ${attribute} ${count}';
  }

  @override
  String even(String attribute) {
    return 'يجب أن يكون عدد ${attribute} زوجياً';
  }

  @override
  String exclusion(String attribute) {
    return 'حقل ${attribute} محجوز';
  }

  @override
  String greaterThan(String attribute, Object count) {
    return 'يجب أن يكون عدد ${attribute} أكبر من ${count}';
  }

  @override
  String greaterThanOrEqualTo(String attribute, Object count) {
    return 'يجب أن يكون عدد ${attribute} أكبر أو يساوي ${count}';
  }

  @override
  String inclusion(String attribute) {
    return '${attribute} غير وارد في القائمة';
  }

  @override
  String invalid(String attribute) {
    return 'محتوى ${attribute} غير صالح';
  }

  @override
  String lessThan(String attribute, Object count) {
    return 'يجب أن يكون عدد ${attribute} أصغر من ${count}';
  }

  @override
  String lessThanOrEqualTo(String attribute, Object count) {
    return 'يجب أن يكون عدد ${attribute} أصغر أو  يساوي ${count}';
  }

  @override
  String notANumber(String attribute) {
    return 'يجب أن يكون محتوى ${attribute} رقماً';
  }

  @override
  String notAnInteger(String attribute) {
    return 'يجب أن يكون عدد ${attribute} عدد صحيحاً';
  }

  @override
  String odd(String attribute) {
    return 'يجب أن يكون عدد ${attribute} عدداً فردياً';
  }

  @override
  String otherThan(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      zero: 'طول ${attribute} يجب ألاّ يكون صفر حرف',
      one: 'طول ${attribute} يجب ألاّ يكون حرفاً واحداً',
      two: 'طول ${attribute} يجب ألاّ يكون حرفان',
      few: 'طول ${attribute} يجب ألاّ يكون ${count} أحرف',
      other: 'طول ${attribute} يجب ألاّ يكون ${count} حرفاً',
    );
  }

  @override
  String present(String attribute) {
    return 'يجب ترك حقل ${attribute} فارغاً';
  }

  @override
  String required(String attribute) {
    return '${attribute} يجب ان يحتوي على قيمه';
  }

  @override
  String taken(String attribute) {
    return 'حقل ${attribute} محجوز مسبقاً';
  }

  @override
  String tooLong(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      zero: 'محتوى ${attribute} أطول من اللّازم (الحد الأقصى هو ولا حرف)',
      one: 'محتوى ${attribute} أطول من اللّازم (الحد الأقصى هو حرف واحد)',
      two: 'محتوى ${attribute} أطول من اللّازم (الحد الأقصى هو حرفان)',
      few: 'محتوى ${attribute} أطول من اللّازم (الحد الأقصى هو ${count} حروف)',
      other: 'محتوى ${attribute} أطول من اللّازم (الحد الأقصى هو ${count} حرف)',
    );
  }

  @override
  String tooShort(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      zero: 'محتوى ${attribute} أقصر من اللّازم (الحد الأدنى هو ولا حرف)',
      one: 'محتوى ${attribute} أقصر من اللّازم (الحد الأدنى هو حرف واحد)',
      two: 'محتوى ${attribute} أقصر من اللّازم (الحد الأدنى هو حرفان)',
      few: 'محتوى ${attribute} أقصر من اللّازم (الحد الأدنى هو ${count} حروف)',
      other: 'محتوى ${attribute} أقصر من اللّازم (الحد الأدنى هو ${count} حرف)',
    );
  }

  @override
  String wrongLength(String attribute, int count) {
    return intl.Intl.pluralLogic(
      count,
      locale: localeName,
      zero: 'طول ${attribute} غير مطابق للحد المطلوب (يجب أن يكون ولا حرف)',
      one: 'طول ${attribute} غير مطابق للحد المطلوب (يجب أن يكون حرف واحد)',
      two: 'طول ${attribute} غير مطابق للحد المطلوب (يجب أن يكون حرفان)',
      few: 'طول ${attribute} غير مطابق للحد المطلوب (يجب أن يكون ${count} أحرف)',
      other: 'طول ${attribute} غير مطابق للحد المطلوب (يجب أن يكون ${count} حرف)',
    );
  }
}
