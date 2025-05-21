export 'src/widgets/image_clip_field.dart';
export 'src/widgets/clip_grid_view.dart';
export 'src/widgets/clip_list_view.dart';
export 'src/widgets/gallery_page.dart';

// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// // Duration for delay before announcement in IOS so that the announcement won't be interrupted.
// const Duration _kIOSAnnouncementDelayDuration = Duration(seconds: 1);

// class Clip extends StatefulWidget {
//   /// Creates a container for form fields.
//   const Clip({
//     super.key,
//     required this.child,
//     this.canPop,
//     this.onPopInvokedWithResult,
//     this.onChanged,
//     AutovalidateMode? autovalidateMode,
//   }) : autovalidateMode = autovalidateMode ?? AutovalidateMode.disabled;

//   /// Returns the [ClipState] of the closest [Form] widget which encloses the
//   /// given context, or null if none is found.
//   ///
//   /// Typical usage is as follows:
//   ///
//   /// ```dart
//   /// ClipState? form = Form.maybeOf(context);
//   /// form?.save();
//   /// ```
//   ///
//   /// Calling this method will create a dependency on the closest [Form] in the
//   /// [context], if there is one.
//   ///
//   /// See also:
//   ///
//   /// * [Form.of], which is similar to this method, but asserts if no [Form]
//   ///   ancestor is found.
//   static ClipState? maybeOf(BuildContext context) {
//     final _ClipScope? scope =
//         context.dependOnInheritedWidgetOfExactType<_ClipScope>();
//     return scope?._clipState;
//   }

//   /// Returns the [ClipState] of the closest [Form] widget which encloses the
//   /// given context.
//   ///
//   /// Typical usage is as follows:
//   ///
//   /// ```dart
//   /// ClipState form = Form.of(context);
//   /// form.save();
//   /// ```
//   ///
//   /// If no [Form] ancestor is found, this will assert in debug mode, and throw
//   /// an exception in release mode.
//   ///
//   /// Calling this method will create a dependency on the closest [Form] in the
//   /// [context].
//   ///
//   /// See also:
//   ///
//   /// * [Form.maybeOf], which is similar to this method, but returns null if no
//   ///   [Form] ancestor is found.
//   static ClipState of(BuildContext context) {
//     final ClipState? formState = maybeOf(context);
//     assert(() {
//       if (formState == null) {
//         throw FlutterError(
//           'Form.of() was called with a context that does not contain a Form widget.\n'
//           'No Form widget ancestor could be found starting from the context that '
//           'was passed to Form.of(). This can happen because you are using a widget '
//           'that looks for a Form ancestor, but no such ancestor exists.\n'
//           'The context used was:\n'
//           '  $context',
//         );
//       }
//       return true;
//     }());
//     return formState!;
//   }

//   /// The widget below this widget in the tree.
//   ///
//   /// This is the root of the widget hierarchy that contains this form.
//   ///
//   /// {@macro flutter.widgets.ProxyWidget.child}
//   final Widget child;

//   /// {@macro flutter.widgets.PopScope.canPop}
//   ///
//   /// {@tool dartpad}
//   /// This sample demonstrates how to use this parameter to show a confirmation
//   /// dialog when a navigation pop would cause form data to be lost.
//   ///
//   /// ** See code in examples/api/lib/widgets/form/form.1.dart **
//   /// {@end-tool}
//   ///
//   /// See also:
//   ///
//   ///  * [onPopInvokedWithResult], which also comes from [PopScope] and is often used in
//   ///    conjunction with this parameter.
//   ///  * [PopScope.canPop], which is what [Form] delegates to internally.
//   final bool? canPop;

//   /// {@macro flutter.widgets.navigator.onPopInvokedWithResult}
//   ///
//   /// {@tool dartpad}
//   /// This sample demonstrates how to use this parameter to show a confirmation
//   /// dialog when a navigation pop would cause form data to be lost.
//   ///
//   /// ** See code in examples/api/lib/widgets/form/form.1.dart **
//   /// {@end-tool}
//   ///
//   /// See also:
//   ///
//   ///  * [canPop], which also comes from [PopScope] and is often used in
//   ///    conjunction with this parameter.
//   ///  * [PopScope.onPopInvokedWithResult], which is what [Form] delegates to internally.
//   final PopInvokedWithResultCallback<Object?>? onPopInvokedWithResult;

