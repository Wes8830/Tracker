---
    Project: Use Case Tracker
    Developer: Wes Vesprini
    Date Updated: 1/04/2022
---


# Wes8830 - Tacker project
## Description
UseCase tracker is a series of separate django applications (Users and Tracker) aimed at tracking Use Cases, Products, Clients along different stages of the development lifecycle and additional Models as they're implemented. Once a Use Case, Product, or Client is created it can be searched for and modified so that end users of the application aren't duplicating efforts in silos. Statuses are provided for both the Product and Use Case models so that end users can also see how far along in the development cycle a given model is.This project's objective is geared toward Product professionals, Sales professionals, Consultant professionals and (eventually) engineers to track Use Cases, Clients and Products in a central location.


## Distinctiveness and Complexity
- This project's objective is geared toward Product professionals, Sales professionals, Consultant professionals and (eventually) engineers to track Use Cases, Clients and Products in a central location.
- This project introduces 'Status' classes for Products and 'Use Cases' so that visitors to the site can view their progress, if they're in active development, queued, supported, live, in alpha, beta, in testing, etc...
- - Statuses are linked to Font Awesome icons for a better visual experience.
- Responsive design with help from bootstrap Nav Bar attributes with an interactive expandable hamburger style menu that dynamically appears on smaller (mobile) screens
- Cards are constructed using JavaScript for easier viewing that are configured in a responsive grid that wraps with each row responding to the width of the screen.
- - Cards are color coded to distinguish each Model (Product, Client, Use Case)
- 4 Models were utilized and is designed in a way to allow for expansion as more models are created and integrated into the front and back ends.
- This project separates out the Login/Logout/Register functionality into its own separate application, again with the intention of adding additional applications that can utilize the same login credentials.
- Aside from the Login/Logout/Register screens, this application is entirely single page.
- Utilizing Django Template tags, separate separate Modules are separated for easier management and what I believe to be a cleaner design.
- - Modules: NavBar, Product Creation Form, Client Creation Form, Use Case Creation form.
- Each form auto populates when Editing an existing record for better usability.
- CRUD operations to the database are initiated on the front end using JavaScript's Fetch API and responses don't trigger page refreshes.
- Search Functionality was implemented with case insensitivity to assist users in narrowing down the number of items on a page matching an input query. Again, response does not trigger a full page reload.
- Search Functionality is only available on relevant pages despite being in a global navigation bar.
- How To tutorial with in-line HTML elements found throughout the application found within a collapsible element on the Index page. Accessible at all times without having to leave the page you're currently on.
- Back End is configured via Settings.py to share the same templates between `Users` and `Tracker` applications
- Authentication is used on the Front End to control which Nav Bar items are visible to logged in users and logged out users using Jinja template tags.

## Files
### `Tracker` Application Files
#### tracker/static/styles.css
  - Defines CSS static file for the front end of the `Tracker` application
#### tracker/static/tracker.js
  - Javascript logic for the front end of the `Tracker` application
  - **JS Functions**:
    - `loadDashboard()` : Fetches the appropriate Models for Product, Client, or Use Cases
    - `buildCards()` : builds each individual Model Object returned in the JSON response into a readeable card
    - `searchQuery()` : a helper function to determine if the current Dashboard should load with search results. This is trigged when a user enters a search query into the Search Bar located within the Nav Bar. 
    - `getStatus()` : fetches and returns each of the `Status` choices for the provided model
    - `openForm()` : displays the relevant input form for the dashboard the user is currently on
    - `buildCards()` : builds cards for each returned object from the response JSON for the relevant dashboard. Appends cards to current board page.'t have the licenses to access our Product pages. Nor do Product teams always have access to salesforce. This is a ceeates and edits 'Use Case' records in the `Usecase` model
    - `deleteSwitch()` : Function for 'Delete' methods to remove records from the relevant model

#### tracker/templates/layout.html
  - Layout template for the `Tracker` application
#### tracker/templates/index.html
  - Home index page for the `Tracker` application. 
  - Introduces the objective and a `How To` collapsible menu providing instructions on how to use the applicaiton.
#### tracker/templates/nav.html
  - Template for managing and maintaining the `Nav Bar` in a discrete template as it is needed to be used and repurposed with the `Users` application various login/logout/registration screens.
#### tracker/templates/product-form.html
  - Template for managing and maintaining the `Create Product Form` bar in a discrete template
#### tracker/templates/client-form.html
  - Template for managing and maintaining the `Create Client Form` in a discrete template
#### tracker/templates/usecase-form.html
  - Template for managing and maintaining the `Create Use Case Form` in a discrete template

