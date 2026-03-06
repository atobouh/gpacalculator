# GPA Calculator (Dart App + Exercises)

## UI Preview

### Beautiful UI (Dart / Flutter)

![Dart UI Empty](docs/screenshots/dart_ui_empty.jpg)
![Dart UI Filled](docs/screenshots/dart_ui_filled.jpg)

### Simpler UI (Kotlin Legacy Screenshot)

![Kotlin UI Empty](docs/screenshots/kotlin_ui_empty.jpg)
![Kotlin UI Filled](docs/screenshots/kotlin_ui_filled.jpg)

## What Is In This Repo

This branch is cleaned to a Dart-only scope for easier review.

- `dart/flutter_gpa_calculator/`
  - Modern Flutter GPA calculator app
  - OOP domain/services + higher-order functions and lambdas
  - CSV import support from the UI
- `exercies/dart/`
  - Exercise 1: Zoo model with inheritance and polymorphism
  - Exercise 2: Network state with sealed classes
  - Exercise 3: Drawable shapes using interfaces
  - `run_all_exercises.dart` to execute all exercises together

## Quick Start

### Flutter App

```powershell
cd "dart/flutter_gpa_calculator"
flutter pub get
flutter run
```

### Exercises

```powershell
dart exercies/dart/run_all_exercises.dart
```

## Review Notes

- Commits are intentionally split into focused units for PR review.
- The Kotlin screenshots are kept as visual comparison only.
