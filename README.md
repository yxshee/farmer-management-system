

# 🌾 Farmer Management System (FMS)

**Farmer Management System (FMS)** is a web-based platform designed to simplify the buying and selling of agricultural products. The system allows farmers to register their details, add farming types, and list agro products for buyers to purchase. The system logs all activities in the database, including actions such as product additions, updates, and deletions, making management transparent and efficient.

## 📜 Features

- **Farmer Registration:** Secure registration and login for farmers to manage their profiles.
- **Agro Product Management:** Add, update, and delete agro products with a simple and user-friendly interface.
- **Farming Type Addition:** Easy addition of different farming types to the database.
- **Triggers Log:** Real-time view of database trigger logs for monitoring system changes.
- **Responsive Design:** Fully responsive web design, ensuring compatibility with all devices.
- **Secure Authentication:** Uses encryption for passwords and login credentials.

## 🛠️ Tech Stack

- **Frontend:** HTML, CSS, JavaScript, Bootstrap 4
- **Backend:** Python (Flask), Jinja2 Templating
- **Database:** MySQL with SQLAlchemy ORM
- **Triggers:** SQL Triggers for managing database events
- **Deployment:** Flask Development Server

## 📂 Folder Structure

```plaintext
FMS/
│
├── static/              # Static files (CSS, JS, Images)
│   ├── css/
│   └── assets/
│
├── templates/           # HTML templates for Flask views
│   ├── index.html
│   ├── farmer_register.html
│   ├── agro_products.html
│   ├── add_farming.html
│   └── triggers.html
│
├── app.py               # Main Flask application
├── models.py            # SQLAlchemy models for database
├── forms.py             # Flask-WTF forms for input validation
├── triggers.sql         # SQL script to create database triggers
├── db_setup.sql         # SQL script to initialize database tables
├── requirements.txt     # List of dependencies
└── README.md            # Project documentation
```

## 🚀 Getting Started

### Prerequisites

- **Python 3.x**
- **MySQL** installed and running

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/farmer-management-system.git
   cd farmer-management-system
   ```

2. Create a virtual environment and activate it:

   ```bash
   python3 -m venv env
   source env/bin/activate
   ```

3. Install the required dependencies:

   ```bash
   pip install -r requirements.txt
   ```

4. Set up the database:

   - Run the `db_setup.sql` script in your MySQL database.
   - Run the `triggers.sql` script to create the necessary triggers.

5. Configure the database URL in `app.py`:

   ```python
   app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://username:password@localhost/fms_db'
   ```

6. Run the Flask application:

   ```bash
   python app.py
   ```

   The app will be live at `http://localhost:5000`.

## 🔍 Usage

1. Navigate to the homepage and register as a farmer.
2. Add agro products through the dashboard.
3. Monitor actions in the **Triggers Log** section to track system changes.

## 💡 Future Enhancements

- **Online Payments Integration:** Allow payments directly through the platform.
- **State Quotas for Products:** Customize product listings based on state or region.
- **Advanced Reporting:** Generate detailed reports on sales and inventory.

## 🤝 Contributing

We welcome contributions! If you'd like to improve this project:

1. Fork the repository.
2. Create a new feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

---