#### tracker/models.py
  - Defines all Models needed to store all records users enter on the front end
#### tracker/urls.py
  - Defines valid url paths for both the `Tracker` and `Users` applications
#### tracker/views.py
  - Python logic for the back end of the `Tracker` application
  - Defines each View function in the `Tracker` application
  - **Views Functions**:
    - `index()` : Function that brings user to the home page of the application if authenticated. Otherswise, if user is not logged in, they will be redirected to the login page.
    - `tracker_dashboard()` : Backend fetch to `loadDashboard()`. Fetches All values for a given `board` or filtered results based on search inputs.
    - Takes as input: 
    - - `request`,
    - - `board` : the model object to be queried from database
    - - `search_value` : Search Value if provided in the fetch
    - - `search` : If 'True' will filter results based on `search_value` argument
    - `get_status()` : fetches the Status choices from the relevant Models matching the `board` input value, `Product` and `UseCase`.
    - `product_view()` : GETs individual record frm the `Product` table. Returns serialized results to front end `cardDetails()` fetch.
    - `client_view()` : GETs individual record frm the `Client` table. Returns serialized results to front end `cardDetails()` fetch.
    - `usecase_view()` : GETs individual record frm the `UseCase` table. Returns serialized results to front end `cardDetails()` fetch.
    - `create_product()` : from front end `createProduct()` fetch, this function takes the `payload` and writes or updates the record to the database. Returns status 200.
    - `create_client()` : from front end `createClient()` fetch, this function takes the `payload` and writes or updates the record to the database. Returns status 200.
    - `create_usecase()` : from front end `createUsecase()` fetch, this function takes the `payload` and writes or updates the record to the database. Returns status 200.
    - `delete_product()` : from front end `deleteSwitch()` fetch, this function takes the `payload` and deletes the record from the database. Returns status 200.
    - `delete_client()` : from front end `deleteSwitch()` fetch, this function takes the `payload` and deletes the record from the database. Returns status 200.
    - `delete_usecase()` : from front end `deleteSwitch()` fetch, this function takes the `payload` and deletes the record from the database. Returns status 200.

#### tracker/admin.py
  - Defines all registered Models
#### tracker/apps.py
  - Configures the `Tracker` application

### `Users` Application Files
#### users/templates/layout_login.html
  - Layout template for the `Users` Application
#### users/templates/login.html
  - Basic Login form with link to register new users on register.html
#### users/templates/logged_out.html
  - Logged out landing page with link back to login page on login.html
#### users/templates/register.html
  - Basic registration form with link back to login page on login.html

#### users/models.py
  - Models page declaring the Django default 'User' model 'AbstractUser'
#### users/urls.py
  - Defines valid url paths for the `Users` application
#### users/views.py
  - Defines each view in the Django `Users` application

### usecase settings
#### usecase/settings.py
  - Registers `Users` and `Tracker` applications within 'INSTALLED_APPS' 
  - Specifies the 'DATABASES' to be used on the backend (sqlite3)
  - Specifies within 'TEMPLATES' which directories to search for html templates


## Run Application
1. Download source files from [me50/Wes8830 Github Repository](https://github.com/me50/Wes8830.git)
2. Open your Terminal and navigate to the where are storing the downloaded files and then navigate to same directory where the 'manage.py' file lives.
3. While there aren't many dependencies, please ensure dependencies are met otherwise follow the download dependencies instructions (see [Dependencies](#dependencies)) below
4. If you are removing the 'db.sqlite3' file to start with a fresh database please run the following commands in the same directory as the 'manage.py' file

```sh
  $ python manage.py makemigrations
  $ python manage.py migrate
```
5. To Run the application On the command line execute the following command:

```sh
  $ python manage.py runserver 
```
6. Open the URL, found in the output of the previous command, in a Browser that has good JavaScript support (Chrome, Firefox).
7. To quit the server press CTRL-C on your keyboard within the terminal that's running the application. 



### Dependencies
python == 3.9.5
Django == 3.2.5
asgiref==3.4.1
certifi==2021.5.30
Django==3.2.5
sqlparse==0.4.2

Once the [me50/Wes8830 Github](https://github.com/me50/Wes8830.git) repository is downloaded, navigate to directory where the requirements.txt file is and execute the following:

Linux OS: 
```sh
$ pip3 install -r requirements.txt
```

## Sources and Links
- Django Models Overview: https://docs.djangoproject.com/en/3.1/topics/db/models/ 
- Django Model Fields: https://docs.djangoproject.com/en/3.1/ref/models/fields/#model-field-types 
- [Django Authentication](https://docs.djangoproject.com/en/3.2/topics/auth/default/)