//   /// Called when one of the form fields changes.
//   ///
//   /// In addition to this callback being invoked, all the form fields themselves
//   /// will rebuild.
//   final VoidCallback? onChanged;

//   /// Used to enable/disable form fields auto validation and update their error
//   /// text.
//   ///
//   /// {@macro flutter.widgets.FormField.autovalidateMode}
//   final AutovalidateMode autovalidateMode;

//   @override
//   ClipState createState() => ClipState();
// }

// class ClipState extends State<Clip> {
//   int _generation = 0;
//   bool _hasInteractedByUser = false;
//   final Set<ClipFieldState<dynamic>> _fields = <ClipFieldState<dynamic>>{};

//   // Called when a form field has changed. This will cause all form fields
//   // to rebuild, useful if form fields have interdependencies.
//   void _fieldDidChange() {
//     widget.onChanged?.call();

//     _hasInteractedByUser = _fields.any(
//         (ClipFieldState<dynamic> field) => field._hasInteractedByUser.value);
//     _forceRebuild();
//   }

//   void _forceRebuild() {
//     setState(() {
//       ++_generation;
//     });
//   }

//   void _register(ClipFieldState<dynamic> field) {
//     _fields.add(field);
//     if (widget.autovalidateMode == AutovalidateMode.onUnfocus) {
//       field._focusNode.addListener(() => _updateField(field));
//     }
//   }

//   void _unregister(ClipFieldState<dynamic> field) {
//     _fields.remove(field);
//     if (widget.autovalidateMode == AutovalidateMode.onUnfocus) {
//       field._focusNode.removeListener(() => _updateField(field));
//     }
//   }

//   void _updateField(ClipFieldState<dynamic> field) {
//     if (!field._focusNode.hasFocus) {
//       _validate();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (widget.autovalidateMode) {
//       case AutovalidateMode.always:
//         _validate();
//       case AutovalidateMode.onUserInteraction:
//         if (_hasInteractedByUser) {
//           _validate();
//         }
//       case AutovalidateMode.onUnfocus:
//       case AutovalidateMode.disabled:
//         break;
//     }

//     if (widget.canPop != null || (widget.onPopInvokedWithResult) != null) {
//       return PopScope<Object?>(
//         canPop: widget.canPop ?? true,
//         onPopInvokedWithResult: widget.onPopInvokedWithResult,
//         child: _ClipScope(
//           clipState: this,
//           generation: _generation,
//           child: widget.child,
//         ),
//       );
//     }

//     return _ClipScope(
//       clipState: this,
//       generation: _generation,
//       child: widget.child,
//     );
//   }

//   /// Saves every [FormField] that is a descendant of this [Form].
//   void save() {
//     for (final ClipFieldState<dynamic> field in _fields) {
//       field.save();
//     }
//   }

//   /// Resets every [FormField] that is a descendant of this [Form] back to its
//   /// [FormField.initialValue].
//   ///
//   /// The [Form.onChanged] callback will be called.
//   ///
//   /// If the form's [Form.autovalidateMode] property is [AutovalidateMode.always],
//   /// the fields will all be revalidated after being reset.
//   void reset() {
//     for (final ClipFieldState<dynamic> field in _fields) {
//       field.reset();
//     }
//     _hasInteractedByUser = false;
//     _fieldDidChange();
//   }

//   /// Validates every [FormField] that is a descendant of this [Form], and
//   /// returns true if there are no errors.
//   ///
//   /// The form will rebuild to report the results.
//   ///
//   /// See also:
//   ///  * [validateGranularly], which also validates descendant [FormField]s,
//   /// but instead returns a [Set] of fields with errors.
//   bool validate() {
//     _hasInteractedByUser = true;
//     _forceRebuild();
//     return _validate();
//   }

//   /// Validates every [FormField] that is a descendant of this [Form], and
//   /// returns a [Set] of [ClipFieldState] of the invalid field(s) only, if any.
//   ///
//   /// This method can be useful to highlight field(s) with errors.
//   ///
//   /// The form will rebuild to report the results.
//   ///
//   /// See also:
//   ///  * [validate], which also validates descendant [FormField]s,
//   /// and return true if there are no errors.
//   Set<ClipFieldState<Object?>> validateGranularly() {
//     final Set<ClipFieldState<Object?>> invalidFields =
//         <ClipFieldState<Object?>>{};
//     _hasInteractedByUser = true;
//     _forceRebuild();
//     _validate(invalidFields);
//     return invalidFields;
//   }

