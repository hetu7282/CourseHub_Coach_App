# 📚 Coach App

<p align="center">
<img width="150" height="150" alt="logo" src="https://github.com/user-attachments/assets/2b5f1b40-a053-4df3-9be9-3bde005f0801" />
</p>

---

A **Flutter-based online coaching/course management application** that allows coaches/instructors to manage courses, videos, and students, while learners can browse, purchase, and watch course content. The app is built using the **GetX** state management pattern with a clean separation of UI, business logic, repositories, and API layers.

---

## 📖 Project Overview

Coach App (package name: `coach_app`) is a mobile platform for an online learning/coaching business (referred to internally as **CourseHub**). It provides:

- User authentication (login/sign-up)
- A dashboard for browsing courses, categories, and promotional banners
- Course and video management (add/view courses, add/view videos)
- Student management (view list of enrolled/buyer students)
- Profile management, password change, and informational pages (About Us, Contact Us, Terms of Use)

The app communicates with a REST API backend (configurable base URL) for authentication, content delivery, and media handling.

---

## ✨ Key Features & Functionality

- **Authentication**: Email/password login and sign-up with phone number input support
- **Splash/Onboarding**: Animated splash screen with auto-redirect based on login state
- **Dashboard/Home**: Category listing, image carousel/slideshow for promotions, tabbed content
- **Course Management**:
  - Add new courses (title, description, fee, banner image, category)
  - View course details
  - Enable/disable courses via switch toggle
- **Video Management**:
  - Add videos to a course (title, subtitle, YouTube link with validation)
  - View all videos / play videos using YouTube player and Flick video player
- **Student Management**: View list of students/buyers and individual student details
- **Profile & Settings**:
  - Edit profile (with image upload via camera/gallery)
  - Change password
  - About Us, Contact Us (with email app integration), Terms of Use
- **Network Connectivity Monitoring**: Real-time internet status checks with sync dialogs
- **UI/UX Utilities**: Custom alerts, toasts (`toastification`), loading overlays (`flutter_easyloading`), responsive sizing (`sizer`), custom dropdowns, text fields, and app bars
- **Localization-ready dates**: Relative timestamps via `timeago` and `intl`
- **Local Storage**: Persisted user session and data via `get_storage`

---

## 🏗️ Architecture & Application Flow

The app follows a **layered MVC-like architecture powered by GetX**:

```
UI (Screen)  ⇄  Controller (GetX)  ⇄  Repository  ⇄  API Manager (http/dio)  ⇄  Backend REST API
                       │
                       ▼
                 Data Models (Response Models)
```

1. **Screens** are stateless/stateful widgets that observe reactive state (`Rx`, `.obs`) exposed by Controllers using `GetBuilder` / `Obx`.
2. **Controllers** (`GetxController`) hold UI state, text controllers, and call repository methods for data operations.
3. **Repositories** act as an abstraction layer between controllers and raw API calls, returning typed **Model** objects.
4. **API Managers** (`APIManager`, `PostAPIManager`, `DioManager`) handle actual HTTP communication (GET, POST/PUT/multipart via `http`/`dio`), error handling, and loading indicators.
5. **Models** define the structure of JSON responses (`fromJson`/`toJson`).
6. **Routing** is handled via `go_router`-style named routes through GetX's `GetPage` and `Routes` constants, with platform-specific transitions (no transition on Android, Cupertino transition on iOS).
7. **Local Storage** (`get_storage`) persists login session/user data, retrieved on splash to determine the initial route (Login vs Main screen).

### Application Flow
```
SplashScreen
   │
   ├──> (no session) ──> LoginScreen ──> SignUpScreen
   │
   └──> (active session) ──> MainScreen
                                 ├── HomeScreen (categories, banners, courses)
                                 │      └── CouresViewScreen ──> AllVideoScreen ──> VideoScreen
                                 ├── StudentScreen ──> StudentDetaileScreen
                                 └── MenuScreen
                                        ├── EditProfileScreen
                                        ├── ChangePasswordScreen
                                        ├── AboutUsScreen
                                        ├── ContactUsScreen
                                        └── TermsOfUseScreen
```

---

## 🛠️ Tech Stack & Versions

| Component | Version / Requirement |
|---|---|
| **Dart SDK** | `>=3.1.5 <4.0.0` |
| **Flutter SDK** | Compatible with Dart 3.1.5+ (Flutter 3.16+ recommended) |
| **App Version** | `1.0.0+1` |
| **State Management** | GetX |

---

## 📦 Key Dependencies

