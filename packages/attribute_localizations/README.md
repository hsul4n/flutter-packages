Attribute Localizations delivers a prepeard localizations labels for most used attributes.

# Getting Started

1. Add to your dependencies:

```yaml
dependencies:
  attribute_localization:
    url: git://github.com/hsul4n/flutter-localizations.git
    path: packages/attribute_localization
```

1. Add delegates in your `MaterialApp` widget:

```dart
MaterialApp(
	// ...
	localizationsDelegates: [
		AttributeLocalizations.delegate,
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
	decoration: InputDecoration(
		labelText: AttributeLocalizations.of(context).name,
        // figer out more, AttributeLocalizations.of(context).email, etc..
	),
)

/// ..
```
