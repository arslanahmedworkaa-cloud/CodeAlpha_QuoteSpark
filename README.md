# ✨ Random Quote Generator – Flutter App

**Random Quote Generator** is a modern and interactive mobile application developed using **Flutter and Dart** as part of my **App Development Internship at CodeAlpha**.

The app displays inspiring and motivational quotes with their authors. Users can generate new quotes, copy them, and save their favorite quotes for later. It works offline using built-in quotes and local storage.

## ✨ Features
- **Splash Screen:** A welcoming opening screen featuring the app logo, Quote Spark name, and tagline before entering the main application.
- **Random Quotes:** Displays a random quote when the application launches after splash screen.
- **New Quote:** Generate a different quote with a single tap.
- **No Immediate Repetition:** Prevents the same quote from appearing twice in a row.
- **Author Details:** Displays the author's name along with each quote.
- **Dynamic Gradient Backgrounds:** Changes the background gradient when a new quote appears.
- **Fade Animations:** Smooth fade transitions between quotes.
- **Copy Quote:** Copy quotes to the clipboard with a single tap.
- **Favorite Quotes:** Save quotes to a personal favorites list.
- **Local Data Storage and Offline Functionality:** Uses 41 built-in quotes, so an internet connection is not required.
- **Clean UI:** Simple, modern, and user-friendly interface.

## 📱 App Screenshots

### 1. Splash Screen
Displays the Quote Spark logo, application name, and tagline when the app launches.

<img width="720" height="1462" alt="Quotepic1" src="https://github.com/user-attachments/assets/0029d094-1a99-4a84-b412-7f55a54c9ddb" />


### 2. Home Screen
Displays a random quote with its author's name, along with options to generate a new quote, copy it, or add it to favorites.

<img width="720" height="1450" alt="Quotepic2" src="https://github.com/user-attachments/assets/6f90399d-5386-4946-a2b6-b04dba09f41d" />


### 3. Favorites Screen
Displays saved favorite quotes so users can revisit their preferred quotes.

<img width="720" height="1491" alt="Quotepic3" src="https://github.com/user-attachments/assets/356e3dc7-9b45-4bdf-88bf-f58f41313550" />
<img width="720" height="1467" alt="Quotepic4" src="https://github.com/user-attachments/assets/bc9b21c8-5f88-4ed5-a10e-329b1bff7b3c" />


## 🛠️ Technologies & Packages Used

- **Flutter:** For building the mobile application.
- **Dart:** For application logic and functionality.
- **Riverpod:** For state management and handling quote and favorites data.
- **SharedPreferences:** For local key-value storage of favorite quotes.
- **Flutter Clipboard:** For copying quotes to the clipboard.

## 🧠 State Management

This project uses **Riverpod** to manage application state.

- `quoteProvider`: Manages the currently displayed quote.
- `favoritesProvider`: Manages the user's favorite quotes.

Riverpod helps keep the application organized and updates the UI when the application state changes.

## 📚 Key Learning Outcomes

Through this project, I gained practical experience in:

- Building modern and interactive Flutter interfaces.
- Understanding and implementing Riverpod state management.
- Managing application state using providers.
- Storing and retrieving data locally using SharedPreferences.
- Implementing animations and dynamic UI changes.
- Working with multiple screens and navigation.
- Handling clipboard functionality.
- Building an offline application using local data.

## 🙏 Acknowledgement

I would like to express my sincere gratitude to **CodeAlpha** for providing me with this internship opportunity.

This project was a valuable learning experience that helped me strengthen my Flutter development skills and gain practical knowledge of state management, local data storage, animations, and interactive UI development.

Thank you, **CodeAlpha**, for this opportunity and for encouraging aspiring developers to learn and grow through practical projects.

---

**Project Name:** Quote Spark  
**Internship:** CodeAlpha – App Development Internship  
**Platform:** Android  
**Developed With:** Flutter and Dart  
**State Management:** Riverpod  
**Local Storage:** SharedPreferences

🚀 *Built with Flutter to make inspiration just one tap away.*
