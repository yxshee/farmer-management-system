
---

# 🌾 Farmer Management System (FMS)

The **Farmer Management System (FMS)** is a web-based platform designed to simplify the management of farmers' profiles, agricultural product listings, and transaction monitoring. It offers farmers the ability to register, manage their profiles, add agro products for sale, and track system activities using real-time database triggers.

## 📜 Features

- **Farmer Registration**: Allows farmers to securely register, log in, and manage their personal profiles.
- **Agro Product Management**: Farmers can list, edit, and delete their agricultural products for sale.
- **Farming Type Addition**: Add various farming types that farmers can associate with their profiles.
- **Triggers Log**: Displays a real-time log of database actions such as insertions, updates, and deletions using SQL triggers.
- **User Authentication**: Secure login with password encryption to ensure safety and privacy.
- **Responsive Design**: The system is fully responsive and compatible with various devices.

## 🛠️ Tech Stack

- **Frontend**: HTML, CSS, Bootstrap
- **Backend**: Python (Flask Framework), Jinja2
- **Database**: MySQL with SQLAlchemy ORM
- **Triggers**: SQL Triggers for database event logging
- **Deployment**: Flask Development Server

## 📂 Folder Structure

```plaintext
FMS/
│
├── static/                # Static files (CSS, JS, Images)
│   ├── css/
│   │   └── style.css       # Custom styles
│   └── assets/
│       └── images/         # Logo and images
│
├── templates/             # HTML templates for Flask views
│   ├── index.html
│   ├── farmer_register.html
│   ├── agro_products.html
│   ├── add_farming.html
│   └── triggers.html
│
├── app.py                 # Main Flask application
├── models.py              # SQLAlchemy models for database
├── forms.py               # Flask forms for input validation
├── triggers.sql           # SQL script to create database triggers
├── db_setup.sql           # SQL script to initialize database tables
├── requirements.txt       # List of dependencies
└── README.md              # Project documentation
```

## 🚀 Getting Started

### Prerequisites

- **Python 3.x**
- **MySQL** installed and running on your machine

### Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yxshee/farmer-management-system.git
   cd farmer-management-system
   ```

2. **Create a virtual environment**:

   ```bash
   python3 -m venv env
   source env/bin/activate
   ```

3. **Install the dependencies**:

   ```bash
   pip install -r requirements.txt
   ```

4. **Set up the MySQL database**:

   - Run the `db_setup.sql` script in your MySQL environment to create the required tables.
   - Run the `triggers.sql` script to set up SQL triggers.

5. **Configure the database in `app.py`**:

   ```python
   app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://username:password@localhost/fms_db'
   ```

6. **Run the Flask application**:

   ```bash
   python app.py
   ```

   The app will be live at `http://localhost:5000`.

## 💡 Future Enhancements

- **Payment Gateway Integration**: Allow buyers to purchase products directly through the platform.
- **Detailed Reporting**: Add advanced reporting features to track farmer sales and performance.
- **State-Based Product Listings**: Introduce state quotas for product availability and filtering.

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

## 📝 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

**Designed & Developed with ❤️ by YXSHEE**

---
