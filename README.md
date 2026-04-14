# CombinePOC 🚀

A SwiftUI + Combine Proof of Concept demonstrating **reactive search, API integration, and MVVM architecture** using a real-world product listing flow.

---

## 📱 App Overview

This app showcases:
- Animated Splash Screen
- Product Listing UI
- Search with Combine (debounce + API calls)
- Loader handling
- Clean MVVM separation

---

## 📂 Project Structure

```
CombinePOC
├── View
│   ├── SplashView.swift
│   ├── ProductView.swift
│
├── ViewModel
│   ├── SplashViewModel.swift
│   ├── ProductViewModel.swift
│
├── Model
│   ├── Product.swift
│
├── Network Manager
│   ├── NetworkManager.swift
│
├── Components
│   ├── ProductCellView.swift
│
├── App
│   ├── CombinePOCApp.swift
```

---

## 🎬 Splash Screen

- Custom animated splash screen
- Scale + opacity animation
- Uses Combine for delayed navigation

### Flow:
1. Animation starts
2. Combine `Just + delay` triggers
3. Navigates to Product screen

---

## 🛍 Product Screen

### Features:
- Displays list of products
- Uses `AsyncImage` for thumbnails
- Custom reusable `ProductCellView`
- Integrated search bar

---

## 🔍 Search Functionality (Combine)

Implemented using:
- `CurrentValueSubject`
- `debounce`
- `sink`

### Flow:
1. User types in search bar
2. Text passed to subject
3. Debounce applied (avoids rapid API calls)
4. API request triggered
5. Results update UI

---

## ⏳ Loader Handling

- `@Published isLoading` in ViewModel
- Centered `ProgressView`
- Automatically shown/hidden based on API state

---

## 🌐 API Integration

Using DummyJSON API:

```
https://dummyjson.com/products/search?q=<query>
```

### Example:
```
https://dummyjson.com/products/search?q=phone
```

---

## 🧠 Combine Concepts Used

- `Just`
- `delay`
- `sink`
- `AnyCancellable`
- `CurrentValueSubject`
- `@Published`

---

## 🏗 Architecture

Follows **MVVM (Model-View-ViewModel)**:

- View → UI rendering
- ViewModel → Business logic + Combine
- Model → Data structure
- NetworkManager → API handling

---

## 🚀 How to Run

1. Open project in Xcode
2. Build & Run
3. Splash screen appears
4. Navigate to product list
5. Use search bar to test Combine flow

---

## 🔥 Key Highlights

- Clean separation of concerns
- Reactive UI updates using Combine
- Debounced API search
- Loader state management
- Scalable architecture for real apps

---

## 📈 Future Improvements

- Pagination support
- Error handling UI
- Caching search results
- Offline mode
- Shimmer loading effect

---

## 🙌 Purpose

This project is built as a **learning POC for mastering Combine + SwiftUI + MVVM**, and is ideal for:
- Interview preparation
- Understanding reactive programming
- Practicing clean architecture

---

## ⭐️ If you like this project

Consider giving it a ⭐️ and using it as a reference for your Combine journey!