| Package | Version | Purpose |
|---|---|---|
| `get` | ^4.6.6 | State management, routing, dependency injection |
| `get_storage` | ^2.1.1 | Lightweight local key-value storage (session persistence) |
| `google_fonts` | ^6.1.0 | Custom typography |
| `sizer` | ^2.0.15 | Responsive UI sizing across devices |
| `intl` | ^0.19.0 | Internationalization & date formatting |
| `intl_phone_number_input` | latest | Phone number input with country codes |
| `image_picker` | ^1.0.7 | Pick images from camera/gallery (profile, course banners) |
| `permission_handler` | latest | Runtime permission requests (camera, storage) |
| `toastification` | ^1.2.0 | Toast notifications |
| `flutter_easyloading` | ^3.0.5 | Global loading indicators |
| `go_router` | ^13.0.1 | Declarative routing (supplemental) |
| `carousel_slider` | ^4.2.1 | Image carousel for dashboard banners |
| `flutter_image_slideshow` | ^0.1.6 | Slideshow widget |
| `open_mail_app` | ^0.4.5 | Open mail apps for "Contact Us" |
| `url_launcher` | ^6.2.4 | Launch URLs/external links |
| `flick_video_player` | latest | Custom video player UI |
| `video_player` | latest | Core video playback |
| `youtube_player_flutter` | ^9.0.0 | Embedded YouTube video playback |
| `video_url_validator` | ^1.0.3 | Validate YouTube/video URLs |
| `connectivity_plus` | ^3.0.6 | Network connectivity monitoring |
| `http` | ^1.1.0 | REST API calls (GET) |
| `dio` | ^5.3.3 | REST API calls (multipart/file uploads) |
| `http_parser` | ^4.0.2 | Media-type parsing for multipart requests |
| `dropdown_button2` | latest | Enhanced dropdown UI |
| `timeago` | ^3.6.1 | Relative/human-readable timestamps |
| `flutter_advanced_switch` | ^3.1.0 | Custom switch widget (enable/disable course) |
| `cupertino_icons` | ^1.0.2 | iOS-style icons |

### Dev Dependencies
| Package | Version |
|---|---|
| `flutter_test` | sdk |
| `flutter_lints` | ^2.0.0 |

> ⚠️ **Note**: Several dependencies (`intl_phone_number_input`, `permission_handler`, `flick_video_player`, `video_player`, `dropdown_button2`) do not specify version constraints in `pubspec.yaml`. It's recommended to pin these to specific versions to avoid breaking changes during `flutter pub get`.

---

## 📱 Platform Requirements

| Platform | Minimum Version |
|---|---|
| **Android** | minSdkVersion 21 (Android 5.0) or higher recommended for `video_player`/`youtube_player_flutter` compatibility; verify against `android/app/build.gradle` |
| **iOS** | iOS 12.0+ recommended (check `ios/Podfile` `platform :ios` value) |

> ℹ️ Confirm exact `minSdkVersion`, `targetSdkVersion`, and `compileSdkVersion` in `android/app/build.gradle`, and the iOS deployment target in `ios/Podfile`, since several plugins (camera, video, connectivity) require modern platform versions.

---

## 🧩 Feature-Wise Explanation

### 1. Admin Authentication (`Screen/Authetication`, `Controller/authetication_controller.dart`)
- **Login Screen**: Admin enters email/password; `AuthenticationRepository.loginApiCall` validates credentials against the backend.
- On success, the admin session/details (`AdminLoginResponseModel`) are saved to `GetStorage` under `userData`, and the app navigates to `AdminHomePage`.
- On subsequent launches, `main.dart` checks `GetStorage().read(userData)` to decide whether to show `AdminHomePage` or `LoginScreen` directly.

### 2. Admin Home Shell (`Screen/Home/admin_home_screen.dart`)
- Renders the responsive layout: persistent sidebar on desktop (`Responsive.isDesktop`) or a `Drawer` (`CustomSideMenubarWidget`) on smaller screens.
- On init, calls `AdminHomeController.getAllData(context)` to bulk-load categories, courses, coaches, students, image sliders, and content data for use across all panels.
- Uses `SideMenuController.selectedDestination` (reactive `Obx`) to swap between content panels.

### 3. Sidebar Navigation (`Custom_Widget/custom_side_menubar_widget.dart`)
Provides navigation to the following sections:
- **Dashboard** — overview stats
- **Category** — category & course management
- **Coach** — coach account management
- **Users** — student account management
- **Image Sliders** — promotional banner management
- **Contact Us** — contact info management
- **About US** — about page content management
- **Terms & Condition** — terms of use content management

