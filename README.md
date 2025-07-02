
# 🌍 Chapar Interview Task – Flutter Application
A Flutter-based mobile application built as part of the Chapar interview process. The app follows clean architecture principles with modular and testable code.

## 🛠 Setup & Installation

### Prerequisites
- Flutter SDK
- Dart
- Android Studio / VS Code
- Emulator or real device

### Installation Steps

- Clone the project
```bash
https://github.com/AliEasy/flutter_chapar_interview.git
```
- Install dependencies
```bash
flutter pub get
```
- Generate code
```bash
dart run build_runner build --delete-conflicting-outputs
```
- Generate l10n code
```bash
dart run intl_utils:generate
```

- Run The app

## 🧱 Built With

### Architecture
This project uses **Clean Architecture** to separate responsibilities across layers:

- **Presentation Layer**: Flutter UI + Cubit (Bloc)

- **Domain Layer**: Entities + UseCases (Business Logic)

- **Data Layer**: Repositories + Remote APIs (Dio)

### Key Choices
- **State Management**: Cubit for simple & predictable state handling.

- **Dependency Injection**: injectable + get_it for scalable service location.

- **Data Models & Immutability**: freezed for concise data classes and union types.

- **Networking**: dio for HTTP calls with custom interceptors and error handling.

- **Persistence**: SharedPreferences + FlutterSecureStorage for storing tokens & user data.

- **Localization**: intl with .arb files, supporting multi-language extensibility.

- **Navigation**: AutoRouter for navigating between pages
