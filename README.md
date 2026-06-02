<div align="center">

<img src="assets/logo/app-logo.png" width="200" style="border-radius: 24px;" />

# ✦ Productify

### *A premium Product Catalog Application built for the Kodevio Flutter Developer Technical Assessment*

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-%E2%89%A53.41.3-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.11.1-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/Riverpod-v3-E53935?style=for-the-badge)](https://riverpod.dev)
[![Hive](https://img.shields.io/badge/Hive-Local%20DB-FF7043?style=for-the-badge)](https://docs.hivedb.dev)
[![Architecture](https://img.shields.io/badge/Clean%20Architecture-✓-43A047?style=for-the-badge)](#architecture-explanation)
[![CI/CD Pipeline](https://img.shields.io/badge/CI%2FCD%20Headless%20Tests-Passing-brightgreen?style=for-the-badge)](#cicd-setup)

<br/>

> **Productify** is a production-grade Flutter application built to fulfill and exceed all the requirements of the Kodevio Developer Technical Assessment. 
> Featuring clean code principles, full separation of concerns, immersive onboarding, dark/light mode, local persistence, comprehensive testing, and a fully automated headless emulator CI/CD pipeline.

<br/>

[**Download APK**](https://github.com/Noctambulist007/Productify/releases/download/Productify/Productify_v1.0.0.apk) &nbsp;·&nbsp;
[**Watch Demo**](#demo) &nbsp;·&nbsp;
[**Screenshots**](#screenshots) &nbsp;·&nbsp;
[**Setup Instructions**](#project-setup-instructions) &nbsp;·&nbsp;
[**Architecture**](#architecture-explanation) &nbsp;·&nbsp;
[**CI/CD Pipeline**](#cicd-setup)

</div>

---

<br/>

## Objective & Overview
The purpose of this project is to showcase core software engineering practices, Dart/Flutter competencies, API integration, caching strategies, state management, and modern CI/CD operations as requested by the **Kodevio Flutter Developer Technical Assessment**.

* **Assessment Title:** Flutter Developer Technical Assessment
* **Project Title:** Product Catalog Application
* **Estimated Completion Time:** 3 June 2026 before 11:59 PM (Completed ahead of schedule on **2 June 2026**)
* **Submission Recipients:** `abdullah.kodevio@gmail.com` (CC: `ashif.kodevio@gmail.com`)

---

<br/>

## Demo <a name="demo"></a>

<div align="center">

<!-- Video Walkthrough Preview Link -->
[![Watch Full App Walkthrough](https://img.youtube.com/vi/xKfMot06-Uc/maxresdefault.jpg)](https://www.youtube.com/watch?v=xKfMot06-Uc)

<br/>

> **[▶ Watch Full App Walkthrough on YouTube](https://www.youtube.com/watch?v=xKfMot06-Uc)** — Demonstrating dynamic search, favorites persistence, sorting & filters, pull-to-refresh, dark/light mode, and animations.

</div>

---

<br/>

## Screenshots <a name="screenshots"></a>

### Splash & Onboarding

<div align="center">

| Splash Screen | Onboarding Slide 1 | Onboarding Slide 2 | Onboarding Slide 3 | Onboarding Slide 4 |
|:---:|:---:|:---:|:---:|:---:|
| <img src="assets/github_readme/splash_screen.jpg" width="160"/> | <img src="assets/github_readme/onboarding_screen_1.jpg" width="160"/> | <img src="assets/github_readme/onboarding_screen_2.jpg" width="160"/> | <img src="assets/github_readme/onboarding_screen_3.jpg" width="160"/> | <img src="assets/github_readme/onboarding_screen_4.jpg" width="160"/> |

</div>

---

### Home Screen & Search

<div align="center">

| Dark Mode Home | Light Mode Home | Shimmer Loading | Local Search |
|:---:|:---:|:---:|:---:|
| <img src="assets/github_readme/home_screen_dark.jpg" width="200"/> | <img src="assets/github_readme/home_screen_light.jpg" width="200"/> | <img src="assets/github_readme/shimmer_product_loading_view_home_screen.jpg" width="200"/> | <img src="assets/github_readme/search_screen.jpg" width="200"/> |

</div>

---

### Product Detail View

<div align="center">

**Dark Mode Detail**

| Header Information | Specifications & Recommendations |
|:---:|:---:|
| <img src="assets/github_readme/product_detail_screen_dark_1.jpg" width="260"/> | <img src="assets/github_readme/product_detail_screen_dark_2.jpg" width="260"/> |

**Light Mode Detail**

| Header Information | Specifications & Recommendations |
|:---:|:---:|
| <img src="assets/github_readme/product_detail_screen_light_1.jpg" width="260"/> | <img src="assets/github_readme/product_detail_screen_light_2.jpg" width="260"/> |

</div>

---

### Favorites & Filtering

<div align="center">

| Favorites (Dark) | Favorites (Light) | Sorting & Filtering |
|:---:|:---:|:---:|
| <img src="assets/github_readme/favorite_screen_dark.jpg" width="210"/> | <img src="assets/github_readme/favorite_screen_light.jpg" width="210"/> | <img src="assets/github_readme/sort_modal_sheet.jpg" width="210"/> |

</div>

---

<br/>

## Core Requirements & Features Implemented

### 1. Product Listing Screen
- Fetches real-time products asynchronously from [fakestoreapi.com/products](https://fakestoreapi.com/products).
- Displays comprehensive product cards featuring a high-quality product image, full title, price, and color-coded rating reviews.

### 2. Product Details Screen
- Seamless navigation passing immutable entity records.
- Displays full-screen images, descriptions, dynamic tags, categories, reviews, and a **Related Products Carousel** to improve user engagement.
- Features a **Pinch-to-Zoom and Pan** dynamic media viewer.

### 3. Search Functionality
- Optimized local search operating immediately on loaded data.
- Dynamically updates lists in real-time as the user types with zero-lag response.

### 4. Favorites & Persistence
- Allows users to seamlessly add/remove favorites directly from listings or detail views.
- **Robust Local Database Engine**: Built with **Hive** for ultra-fast, local key-value storage. 
- Retains favorite states instantly across full application reboots.

### 5. Loading, Error & Empty Handling
- **Shimmer Effect**: High-performance shimmer placeholder cards simulate layouts beautifully during network operations.
- **Fail-Safe Errors**: Elegant, non-disruptive error overlays with a functional **Retry Button** to easily handle internet or API outages.
- **Empty States**: Contextual empty-screen graphics if query searches return nothing.

### 6. Pull-to-Refresh & Scroll Physics
- Native swipe-to-refresh on catalog feeds triggering automated data fetching.

### 7. Bonus / Premium Extras
- **Dark & Light Mode**: A state-of-the-art system-aware theme featuring curated HSL dark/light palettes.
- **Incremental Pagination**: Feeds are segmented dynamically to improve initial render performance.
- **13/13 VM Test Suite**: Highly structured unit tests running with isolated mock repositories.
- **E2E Integration Testing CI/CD**: Seamless GitHub Actions pipeline using headless emulators.

---

<br/>

## Project Setup Instructions <a name="project-setup-instructions"></a>

### Prerequisites
Before setting up the project, make sure you have the following environments configured locally:
- **Flutter SDK**: `^3.41.3` (Stable channel)
- **Dart SDK**: `^3.11.1`
- **CocoaPods** (Required for iOS targets)

### Setup & Run
Follow these command steps to clone, configure, and launch the application:

```bash
# 1. Clone the repository
git clone https://github.com/Noctambulist007/Productify.git
cd productify

# 2. Fetch dependencies
flutter pub get

# 3. Trigger Code Generators (Freezed + JSON Serializers)
dart run build_runner build --delete-conflicting-outputs

# 4. Launch the application
# For Android/iOS connected devices or emulators
flutter run
```

### Running Tests
We ship a complete, high-quality test suite encompassing domain transformations, state notifier systems, and user preferences:

```bash
# Run the pure Dart VM Unit Tests
flutter test
```

For executing integration tests locally:
```bash
# Run the automated UI Integration Test
flutter test integration_test/app_test.dart
```

---

<br/>

## Architecture Explanation

Productify is built on **Clean Architecture** principles to satisfy strict separation of concerns, solid testability, and high maintainability. The codebase is divided into three distinct layers:

```
lib/
├── data/                          # ── DATA LAYER ──────────────────────────────────
│   ├── datasource/
│   │   ├── local/source/          # Hive database (favorites persistence)
│   │   └── remote/                # Dio client, API calls (fakestoreapi.com)
│   ├── mapper/                    # API DTO Models ➜ Pure Domain Entities
│   └── repository/                # Concrete Repository implementations
│
├── domain/                        # ── DOMAIN LAYER (Pure Dart, Zero Flutter UI) ───
│   ├── model/                     # Core Business Entities
│   ├── repository/                # Abstract contracts defining operations
│   └── usecase/                   # Single-responsibility Use Cases (Interactors)
│
├── presentation/                  # ── PRESENTATION LAYER (Flutter UI & Logic) ─────
│   ├── common/widget/             # Reusable UI components
│   ├── dialog/                    # Custom overlays & dynamic bottom sheets
│   ├── screen/                    # UI Screens (Home, Detail, Favorites, Onboarding)
│   └── theme/                     # Tailored dark/light themes, typography
│
├── di/                            # Modular Dependency Injection (GetIt locator)
├── main.dart                      # Entry Point
└── productify.dart                # MaterialApp & configuration initialization

test/
├── mocks/                         # ── TEST MOCKS & HELPERS (Decoupled & Reusable) ─
│   ├── fake_favorite_repository.dart    # Isolated favorite storage state fake
│   ├── fake_onboarding_repository.dart  # Isolated onboarding status fake
│   ├── fake_product_repository.dart     # Mock network pagination & error simulator
│   └── test_helpers.dart                # Product generation factories & async helpers
│
├── unit/                          # ── UNIT TESTS (Pure Dart VM) ───────────────────
│   ├── model_test.dart                  # Model mapping and entity parsing tests
│   ├── notifier_test.dart               # Splash, Onboarding & Favorite State Notifier tests
│   └── product_notifier_test.dart       # Catalog pagination, search, sort & filter tests
│
└── widget/                        # ── WIDGET TESTS (Flutter UI) ───────────────────
    └── widget_test.dart                 # Dynamic chips, ratings, views & tap integrations
```

### Why Clean Architecture?
1. **Decoupled Layers**: The **Domain** layer does not import Flutter or third-party HTTP clients. It represents core business rules. If we decide to migrate from HTTP to GraphQL, or from Hive to SQLite, we only edit the **Data** layer. The UI remains completely untouched.
2. **Mockability**: Every dependency is represented by an abstract interface in the Domain layer, making it extremely easy to inject fakes/mocks during unit testing.

---

<br/>

## State Management Explanation

Productify uses **Riverpod v3** as its primary state management system. We chose Riverpod because of its reactive nature, compile-time safety, testability, and built-in caching support.

### State Flow Architecture
- **No `setState` in Controllers**: Dynamic UI screens are bound to Riverpod `StateNotifier` or `Notifier` instances. UI widgets dynamically rebuild using `ref.watch()`.
- **State Caching**: Using `keepAlive` annotations, providers cache network responses to avoid redundant fetching. Data is automatically refreshed only when a manual pull-to-refresh is initiated.
- **Dynamic Search & Filters**: The `productUiStateProvider` manages search query filters locally. As the user types, it filters business entities dynamically inside the presenter logic, triggering rapid UI updates.
- **UI State Models**: Clean, freezed-generated union states model `Loading`, `Success`, `Error`, and `Empty` states, which makes rendering UI pages fully declarative and simple.

---

<br/>

## Third-party Packages Used

Productify avoids unnecessary bloat by utilizing a highly curated set of industry-standard libraries:

### Production Dependencies
| Package | Version | Purpose |
|:--------|:-------:|:--------|
| `flutter_riverpod` | `^3.3.1` | Decoupled reactive state management and caching |
| `hive` | `^2.2.3` | Ultra-fast local database for persistence |
| `hive_flutter` | `^1.1.0` | Flutter-specific utilities and listeners for Hive |
| `dio` | `^5.7.0` | Robust HTTP engine with interceptors and timeout options |
| `awesome_dio_interceptor` | `^1.3.0` | Detailed HTTP logs in development console |
| `cached_network_image` | `^3.4.1` | Zero-lag image loading with disk/memory caching |
| `get_it` | `^9.2.1` | Service locator for clean dependency injection |
| `shimmer` | `^3.0.0` | Premium skeleton loading states |
| `flutter_screenutil` | `^5.9.3` | Perfect pixel scaling and responsiveness |
| `flutter_carousel_intro` | `^1.0.13` | Fluid onboarding page carousels |
| `shared_preferences` | `^2.3.5` | Key-value store for simple settings & onboarding flags |
| `freezed_annotation` | `^3.1.0` | Compile-safe state & immutable entity modeling |
| `json_annotation` | `^4.9.0` | JSON serialization configurations |
| `zentoast` | `^0.2.2` | Clean dynamic notifications and alerts |

### Development Dependencies
| Package | Version | Purpose |
|:--------|:-------:|:--------|
| `build_runner` | `^2.4.13` | General code-generation compiler |
| `freezed` | `^3.2.5` | High-quality immutable state generation |
| `json_serializable` | `^6.9.4` | Boilerplate-free DTO deserialization generator |
| `flutter_test` | `sdk` | Pure Dart unit and widget testing library |

---

<br/>

## CI/CD Setup <a name="cicd-setup"></a>

We have added a fully automated **GitHub Actions** CI/CD pipeline configured at `.github/workflows/integration_test.yml` to run our end-to-end user tests automatically on every code integration.

```yaml
# Pipeline Highlights:
- Runs on: ubuntu-latest (native hardware KVM support enabled)
- Sets up Java 17 and Flutter 3.41.3
- Implements Gradle and Pub Package caching
- Pre-compiles the debug APK to accelerate step execution
- Spawns a headless Android Emulator (API 29) to run the full UI test:
  cmd: flutter test integration_test/app_test.dart
```

This guarantees that any push or pull request to the `main`, `master`, or `develop` branches is fully validated against regression.

---

<br/>

## Submission Info
- **GitHub Repository**: [github.com/Noctambulist007/Productify](https://github.com/Noctambulist007/Productify)
- **APK Download**: [Download v1.0.0 Stable APK](https://github.com/Noctambulist007/Productify/releases/download/Productify/Productify_v1.0.0.apk)
- **Email Submission Address**: `abdullah.kodevio@gmail.com`
- **CC Submission Address**: `ashif.kodevio@gmail.com`

<br/>
<div align="center">

*Designed in Clean Architecture · Fulfilling the Kodevio Technical Assessment*

[![Made with Flutter](https://img.shields.io/badge/Made%20with-Flutter-02569B?style=flat-square&logo=flutter&logoColor=white)](https://flutter.dev)

</div>