### 4. Category & Course Management (`Drawer_Widget/custom_course_widget.dart`)
- Lists all categories (`GetCategoryResponseModel`) with search/filter (`_filteredData`).
- **Add Category**: Upload category image and details (`addCategoriesApiCall`, uses `uploadImageApiCall` via `DioManager`).
- **Update Category**: Edit existing category details (`updateCategoriesApiCall`).
- **Enable/Disable**: Toggle category/course visibility using `flutter_advanced_switch` (`updateEnableCategoriesApiCall`).
- **Remove Category**: Delete a category (`removeCategoriesApiCall`).
- Course listings can be filtered by coach (`getCourseApiCall(coachId: ...)`).

### 5. Coach Management (`Drawer_Widget/custom_coach_widget.dart`)
- Lists all coaches (`GetCoachResponseModel`) via `getCoachApiCall`.
- Enable/disable coach accounts via `updateEnableCoachApiCall`.

### 6. User/Student Management (`Drawer_Widget/custom_user_widget.dart`)
- Lists all students (`GetStudentResponseModel`) via `getStudentApiCall`.
- Enable/disable student accounts via `updateEnableStudentApiCall`.

### 7. Image Slider Management (`Drawer_Widget/custom_image_slider_widget.dart`)
- Lists current promotional banners (`GetImageSliderResponseModel`).
- **Add**: Upload new slider images (`addImageSliderApiCall`, with web-based image picking via `image_picker_web`/`universal_html`).
- **Update**: Replace existing slider images (`updateImageSliderApiCall`).
- **Delete**: Remove a slider image (`deleteImageSliderApiCall`).
- These sliders are displayed on the **Student App** home screen.

### 8. Content Management
- **About Us** (`custom_aboutus_widget.dart`): View (`getAboutUsApiCall`) and update (`updateAboutUsApiCall`) the About Us content shown in the mobile apps.
- **Contact Us** (`custom_contactus_widget.dart`): View (`getContactUsApiCall`) and update (`updateContactUsApiCall`) contact information.
- **Terms of Use** (`custom_terms_of_condition_widget.dart`): View (`getTermsApiCall`) and update (`updateTermsApiCall`) terms & conditions content.

### 9. Dashboard Overview (`Drawer_Widget/custom_dashboard_widget.dart`)
- Displays summary/overview information aggregated from the data fetched by `AdminHomeController.getAllData`.

---

## 👨‍💻 Notes for Developers & Contributors

- **State Management**: This project relies heavily on GetX (`GetxController`, `Rx` observables, `Get.toNamed`/`Get.offAllNamed` for navigation, and `GetMaterialApp`). Familiarize yourself with GetX reactive patterns before contributing.
- **API Layer**: Three API managers exist — `APIManager` (GET via `http`), `PostAPIManager` (POST/PUT via `http`), and `DioManager` (multipart uploads via `dio`). Use the appropriate manager based on the request type.
- **Base URL**: Defined in `lib/Utils/string_constant.dart`. Switch between local/development/production URLs here — avoid hardcoding URLs elsewhere.
- **Naming Conventions**: Some files/classes contain typos carried over from initial development (e.g., `Coures` instead of `Course`, `Desboard` instead of `Dashboard`, `Studen` instead of `Student`, `ragistar` instead of `register`). Maintain consistency with existing naming when extending these modules, or consider a project-wide rename/refactor in a dedicated PR.
- **Commented-out Routes**: `Routes/app_page.dart` and `pubspec.yaml` contain several commented-out routes/dependencies from earlier iterations (e.g., product comparison, bidding screens) — these indicate the app may have been adapted from a marketplace/bidding template. Clean these up if not needed.
- **Unversioned Dependencies**: Pin exact versions for `intl_phone_number_input`, `permission_handler`, `flick_video_player`, `video_player`, and `dropdown_button2` in `pubspec.yaml` to ensure reproducible builds.
- **Assets**: The `flutter_assets` section in `pubspec.yaml` auto-generates `lib/generated/assets.dart` from the `assets/` directory — regenerate this file whenever assets are added/removed (check tooling/build_runner setup if automated generation is configured).
- **Linting**: The project uses `flutter_lints` (^2.0.0); run `flutter analyze` before submitting PRs.
- **Testing**: `flutter_test` is included as a dev dependency, but no test files currently exist — contributions adding unit/widget tests are welcome.
- **Transitions**: Navigation transitions differ by platform (`Transition.noTransition` on Android, `Transition.cupertino` on iOS) — defined in `Routes/app_page.dart`.

---

<p align="center">Made with ❤️ using Flutter</p>

