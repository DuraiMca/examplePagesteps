# Steps Screen

Steps Screen is a Flutter widget that allows you to create a step-by-step wizard-like user interface.

## Introduction

Steps Screen provides a simple and intuitive way to guide users through a series of steps or tasks. It is particularly useful for onboarding flows, form submissions, and any multi-step processes in your Flutter applications.

![Steps Screen Demo][(https://example.com/demo.gif)](https://raw.githubusercontent.com/DuraiMca/examplePagesteps/master/pagestepup.gif)

## Features

- Create a step-by-step wizard-like UI with ease.
- Customizable colors, buttons, and step indicators.
- Support for both vertical and horizontal layouts.
- Callbacks for handling completion and individual step changes.

## Installation

To use Steps Screen in your Flutter project, follow these steps:

1. Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  steps_screen: ^1.0.0

  2.Run flutter pub get to fetch the package.
  3.Import the Steps Screen package in your Dart file:

    import 'package:steps_screen/steps_screen.dart';
Usage
To use Steps Screen, create a list of widgets representing each step in the wizard. For example:
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WizardScreen(
        widgets: [
          LoginPage(),
          RegisterPage(),
        ],
        onFinish: () {
        // customize code 
        },

      ),
    ); 
  }
 



