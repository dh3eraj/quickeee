# State Management

I have used **flutter_bloc** for state management, implementing a scalable approach using Cubit and custom states.

- The states for the *Flash Drop* feature are defined in:
  `lib/features/flash_drop/presentation/bloc/flash_drop_state.dart`

- These states represent different UI conditions such as:
  - Loading
  - Success
  - Error

- The logic is handled in:
  `lib/features/flash_drop/presentation/bloc/flash_drop_cubit.dart`

- The Cubit emits states based on business logic and API responses, ensuring separation between UI and logic.


# Project Architecture

I have implemented **Clean Architecture** to ensure scalability, maintainability, and testability.

## Layers

### 1. Presentation Layer
- UI (Widgets)
- Bloc/Cubit for state management

### 2. Domain Layer
- Business logic
- Use cases
- Entities

### 3. Data Layer
- API / Data sources
- Repository implementations
- Models

## Benefits
- Clear separation of concerns  
- Easy to test and maintain  
- Scalable for large applications  
- Improved readability and reusability  