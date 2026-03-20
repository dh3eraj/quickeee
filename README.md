# Quickeee 🚀

A Flutter application demonstrating efficient handling of large datasets, smooth UI performance, and scalable architecture using modern best practices.

---

## 📌 Features

- Efficient large data parsing
- Smooth UI rendering with minimal frame drops
- State management using flutter_bloc (Cubit)
- Clean Architecture implementation
- Performance optimized (tested with Flutter Performance Overlay)

---

## 🧠 State Management

This project uses **flutter_bloc (Cubit)** for state management.

- Custom states are used to represent UI conditions:
  - Loading
  - Success
  - Error
- Business logic is separated from UI using Cubit
- Ensures predictable and maintainable state flow

---

## 🏗️ Project Architecture

The project follows **Clean Architecture** for scalability and maintainability.

### Layers:

#### 1. Presentation Layer
- UI (Widgets)
- Bloc/Cubit for state management

#### 2. Domain Layer
- Business logic
- Use cases
- Entities

#### 3. Data Layer
- API/Data sources
- Repository implementations
- Models

📄 More details: See `ARCHITECTURE.md`

---

## 🚀 Getting Started

Follow these steps to run the project locally:

### 1. Clone the Repository
```bash
git clone https://github.com/dh3eraj/quickeee.git
cd quickeee