//   bool _validate([Set<ClipFieldState<Object?>>? invalidFields]) {
//     bool hasError = false;
//     String errorMessage = '';
//     final bool validateOnFocusChange =
//         widget.autovalidateMode == AutovalidateMode.onUnfocus;

//     for (final ClipFieldState<dynamic> field in _fields) {
//       if (!validateOnFocusChange || !field._focusNode.hasFocus) {
//         final bool isFieldValid = field.validate();
//         hasError = !isFieldValid || hasError;
//         errorMessage += field.errorText ?? '';
//         if (invalidFields != null && !isFieldValid) {
//           invalidFields.add(field);
//         }
//       }
//     }

//     if (errorMessage.isNotEmpty) {
//       final TextDirection directionality = Directionality.of(context);
//       if (defaultTargetPlatform == TargetPlatform.iOS) {
//         unawaited(Future<void>(() async {
//           await Future<void>.delayed(_kIOSAnnouncementDelayDuration);
//           SemanticsService.announce(errorMessage, directionality,
//               assertiveness: Assertiveness.assertive);
//         }));
//       } else {
//         SemanticsService.announce(errorMessage, directionality,
//             assertiveness: Assertiveness.assertive);
//       }
//     }

//     return !hasError;
//   }
// }

// class _ClipScope extends InheritedWidget {
//   const _ClipScope({
//     Key? key,
//     required Widget child,
//     required ClipState clipState,
//     required int generation,
//   })  : _clipState = clipState,
//         _generation = generation,
//         super(key: key, child: child);

//   final ClipState _clipState;

//   final int _generation;

//   Clip get clip => _clipState.widget;

//   @override
//   bool updateShouldNotify(_ClipScope old) => _generation != old._generation;
// }

// typedef ClipFieldValidator<T> = String? Function(T? value);

// typedef ClipFieldSetter<T> = void Function(T? newValue);

// typedef ClipFieldBuilder<T> = Widget Function(ClipFieldState<T> clip);

// class ClipField<T> extends StatefulWidget {
//   /// Creates a single form field.
//   const ClipField({
//     super.key,
//     required this.builder,
//     this.onSaved,
//     this.forceErrorText,
//     this.validator,
//     this.initialValue,
//     this.enabled = true,
//     AutovalidateMode? autovalidateMode,
//     this.restorationId,
//   }) : autovalidateMode = autovalidateMode ?? AutovalidateMode.disabled;

//   /// An optional method to call with the final value when the form is saved via
//   /// [ClipState.save].
//   final FormFieldSetter<T>? onSaved;

//   /// An optional property that forces the [ClipFieldState] into an error state
//   /// by directly setting the [ClipFieldState.errorText] property without
//   /// running the validator function.
//   ///
//   /// When the [forceErrorText] property is provided, the [ClipFieldState.errorText]
//   /// will be set to the provided value, causing the form field to be considered
//   /// invalid and to display the error message specified.
//   ///
//   /// When [validator] is provided, [forceErrorText] will override any error that it
//   /// returns. [validator] will not be called unless [forceErrorText] is null.
//   ///
//   /// See also:
//   ///
//   /// * [InputDecoration.errorText], which is used to display error messages in the text
//   /// field's decoration without effecting the field's state. When [forceErrorText] is
//   /// not null, it will override [InputDecoration.errorText] value.
//   final String? forceErrorText;

//   /// An optional method that validates an input. Returns an error string to
//   /// display if the input is invalid, or null otherwise.
//   ///
//   /// The returned value is exposed by the [ClipFieldState.errorText] property.
//   /// The [TextFormField] uses this to override the [InputDecoration.errorText]
//   /// value.
//   ///
//   /// Alternating between error and normal state can cause the height of the
//   /// [TextFormField] to change if no other subtext decoration is set on the
//   /// field. To create a field whose height is fixed regardless of whether or
//   /// not an error is displayed, either wrap the  [TextFormField] in a fixed
//   /// height parent like [SizedBox], or set the [InputDecoration.helperText]
//   /// parameter to a space.
//   final ClipFieldValidator<T>? validator;

