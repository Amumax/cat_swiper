# Cat Swiper App

A Flutter application that allows users to browse and like/dislike cat images from TheCatAPI.

## Features

- Display random cat images with breed information
- Swipe left/right to dislike/like cats
- Like/Dislike buttons for alternative interaction
- Counter to track liked cats
- Detailed view of cat breed information with complete breed details
- Cached images for better performance
- Responsive UI design
- Custom app icon

## Screenshots

![Home Screen](screenshots/home_screen.png)
![Detail Screen](screenshots/detail_screen.png)
![Swiping Demo](screenshots/swiping_demo.png)

## Technical Implementation

- Used Provider for state management
- Implemented HTTP requests to TheCatAPI
- Used CachedNetworkImage for efficient image loading
- Implemented card swiping with flutter_card_swiper
- Hero animations for smooth transitions
- Proper error handling and loading states
- StatefulWidget for managing state
- StatelessWidget for reusable components (like/dislike buttons)
- Proper use of Row and Column widgets for layout

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Replace the API key in `cat_api_service.dart` with your own from [TheCatAPI](https://thecatapi.com/)
4. Run the app with `flutter run`

## Download

You can download the latest APK version of the app [here](https://drive.google.com/file/d/1abc123xyz/view?usp=sharing).

## Dependencies

- flutter: SDK
- http: ^1.2.1
- cached_network_image: ^3.3.1
- flutter_card_swiper: ^6.0.0
- provider: ^6.1.1
- flutter_lints: ^5.0.0
