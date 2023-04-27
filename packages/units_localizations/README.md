Units Localizations delivers a prepeard localizations labels for most used units.

# Getting Started

1. Add to your dependencies:

```yaml
dependencies:
  units_localization: ^1.0.0
```

1. Add delegates in your `MaterialApp` widget:

```dart
MaterialApp(
	// ...
	localizationsDelegates: [
		UnitsLocalizations.delegate,
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
		labelText: UnitsLocalizations.of(context).miles(0),
        // figer out more, UnitsLocalizations.of(context).inches(100), etc..
	),
)

/// ..
```