//   /// Function that returns the widget representing this form field. It is
//   /// passed the form field state as input, containing the current value and
//   /// validation state of this field.
//   final ClipFieldBuilder<T> builder;

//   /// An optional value to initialize the form field to, or null otherwise.
//   ///
//   /// This is called `value` in the [DropdownButtonFormField] constructor to be
//   /// consistent with [DropdownButton].
//   ///
//   /// The `initialValue` affects the form field's state in two cases:
//   /// 1. When the form field is first built, `initialValue` determines the field's initial state.
//   /// 2. When [ClipFieldState.reset] is called (either directly or by calling
//   ///    [ClipFieldState.reset]), the form field is reset to this `initialValue`.
//   final Future<T?> Function()? initialValue;

//   /// Whether the form is able to receive user input.
//   ///
//   /// Defaults to true. If [autovalidateMode] is not [AutovalidateMode.disabled],
//   /// the field will be auto validated. Likewise, if this field is false, the widget
//   /// will not be validated regardless of [autovalidateMode].
//   final bool enabled;

//   /// Used to enable/disable this form field auto validation and update its
//   /// error text.
//   ///
//   /// {@template flutter.widgets.FormField.autovalidateMode}
//   /// If [AutovalidateMode.onUserInteraction], this FormField will only
//   /// auto-validate after its content changes. If [AutovalidateMode.always], it
//   /// will auto-validate even without user interaction. If
//   /// [AutovalidateMode.disabled], auto-validation will be disabled.
//   ///
//   /// Defaults to [AutovalidateMode.disabled].
//   /// {@endtemplate}
//   final AutovalidateMode autovalidateMode;

//   /// Restoration ID to save and restore the state of the form field.
//   ///
//   /// Setting the restoration ID to a non-null value results in whether or not
//   /// the form field validation persists.
//   ///
//   /// The state of this widget is persisted in a [RestorationBucket] claimed
//   /// from the surrounding [RestorationScope] using the provided restoration ID.
//   ///
//   /// See also:
//   ///
//   ///  * [RestorationManager], which explains how state restoration works in
//   ///    Flutter.
//   final String? restorationId;

//   @override
//   ClipFieldState<T> createState() => ClipFieldState<T>();
// }

// /// The current state of a [ClipField]. Passed to the [ClipFieldBuilder] method
// /// for use in constructing the clip clip's widget.
// class ClipFieldState<T> extends State<ClipField<T>> with RestorationMixin {
//   T? _value;
//   // Marking it as late, so it can be registered
//   // with the value provided by [forceErrorText].
//   late final RestorableStringN _errorText;
//   final RestorableBool _hasInteractedByUser = RestorableBool(false);
//   final FocusNode _focusNode = FocusNode();

//   /// The current value of the form field.
//   T? get value => _value;

//   /// The current validation error returned by the [FormField.validator]
//   /// callback, or the manually provided error message using the
//   /// [FormField.forceErrorText] property.
//   ///
//   /// This property is automatically updated when [validate] is called and the
//   /// [FormField.validator] callback is invoked, or If [FormField.forceErrorText] is set
//   /// directly to a non-null value.
//   String? get errorText => _errorText.value;

//   /// True if this field has any validation errors.
//   bool get hasError => _errorText.value != null;

//   /// Returns true if the user has modified the value of this field.
//   ///
//   /// This only updates to true once [didChange] has been called and resets to
//   /// false when [reset] is called.
//   bool get hasInteractedByUser => _hasInteractedByUser.value;

//   /// True if the current value is valid.
//   ///
//   /// This will not set [errorText] or [hasError] and it will not update
//   /// error display.
//   ///
//   /// See also:
//   ///
//   ///  * [validate], which may update [errorText] and [hasError].
//   ///
//   ///  * [FormField.forceErrorText], which also may update [errorText] and [hasError].
//   bool get isValid =>
//       widget.forceErrorText == null && widget.validator?.call(_value) == null;

//   /// Calls the [FormField]'s onSaved method with the current value.
//   void save() {
//     widget.onSaved?.call(value);
//   }

