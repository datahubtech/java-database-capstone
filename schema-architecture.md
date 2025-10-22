

This Spring Boot application uses both MVC and REST controllers. Thymeleaf templates are used for the Admin and Doctor dashboards, while REST APIs serve all other modules.

The application interacts with two databases—MySQL (for patient, doctor, appointment, and admin data) and MongoDB (for prescriptions). All controllers route requests through a common service layer, which in turn delegates to the appropriate repositories. MySQL uses JPA entities while MongoDB uses document models.


Section 1: Architecture Summary

Section 2: Numbered Flow


1. User Interaction (UI Layer)
Thymeleaf-based web dashboard
REST API client

2. Controller Entry Point (Controller Layer)
Web request - Thymeleaf Controller
API request - REST Controller

3. Business Logic Invocation (Service Layer)

4. Data Access Request (Repository Layer)
JPA Repositories interact with MySQL
Mongo Repositories interact with MongoDB

5. Database Operations (Data Layer)
SQL queries (for MySQL)
Document operations (for MongoDB)

6. Model Binding (Entity/Document Mapping)
MySQL - JPA @Entity classes
MongoDB - @Document classes

7. Response Generation (UI/JSON Output)
Web flow - Thymeleaf - HTML
API flow - JSON - HTTP





