# Ward Management System

A simple Django-based web application for managing residents. This project allows users to add, search, view details, and delete residents.

## Features
- Add a new resident
- Search for residents by name, occupation, business, or house number
- View resident details
- Delete residents

## Prerequisites
### 1. Check if Python is Installed
Run the following command to check if Python is installed:
```bash
python --version
```
If Python is not installed, download and install it from [Python's official website](https://www.python.org/downloads/).

### 2. Check if Django is Installed
Run:
```bash
python -m django --version
```
If Django is not installed, install it using:
```bash
pip install django
```

## Installation and Setup

### 1. Clone the Repository
```bash
git clone https://github.com/KaranRajiwade/jangoBasicProject.git
cd ward_project
```

### 2. Create a Virtual Environment
```bash
python -m venv venv
```
Activate the virtual environment:
- On Windows:
  ```bash
  venv\Scripts\activate
  ```
- On macOS/Linux:
  ```bash
  source venv/bin/activate
  ```


### 4. Set Up the Database
```bash
python manage.py migrate
```

### 5. Create a Superuser (Optional, for Admin Panel)
```bash
python manage.py createsuperuser
```
Follow the prompts to create a username and password.

### 6. Run the Development Server
```bash
python manage.py runserver
```

### 7. Open the Application
Visit: [http://127.0.0.1:8000/](http://127.0.0.1:8000/) in your browser.

## Project Structure
```
ward_project/
├── residents/          # Django app for residents
│   ├── migrations/     # Database migrations
│   ├── templates/      # HTML Templates
│   ├── views.py        # Application logic
│   ├── models.py       # Database models
│   ├── urls.py         # URL routing
│
├── ward_project/       # Main Django project settings
│   ├── settings.py     # Configuration file
│   ├── urls.py         # Main URL dispatcher
│
├── Mysql               # Mysql database file
├── manage.py           # Django management script
├── requirements.txt    # Dependencies file
```

## How the Project Works
### 1. Searching for Residents
- Users can search for residents by name, occupation, business, or house number.
- The search query filters the resident database and displays matching results.

### 2. Viewing Resident Details
- Clicking on a resident's name will show detailed information about them.

### 3. Adding a Resident
- Users can add a new resident using the `add_resident.html` form.
- After submission, the resident’s data is stored in the database.

### 4. Deleting a Resident
- Users can delete a resident, which removes them from the database.