//   /// Resets the field to its initial value.
//   void reset() {
//     if (widget.initialValue != null) {
//       widget.initialValue!().then((initialValue) {
//         setState(() {
//           _value = initialValue;
//           _hasInteractedByUser.value = false;
//           _errorText.value = null;
//         });
//       }).whenComplete(() {
//         Clip.of(context)._fieldDidChange();
//       });
//     } else {
//       setState(() {
//         _hasInteractedByUser.value = false;
//         _errorText.value = null;
//       });
//     }
//     Clip.maybeOf(context)?._fieldDidChange();
//   }

//   /// Calls [FormField.validator] to set the [errorText] only if [FormField.forceErrorText] is null.
//   /// When [FormField.forceErrorText] is not null, [FormField.validator] will not be called.
//   ///
//   /// Returns true if there were no errors.
//   /// See also:
//   ///
//   ///  * [isValid], which passively gets the validity without setting
//   ///    [errorText] or [hasError].
//   bool validate() {
//     setState(() {
//       _validate();
//     });
//     return !hasError;
//   }

//   void _validate() {
//     if (widget.forceErrorText != null) {
//       _errorText.value = widget.forceErrorText;
//       // Skip validating if error is forced.
//       return;
//     }
//     if (widget.validator != null) {
//       _errorText.value = widget.validator!(_value);
//     } else {
//       _errorText.value = null;
//     }
//   }

//   /// Updates this field's state to the new value. Useful for responding to
//   /// child widget changes, e.g. [Slider]'s [Slider.onChanged] argument.
//   ///
//   /// Triggers the [Form.onChanged] callback and, if [Form.autovalidateMode] is
//   /// [AutovalidateMode.always] or [AutovalidateMode.onUserInteraction],
//   /// revalidates all the fields of the form.
//   void didChange(T? value) {
//     setState(() {
//       _value = value;
//       _hasInteractedByUser.value = true;
//     });
//     Clip.maybeOf(context)?._fieldDidChange();
//   }

//   /// Sets the value associated with this form field.
//   ///
//   /// This method should only be called by subclasses that need to update
//   /// the form field value due to state changes identified during the widget
//   /// build phase, when calling `setState` is prohibited. In all other cases,
//   /// the value should be set by a call to [didChange], which ensures that
//   /// `setState` is called.
//   @protected
//   // ignore: use_setters_to_change_properties, (API predates enforcing the lint)
//   void setValue(T? value) {
//     _value = value;
//   }

//   @override
//   String? get restorationId => widget.restorationId;

//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_errorText, 'error_text');
//     registerForRestoration(_hasInteractedByUser, 'has_interacted_by_user');
//   }

//   @override
//   void deactivate() {
//     Clip.maybeOf(context)?._unregister(this);
//     super.deactivate();
//   }

//   @override
//   void initState() {
//     super.initState();
//     Future.microtask(reset);
//     _errorText = RestorableStringN(widget.forceErrorText);
//   }

//   @override
//   void didUpdateWidget(ClipField<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.forceErrorText != oldWidget.forceErrorText) {
//       _errorText.value = widget.forceErrorText;
//     }
//   }

//   @override
//   void dispose() {
//     _errorText.dispose();
//     _focusNode.dispose();
//     _hasInteractedByUser.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (widget.enabled) {
//       switch (widget.autovalidateMode) {
//         case AutovalidateMode.always:
//           _validate();
//         case AutovalidateMode.onUserInteraction:
//           if (_hasInteractedByUser.value) {
//             _validate();
//           }
//         case AutovalidateMode.onUnfocus:
//         case AutovalidateMode.disabled:
//           break;
//       }
//     }

//     Clip.maybeOf(context)?._register(this);

//     if (Clip.maybeOf(context)?.widget.autovalidateMode ==
//                 AutovalidateMode.onUnfocus &&
//             widget.autovalidateMode != AutovalidateMode.always ||
//         widget.autovalidateMode == AutovalidateMode.onUnfocus) {
//       return Focus(
//         canRequestFocus: false,
//         skipTraversal: true,
//         onFocusChange: (bool value) {
//           if (!value) {
//             setState(() {
//               _validate();
//             });
//           }
//         },
//         focusNode: _focusNode,
//         child: widget.builder(this),
//       );
//     }

//     return widget.builder(this);
//   }
// }
