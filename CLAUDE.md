# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

WattFood is a Flutter app being rebuilt from scratch, step by step, as a learning project. The user is a Flutter/Dart beginner. Prefer showing code in chat over editing files directly, unless explicitly asked to edit a file.

WattFood app that lets user add photos, add name of the food, add ingridients and save their recipes.

## Conventions

- Always use Flutter Material Design (`import 'package:flutter/material.dart';`) for widgets — not Cupertino or other design systems.

- Always help the user show intructions in doing the task.

- Make the app inspired by the UI/UX of reminders app from IOS iPhone.


## Commands

- `flutter pub get` — install/update dependencies (run after any `pubspec.yaml` change)
- `flutter run -d windows` / `-d chrome` / `-d edge` — run the app
- `flutter analyze` — static analysis / lints
- `flutter test` — run tests

### Windows-specific gotcha

Native plugins that need symlink support (e.g. `image_picker`, `shared_preferences`) require Developer Mode enabled on Windows (`Win+R` → `ms-settings:developers`) or running the terminal as Administrator, otherwise `flutter pub get`/`flutter run` fails with "Building with plugins requires symlink support."
