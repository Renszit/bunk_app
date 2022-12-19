# bunk_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## folder structure

- global: files that help our app globally
  - common: commonly used widgets (e.g. buttons, textfields, etc.)
  - controllers:  global controllers we user before starting app
  - endpoints: api endpoints
  - interceptors: fetching interceptors + route interceptors
  - models: JSON models
  - services: functions that fetch from an API or external service
  - themes: themes for the app
  - utils: const variables and functions that are used globally
  - widgets: High level widgets that are used globally

- modules: modules based on pages
  - controllers: will contain controlles for each module
  - widgets: will contain widgets used in the view
  - view (dart): will contain the view of the module (max 300 lines of code, split it up into smaller widgets)
  - Business logic should be handled in controllers
  

## packages used
- State: riverpod
- navigation: auto_route
- localisation: flutter_localizations