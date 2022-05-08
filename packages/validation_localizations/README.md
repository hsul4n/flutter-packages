Validation localizations delivers a prepeard localizations labels for most used validations messages.

**We recommend using [_Flutter Validation_](https://github.com/hsul4n/flutter-validation) for the best experience.**

# Getting Started

1. Add to your dependencies:

```yaml
dependencies:
  validation_localization:
    url: git://github.com/hsul4n/flutter-localizations.git
    path: packages/validation_localization
```

1. Add delegates in your `MaterialApp` widget:

```dart
MaterialApp(
	// ...
	localizationsDelegates: [
        AttributeLocalizations.delegate,
		ValidationLocalizations.delegate,
	],
	supportedLocales: [
		const Locale('en'),
		const Locale('ar'),
		/// add other locales for now (en, ar)
	],
	// ...
)
```

2. Use it:

```dart
/// ...

TextFormField(
	validator: (value) {
		if (value.isEmpty) {
			return ValidationLocalizations.of(context).required(
				AttributeLocalizations.of(context).password
			);
		}

		if (value.length < 6) {
			// Password is too short (minimum is 6 characters)}
			return ValidationLocalizations.of(context).minLength(
				AttributeLocalizations.of(context).password,
				6, // count
			);
		}

		return null;
	}
)

/// ..
```
