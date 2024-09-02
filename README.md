# farm_loan_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


The project has the following folder structure:

- **backend**: Contains the Node.js server code.
- **mobile app**: Contains the Dart (Flutter) mobile app code.


Flutter packages used in the Mobile app

flutter_screenutil: A package that helps in making the app responsive by adapting UI elements according to different screen sizes. It provides methods to set sizes, margins, and fonts relative to screen dimensions.

dio: A powerful HTTP client for Dart, which supports features like interceptors, global configuration, FormData, and handling network requests with ease. It's widely used for making API requests.

flutter_feather_icons: Provides a set of Feather Icons, which are simply and beautifully designed vector icons. This package allows you to easily integrate these icons into your Flutter app.

shared_preferences: A Flutter plugin for reading and writing simple key-value pairs to the device's local storage. It's commonly used to store small amounts of data like user settings and preferences.

flutter_svg: A package that allows you to render SVG files in your Flutter app. This is useful for displaying scalable vector graphics without losing quality.

provider: A state management solution for Flutter applications. It is easy to use and integrates seamlessly with the widget tree to provide state and data to different parts of your app.

cached_network_image: This package allows you to load and cache images from the network. It's particularly useful for handling images in a more efficient way, especially in apps that deal with many images.

hive: A lightweight and blazing-fast key-value database written in pure Dart. It's used for storing structured data locally on the device. Unlike traditional databases, Hive is optimized for performance.

flutter_launcher_icons: A package that simplifies the process of updating app launcher icons for both Android and iOS. It helps in creating and setting the app's launcher icons from a single source image.

hive_flutter: A Flutter plugin that makes it easy to integrate Hive into a Flutter project, providing additional functionality like automatic handling of Flutter's lifecycle and easy access to the Hive database.

Node Js packages used on the backend

bcryptjs: A library for hashing passwords. It provides methods to create and compare password hashes, helping to secure user credentials.

cors: A middleware for enabling Cross-Origin Resource Sharing (CORS) in your Express applications. It allows your API to handle requests from different domains securely.

cross-env: A utility for setting environment variables across different operating systems. It ensures that environment variables work consistently in various environments.

dotenv: A module that loads environment variables from a .env file into process.env. It helps in managing configuration variables for different environments.

express: A fast, minimal web framework for Node.js, used for building web applications and APIs. It simplifies the process of routing, handling requests, and managing middleware.

jsonwebtoken: A library to create, sign, and verify JSON Web Tokens (JWTs). It’s commonly used for securing APIs through token-based authentication.

moment: A date manipulation library that simplifies working with dates and times in JavaScript. It provides formatting, parsing, and manipulating dates.

mongoose: An Object Data Modeling (ODM) library for MongoDB and Node.js. It provides a schema-based solution to model application data and manage relationships between data.

nodemailer: A module for sending emails in Node.js. It supports various transport methods like SMTP and allows for the easy integration of email functionality into your applications.

validator: A library of string validators and sanitizers. It helps in validating and sanitizing user inputs to ensure data integrity and security.
