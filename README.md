<h1 align="center">AUVNET Flutter Internship Assessment 🚀</h1>

This repository contains the source code for a simple e-commerce application developed as part of the AUVNET Flutter Internship Task. The application is built using Flutter, adhering to Clean Architecture principles, utilizing the BLoC pattern for state management, Firebase for authentication, and Hive for local storage. The project focuses on delivering a responsive, maintainable, and scalable solution with clean code and comprehensive documentation. 📱💻

# Project Setup and Installation Guide 🛠️

## Prerequisites
* Flutter SDK: Latest stable channel recommended. 🩺
* Dart: Compatible with the Flutter SDK used. 🎯
* IDE: Android Studio, Visual Studio Code, or any IDE with Flutter support. 🖥️
* Firebase Account: Required for authentication setup. 🔥
* Git: For cloning the repository. 🌐
* Hive: For local storage setup. 🗄️



### Installation Steps 🚀
### Clone the Repository 📂:  
  *  git clone https://github.com/OsamaDebsa/AUVNET-Flutter-Internship-Assessment.git
  * cd AUVNET-Flutter-Internship-Assessment


### Install Dependencies 📦: 
Run the following command to install all required packages:
  *  flutter pub get

### Configure Firebase 🔥:
* Create a Firebase project at console.firebase.google.com.
* Add an Android and/or iOS app to your Firebase project and download the google-services.json (for Android) or GoogleService-Info.plist (for iOS).
* Place the configuration file in the appropriate directory:
  * Android: android/app
  * iOS: ios/Runner
* Enable Firebase Authentication in the Firebase console and activate Email/Password sign-in provider.
* Update the android/build.gradle and android/app/build.gradle files to include Firebase dependencies as per the FlutterFire documentation.

### Initialize Hive 🗄️:
#### Hive is used for local storage to cache user preferences and offline data.
* Ensure the Hive initialization is called in the main.dart file before running the app:
  * await Hive.initFlutter();

### Run the Application 🚀:
* Connect a device or start an emulator/simulator.
  * Run the app using:

# Architectural Overview and Rationale 🏗️
## Architecture: Clean Architecture 🧱
The application follows Clean Architecture principles to ensure scalability, maintainability, and testability. The architecture is divided into three main layers:
* Presentation Layer 🖼️:
  * Contains the UI components (widgets) and BLoC classes for state management.
  * Widgets are kept stateless where possible, relying on BLoC to manage state and business logic.
  * Rationale: Separating UI from logic enhances reusability and makes the UI layer easier to test and modify.
* Domain Layer 💡:
  * The core of the application, containing business logic, use cases, entities, and repository interfaces.
  * Use cases encapsulate specific business rules (e.g., user authentication, product retrieval).
  * Entities represent the data models independent of any external framework.
  * Rationale: The domain layer is framework-agnostic, ensuring that business logic remains unaffected by changes in external services or UI frameworks.
* Data Layer 📊:
  * Handles data operations, including interactions with Firebase (for authentication) and Hive (for local storage).
  * Contains repository implementations, data sources (remote and local), and data models specific to external services.
  * Rationale: Isolating data sources allows for easy swapping of backend services (e.g., replacing Firebase with another provider) without affecting the domain or presentation layers.
* State Management: BLoC Pattern 🔄
  * The flutter_bloc package is used to implement the BLoC (Business Logic Component) pattern. 🧩
  * Each feature (e.g., login, register ...) has its own BLoC, handling events and emitting states.
  * The "copy with" approach is used for state mutations to ensure immutability and predictable state transitions.
  * Rationale: BLoC provides a clear separation of concerns, making state management predictable and testable. The "copy with" method ensures that state changes are explicit and maintain immutability, aligning with functional programming principles.
* Firebase Integration 🔥
  * Firebase Authentication: Used exclusively for user management (sign-up, sign-in, sign-out).
  * Rationale: Firebase Authentication provides a secure, scalable, and easy-to-integrate solution for user authentication, reducing the need to build custom authentication logic.
* Local Storage: Hive 🗄️
  * Hive is used for caching user preferences (e.g., theme settings) and offline data (e.g., cached product lists).
  * Hive boxes are initialized at app startup and accessed through repository implementations in the data layer.
  * Rationale: Hive is lightweight, fast, and suitable for Flutter applications, offering a simple key-value store for offline caching without the need for complex database setups like SQLite.
Code Quality ✅
* The codebase adheres to Dart and Flutter best practices, including:
  * Modular code organization with clear separation of concerns. 🗂️
  * Comprehensive comments and documentation for key components. 📝
  * Consistent formatting using dart format. ✨
* Rationale: High code quality improves maintainability, reduces technical debt, and facilitates collaboration in a team environment.
