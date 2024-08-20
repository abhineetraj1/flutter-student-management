# Flutter Student Management System


https://github.com/user-attachments/assets/85c94956-6807-48d2-92c9-20faf9030ab8


This is flutter and mongo DB based student management system, where student can login and see their academic and extra curricular activities in detail.

The application is fetching data from MongoDB, based on role number.

## Installation Guide

## Flutter

1. Download Flutter SDK
   - Visit the [Flutter website](https://flutter.dev/docs/get-started/install) and download the stable release for your operating system.

2. Extract the SDK
   - Unzip the downloaded file and place the `flutter` directory in your preferred location.

3. Add Flutter to PATH
   - Add the `flutter/bin` directory to your system PATH:
     - macOS/Linux:
       ```bash
       export PATH="$PATH:`<path-to-flutter-directory>/flutter/bin`"
       ```
       Add this line to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.) for persistence.
     - Windows: 
       Search for "Environment Variables" in the Start menu and add a new system variable with the name `Path` and value `<path-to-flutter-directory>\flutter\bin`.

4. Run Flutter Doctor
   - Open a terminal or command prompt and run:
     ```bash
     flutter doctor
     ```
   - Follow any additional setup instructions provided.

## MongoDB Compass

1. Download MongoDB Compass
   - Go to the [MongoDB Compass download page](https://www.mongodb.com/products/compass) and select the installer for your operating system.

2. Install MongoDB Compass
   - macOS: Open the `.dmg` file and drag the Compass icon to the Applications folder.
   - Windows: Run the `.msi` file and follow the installation instructions.
   - Linux: Follow the instructions on the MongoDB Compass [official documentation](https://docs.mongodb.com/compass/current/install/) for your distribution.

3. Launch MongoDB Compass
   - Open MongoDB Compass from your applications or start menu.

## mongosh

1. Download mongosh
   - Visit the [mongosh download page](https://www.mongodb.com/try/download/shell) and choose the installer for your operating system.

2. Install mongosh
   - macOS: Install via Homebrew:
     ```bash
     brew install mongosh
     ```
   - Windows: Run the `.msi` file and follow the installation instructions.
   - Linux: Follow the installation instructions on the mongosh [official documentation](https://docs.mongodb.com/mongodb-shell/install/) for your distribution.

3. Verify Installation
   - Open a terminal or command prompt and run:
     ```bash
     mongosh --version
     ```
   - This will display the installed version of `mongosh`.

## Python with Flask

1. Install Python
   - Download the latest Python installer from the [official Python website](https://www.python.org/downloads/) and follow the installation instructions for your operating system.

2. Install Flask
   - Open a terminal or command prompt and run:
     ```bash
     pip install flask
     ```

3. Verify Installation
   - Create a simple Flask app to verify the installation:
     ```python
     # app.py
     from flask import Flask
     app = Flask(__name__)

     @app.route('/')
     def hello():
         return 'Hello, Flask!'

     if __name__ == '__main__':
         app.run()
     ```
   - Run the app with:
     ```bash
     python app.py
     ```
   - Visit `http://127.0.0.1:5000/` in your web browser to see the Flask app in action.

You now have Flutter, MongoDB Compass, mongosh, and Python with Flask set up and ready for development! For more detailed guidance, refer to their respective official documentation.

## Setup

Create 'college' named database in MongoDB, and 'main', 'notifications' and 'notes' named collection inside 'college' database.

Upload the sample data into all the database, given in `sample-mongoDB-data`.

Download & setup python and install `flask` library

## Programming language and tools used
<p align="left"> <a href="https://dart.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/dartlang/dartlang-icon.svg" alt="dart" width="40" height="40"/> </a> <a href="https://flask.palletsprojects.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/pocoo_flask/pocoo_flask-icon.svg" alt="flask" width="40" height="40"/> </a> <a href="https://flutter.dev" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg" alt="flutter" width="40" height="40"/> </a> <a href="https://www.mongodb.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mongodb/mongodb-original-wordmark.svg" alt="mongodb" width="40" height="40"/> </a> <a href="https://www.python.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" alt="python" width="40" height="40"/> </a> </p>

## Developer
   [@abhineetraj1](https://github.com/abhineetraj1)
