# Unit Converter (Flutter)

A clean, simple unit converter for Android built with **Flutter** and **Provider**.
Ostad — Module 30 assignment.

## Features
- Three categories: **Length**, **Weight**, **Temperature**
- Numeric input field (supports decimals and negative values)
- **From / To** unit dropdowns
- **Swap** button to flip units
- **Real-time** result: updates as you type
- Input validation with a friendly error message

## Conversions
| Category    | Conversions                         |
|-------------|-------------------------------------|
| Length      | Meter ⇄ Kilometer                   |
| Weight      | Gram ⇄ Kilogram                     |
| Temperature | Celsius ⇄ Fahrenheit                |

Example: `10 Kilometer → 10000 Meter`

## State management
[Provider](https://pub.dev/packages/provider): `ConverterProvider` (a `ChangeNotifier`) holds the
selected category, units, and input, and recalculates the result whenever any of them changes.

## Project structure
```
lib/
├── main.dart                      # App entry, Provider setup
├── core/theme/                    # Colors and theme
├── models/                        # Unit + UnitCategory enums
├── logic/conversion_logic.dart    # Pure conversion functions
├── providers/converter_provider.dart
├── screens/converter_screen.dart
└── widgets/                       # Reusable UI pieces
test/                              # Unit + widget tests
```

## Run
```bash
flutter pub get
flutter run
flutter test
```
