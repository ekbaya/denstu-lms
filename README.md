# Running this Flutter Application in Visual Studio Code

This guide will walk you through cloning this Flutter project and run it in Visual Studio Code.

## Prerequisites

Before you begin, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Visual Studio Code](https://code.visualstudio.com/)

## Step 1: Clone the GitHub Project

1. Clone the Flutter project from GitHub using the following command:
   git clone https://github.com/ekbaya/denstu-lms.git

2. Navigate to the cloned project directory: cd <project_directory>

Replace `<project_directory>` with the name of the directory created during cloning.

## Step 2: Open the Project in Visual Studio Code

1. Open Visual Studio Code.

2. Open the cloned Flutter project folder in Visual Studio Code:

- Click on "File" in the menu.
- Select "Open Folder...".
- Navigate to the cloned project directory and select it.
- Click "Open".

## Step 3: Install Dependencies

1. Open the terminal in Visual Studio Code:

- Click on "View" in the menu.
- Select "Terminal".
- Choose "New Terminal".

2. Run the following command to install project dependencies:
   flutter pub get

## Step 4: Run the Flutter Application

1. Once the dependencies are installed, you can run the Flutter application:

- Make sure you have a target device available (e.g., emulator, physical device) or use the VS Code's emulator.
- Open the terminal in Visual Studio Code.

2. Run the following command to start the Flutter application: flutter run

3. Wait for the Flutter application to build and launch on the selected device.

## Test APK

I have included a test APK file [app-release.apk](app-release.apk) in the root directory that you can download and install directly onto your Android device.

Congratulations!
