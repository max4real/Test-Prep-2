# test_prep_2 — MVC with GetX & Dio Interceptor

A Flutter application built using the **MVC (Model-View-Controller)** architecture with **GetX** for state management, navigation, and dependency injection.  
The app integrates **Dio** for HTTP networking, using a custom **Interceptor** to manage API authentication tokens.

---

## Setup Instructions

- Flutter SDK - 3.29.0 
- Dart SDK - 3.7.0 

1. Clone the repository
```bash
git clone https://github.com/max4real/Test-Prep-2.git
cd Test-Prep-2
```
2. Install dependencies
```bash
flutter pub get
```

4. Run the app
```bash
flutter run
```

## API Key / Token Setup
This project uses Dio Interceptors to attach tokens to every API request.
1. Configure environment variables
 - Navigate to lib/utli/controller/data_controller.dart 
 - Set your api access token 
 ```bash
  String accessToken = 'yourToken';
 ```   

## Architecture & Design Choices
### MVC + GetX
- Model: Defines data structures, API models, and repositories.
- View: Flutter UI components and screens (Stateless/Stateful widgets).
- Controller: Manages logic, state, and communication between Model and View using GetX Controllers.

### Why GetX?
- Minimal boilerplate and simple reactive state updates.
- Built-in dependency injection and navigation management.
- Lightweight and efficient — no need for extra Provider or Bloc setup.

### Dio for Networking
- Centralized API client with interceptor support.
- Cleaner error handling via onError in interceptors.
- Easily configurable for headers, timeouts, and logging.

### Modular Structure
Each feature (e.g., Home, Popular, Now Showing and Search) is encapsulated in its own folder under modules/, containing:
 1. A View
 2. A Controller
 3. Optional Model 
This promotes scalability and maintainability.

---

## InkDropLoading Widget
A custom Flutter loading animation that mimics the "InkDrop" effect using CustomPainter and AnimationController.
No external animation libraries are required — everything is drawn manually on the canvas.
Path : lib/modules/custom_loading_widget
### Features
 - Smooth ball drop animation with a subtle initial lift.
 - Dual arc fill animates upward from the bottom of the donut track.
 - Seamless looping: drop → arc fill → repeat.
 - Fully customizable size and color.
 - Lightweight and dependency-free.
### Usage
InkDropLoading(
  size: 80, // optional, default is 80
)
### Customization
 - Color of the drop and arcs: via color parameter in _InkDropPainter.
 - Track color: via trackColor parameter in _InkDropPainter.
 - Size: via size property in InkDropLoading.
### How it works
 1. Phase 1: Ball drops from the top to the bottom of a circular track with a smooth initial lift.
 2. Phase 2: Ball disappears and two arcs fill upward from 6 o’clock to meet at 12 o’clock.
 3. The animation loops continuously by resetting the controller after each cycle.

Note: The full animation is divided into two phases:
 1. Ball drop: progress goes from 0 -> dropPhase
    - dropPhase is usually 0.5 -> first half of the animation.
 2. Arc fill: progress goes from dropPhase -> 1.0
    - second half of the animation.
FYI: Double tap on "Now Showing" to preview the InkDrop animation

---

# Build & Release
To build the app for release:
- Android
 ```bash
 - flutter build apk --release
```
- iOS
```bash
flutter build ios --release
```

---

# Flutter Testing Guide

This project includes **Unit Tests** and **Widget Tests** to ensure the stability and correctness of the app’s core logic and UI behavior.  
Testing is implemented using Flutter’s built-in `flutter_test` package and the **GetX** state management system.

---

## Overview

| Test Type | Purpose | Example |
|------------|----------|----------|
| **Unit Test** | Verifies individual classes, functions, and business logic. | `MovieSearchController` behavior |
| **Widget Test** | Verifies widget UI interactions and rendering. | `SearchHeader` component |

---

## Unit and Widget Test Setup Instructions
1. Install dependencies
Make sure you have Flutter and all dev dependencies installed.
```bash
flutter pub get
```
2. Run all tests
```bash
flutter test
```
Note: explore here  test/unit/movie_search_onchange_test.dart and test/widget/search_hearder_widget_test.dart

# Author
Myint Myat Soe
📧 komyintmyatsoe@icloud.com
🔗 [GitHub](https://github.com/max4real)