🏥 **Doctor Appointment System**  
This project contains the SQL scripts and backend logic required to set up a **Doctor Appointment System** using **Oracle 21c XE** with PL/SQL. It ensures seamless management of doctor and patient information with integrated business logic.

---

## 📚 Introduction  
The **Doctor Appointment System** is a web-based application developed using **Java, JSP, HTML, and CSS** to simplify and automate the process of booking medical appointments.

---

## 📁 Project Structure  
```
- /
- PLSQL-JSP-PROJECT-master/
    - AppointmentDB.sql
    - README.md
    - build.xml
    - nbproject/
        - ant-deploy.xml
        - build-impl.xml
        - genfiles.properties
        - project.properties
        - project.xml
    - src/
        - conf/
            - MANIFEST.MF
    - web/
        - adminLogin.jsp
        - bookAppointment.jsp
        - cancelAppointment.jsp
        - drpng.webp
        - home.css
        - home.jsp
        - index.css
        - index.html
        - index.jsp
        - oracleConnect2.jsp
        - success.jsp
        - META-INF/
            - context.xml
```

---

## ⚙️ Installation & Setup  
1. **Clone the Repository**  
```
git clone https://github.com/yourusername/PLSQL-JSP-PROJECT.git
```

2. **Import the Project into NetBeans or Eclipse**  

3. **Configure Database**  
   - Import `AppointmentDB.sql` into Oracle 21c XE.  
   - Update `oracleConnect2.jsp` with the correct database connection details.

4. **Deploy Project**  
   - Deploy using Apache Tomcat or any compatible servlet container.

---

## 🚀 How to Run  
1. Start your Tomcat server.  
2. Access the application at:  
```
http://localhost:8080/PLSQL-JSP-PROJECT-master/web/index.jsp
```

---

## 📄 Database Schema & Setup  
- The SQL script `AppointmentDB.sql` contains all the required DDL and DML commands.  
- Ensure that the database is configured properly before running the application.

---

## 📝 Key JSP Files Overview  
- `adminLogin.jsp` - Admin login interface.  
- `bookAppointment.jsp` - Allows patients to book appointments.  
- `cancelAppointment.jsp` - Handles appointment cancellations.  
- `index.jsp` - Home page and landing interface.

---

## 📌 Key Features  
✅ Secure admin and patient login system.  
✅ Easy booking and cancellation of appointments.  
✅ Role-based access and control.  
✅ Oracle PL/SQL-based backend for business logic.  

---


## 📞 Support  
For any issues or support, please contact:  
- GitHub Issues: [Open an Issue](https://github.com/yourusername/PLSQL-JSP-PROJECT/issues)
