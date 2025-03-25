

# 🏥 **Doctor Appointment System**

This project contains the SQL scripts and backend logic required to set up a **Doctor Appointment System** using **Oracle 21c XE** with PL/SQL. It ensures seamless management of doctor and patient information with integrated business logic.

---

## 📚 **Introduction**

The **Doctor Appointment System** is a comprehensive web-based application designed to simplify and automate the process of booking medical appointments. Developed using **Java, JSP, HTML, and CSS** in NetBeans, with **SQL*Plus** as the PL/SQL database, this system ensures efficient management of both doctor and patient information.

The project is structured around two databases:
- One for storing doctors' information, including their availability and specialties.
- Another for managing appointment details.

This dual-database structure allows for smooth data handling and faster retrieval of critical information.

To maintain data integrity and enhance functionality, the system incorporates various **PL/SQL constraints** such as **triggers, sequences, procedures, views, and functions**. Key business rules are enforced using triggers like:
- `limit_doctor_appointments` – ensures appointments do not exceed limits.
- `prevent_past_date_appointments` – prevents booking appointments for past dates.

**Sequences** such as `appointments_seq` automatically generate unique appointment IDs, minimizing duplication risks. Stored **procedures** like `book_appointment` and `list_doctor_appointments` streamline appointment booking and management processes.

Additionally, **functions** like `cancel_appointment` manage appointment cancellations efficiently, while **views** like `doctor_weekly_schedule` and `appointment_details_view` provide summarized reports for quick administrative access.

This robust backend, combined with an intuitive front-end interface, creates a reliable, secure, and user-friendly appointment management solution that caters to the dynamic needs of modern healthcare systems.

---

## 📂 **Project Structure**
```
/hospital_db
├── 📄 hospital_db_setup.sql  # Main SQL script to create and initialize the database
└── 📄 README.md              # Project documentation
```

---

## ⚙️ **Software Requirements**

1. **IDE:** NetBeans (for developing and running JSP, HTML, and CSS files).  
2. **Server:** Apache Tomcat (to host and execute the web application).  
3. **Database Management System (DBMS):** SQL*Plus (Oracle 21c XE) for creating and using the PL/SQL database.  
4. **Programming Languages:**  
   - JSP (Java Server Pages) for server-side scripting.  
   - HTML and CSS for front-end design.  
5. **Java Development Kit (JDK):** To run Java-based web applications.  
6. **Operating System:** Compatible with Windows, Linux, or macOS.  
7. **Web Browser:** Google Chrome, Mozilla Firefox, or any modern browser (for testing and using the application).  

---

## 🖥️ **Hardware Requirements**

1. **Processor:** Minimum Intel i5 or AMD Ryzen 5 with 8 GB RAM.  
2. **Internet Connection:** Stable connection for smooth operation.  
3. **Storage:** Sufficient space to store program files and database records.  

---

## 🔥 **PL/SQL Constraints Used in the Project**

### ✅ **Triggers:**
- **`prevent_past_date_appointments`**: Prevents booking appointments for past dates.

### 🔄 **Sequences:**
- **`appointments_seq`**: Auto-generates unique appointment IDs.

### 📚 **Procedures:**
- **`book_appointment`**: Handles new appointment booking logic.

### 👀 **Views:**
- **`appointments_overview`**: Provides a general overview of all appointments.

### 📝 **Functions:**
- **`cancel_appointment`**: Manages appointment cancellation logic efficiently.


## 🚀 **How to Run**

1. Open **SQL*Plus** or any Oracle SQL client.  
2. Connect to the database:
```bash
sqlplus C##SOHAM/password
```
3. Run the SQL script:
```sql
@path/to/hospital_db_setup.sql
```

---

## 📥 **Installation**

To clone this repository:
```bash
git clone https://github.com/yourusername/hospital_db.git
```
Move into the directory:
```bash
cd hospital_db
```

---

## 💡 **Usage**
- Run the `hospital_db_setup.sql` script to create and configure the database.
- Use the procedures and functions to manage appointments.



## 📧 **Contact**
For any inquiries, reach out to:
- **Email:** your.email@example.com
- **GitHub:** [yourusername](https://github.com/yourusername)

---

🎉 Happy Coding!

---
