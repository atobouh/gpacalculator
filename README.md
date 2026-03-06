# GPA Calculator

<p align="center">
  <strong>Modern Dart/Flutter GPA App + OOP Exercises</strong>
</p>

<p align="center">
  <img alt="Dart" src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-UI%20App-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img alt="Architecture" src="https://img.shields.io/badge/Architecture-OOP%20%2B%20HOF-0A7E51?style=for-the-badge" />
  <img alt="Status" src="https://img.shields.io/badge/Status-PR%20Ready-6A1B9A?style=for-the-badge" />
</p>

## UI Preview (Flutter)

<p>
  <img src="docs/screenshots/dart_ui_empty.jpg" alt="Flutter GPA UI Empty" width="230" />
  <img src="docs/screenshots/dart_ui_filled.jpg" alt="Flutter GPA UI Filled" width="230" />
</p>

## Project Scope

This branch is intentionally cleaned for focused review.

- `dart/flutter_gpa_calculator/`: Modern GPA calculator app with polished UI and CSV import.
- `exercies/dart/`: Three Dart exercises (inheritance, sealed classes, interfaces) plus a single runner.

## Core Concepts Implemented

- OOP modeling with dedicated domain classes (`CourseEntry`, `GpaReport`).
- Service-oriented business logic (`GradeParser`, `GpaCalculator`).
- Higher-order functions and lambdas (`map`, `where`, `fold`, sorting/comparators).
- Stateful UI composition with clear separation between UI and logic.

## Run

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

- Commits are intentionally split into small, review-friendly units.
- Kotlin screenshots were removed to keep this README focused on the Dart app.
