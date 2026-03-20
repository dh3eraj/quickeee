
---

## 🧠 State Management

The project uses **flutter_bloc (Cubit)** for managing application state.

### Key Highlights:
- Custom states represent UI conditions:
  - Loading
  - Success
  - Error
- Cubit handles business logic and emits states accordingly
- UI listens to state changes and rebuilds reactively

### Benefits:
- Predictable state transitions  
- Clear separation of UI and logic  
- Easier debugging and testing  

---

## 🏗️ Layers

### 1. Presentation Layer
- Contains UI (Widgets)
- Uses Cubit for state management
- Responsible for rendering UI based on state

---

### 2. Domain Layer
- Contains business logic
- Defines repository contracts (interfaces)
- Independent of frameworks and external dependencies

---

### 3. Data Layer
- Implements repository interfaces
- Handles data fetching and parsing
- Contains:
  - Data sources (local/API)
  - Models
  - Repository implementations

---

## ⚡ Performance Optimization

### Isolate-based JSON Parsing

To efficiently handle large datasets, JSON parsing is offloaded to a **background isolate**:
Isolates run as independent threads with their own memory, communicating via message passing, ensuring heavy computations don’t block the main UI thread.
```dart
final content = await Isolate.run(() => _processJson(jsonString));