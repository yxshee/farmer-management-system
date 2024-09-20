
---

# Report on Farmer Management System (FMS)

## 1. **Introduction**
The **Farmer Management System (FMS)** is a web-based platform designed to streamline the management of farmers' profiles, agricultural product listings, and transaction monitoring through a secure, user-friendly interface. It allows farmers to manage their information, add agricultural products for sale, and provides an easy way for users to view and purchase these products. The system also tracks database events like product additions, updates, and deletions using SQL Triggers.

### Objective
The main objective of this system is to:
- Provide an easy-to-use platform for farmers to manage their profiles and product listings.
- Create a transparent and secure environment to monitor all system changes via database triggers.
- Provide a responsive web interface compatible with multiple devices.

## 2. **Key Features**

- **Farmer Registration**: Secure registration and login functionality for farmers to create and manage their profiles.
- **Agro Product Management**: Farmers can add, update, and delete agro products for potential buyers.
- **Farming Type Addition**: The system allows administrators or farmers to add different types of farming techniques.
- **Triggers Log**: Provides a detailed log of system changes (insertions, updates, and deletions) using SQL triggers.
- **User Authentication**: Implements a login system with password encryption to ensure secure access to the platform.
- **Responsive Design**: The front-end is designed to be responsive and works seamlessly across various devices.

## 3. **Technologies Used**

### Frontend:
- **HTML, CSS, Bootstrap**: The user interface is designed using HTML and CSS with Bootstrap for responsive design. 
- **JavaScript**: Minimal JavaScript is used for form validation and enhancing user interactions.

### Backend:
- **Python (Flask Framework)**: Flask is used as the backend framework to handle HTTP requests, user sessions, and database operations.
- **Jinja2 Templating**: Jinja2 is used as the templating engine to render HTML pages dynamically.
- **SQLAlchemy**: SQLAlchemy is used as the Object-Relational Mapping (ORM) to interact with the MySQL database.
- **MySQL**: MySQL is the relational database used to store all system data, including farmers, products, and trigger logs.

### Database:
- **Relational Database (MySQL)**: The system uses a MySQL database with well-defined tables and relations.
- **SQL Triggers**: Special SQL triggers are implemented to log changes made to the database (insert, update, delete).
  
## 4. **System Functionalities**

### 4.1 Farmer Registration
The system allows farmers to register by providing their personal details such as name, age, phone number, and farming type. The registration process includes input validation and encryption of sensitive data like passwords. After successful registration, farmers can log in and manage their accounts.

#### Code (Flask):
```python
@app.route('/signup', methods=['POST', 'GET'])
def signup():
    if request.method == 'POST':
        # Get form data
        username = request.form['username']
        email = request.form['email']
        password = generate_password_hash(request.form['password'])  # Password encryption
        # Store user in the database
        new_user = User(username=username, email=email, password=password)
        db.session.add(new_user)
        db.session.commit()
        return redirect(url_for('login'))
    return render_template('signup.html')
```

### 4.2 Agro Product Management
Farmers can manage their agro products by adding new products, updating existing ones, and deleting products. The product details such as name, description, and price are stored in the database. The products can be viewed and purchased by potential buyers.

#### Database Schema:
```sql
CREATE TABLE addagroproducts (
    pid INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    productname VARCHAR(100),
    productdesc VARCHAR(300),
    price INT
);
```

#### Code (Flask):
```python
@app.route('/addagroproduct', methods=['POST', 'GET'])
@login_required
def addagroproduct():
    if request.method == "POST":
        # Get form data
        productname = request.form.get('productname')
        productdesc = request.form.get('productdesc')
        price = request.form.get('price')
        # Add product to the database
        product = Addagroproducts(productname=productname, productdesc=productdesc, price=price)
        db.session.add(product)
        db.session.commit()
        flash("Product Added Successfully", "success")
        return redirect('/agroproducts')
    return render_template('addagroproducts.html')
```

### 4.3 Farming Type Addition
The system allows administrators or users with sufficient privileges to add various farming types. This feature is designed to enable farmers to classify their farming activities when registering or managing their profiles.

#### Code:
```python
@app.route('/addfarming', methods=['POST', 'GET'])
@login_required
def addfarming():
    if request.method == "POST":
        farmingtype = request.form.get('farming')
        if Farming.query.filter_by(farmingtype=farmingtype).first():
            flash("Farming Type Already Exists", "warning")
        else:
            new_farming = Farming(farmingtype=farmingtype)
            db.session.add(new_farming)
            db.session.commit()
            flash("Farming Type Added", "success")
    return render_template('addfarming.html')
```

### 4.4 Triggers Log
The system logs all changes made to the database, such as when a farmer is added, updated, or deleted. This ensures transparency and accountability by using SQL Triggers.

#### SQL Triggers:
```sql
CREATE TRIGGER after_insert_register
AFTER INSERT ON register
FOR EACH ROW
BEGIN
    INSERT INTO trig (fid, action) VALUES (NEW.rid, 'FARMER INSERTED');
END;
```

#### Code to View Logs (Flask):
```python
@app.route('/triggers')
@login_required
def triggers():
    logs = Trig.query.all()
    return render_template('triggers.html', query=logs)
```

### 4.5 User Authentication
The platform uses secure authentication for users. Passwords are encrypted using **Werkzeug**'s password hashing function, and sessions are managed via Flask's session management system.

#### Code:
```python
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == "POST":
        email = request.form.get('email')
        password = request.form.get('password')
        user = User.query.filter_by(email=email).first()
        if user and check_password_hash(user.password, password):
            login_user(user)
            flash("Login Successful", "success")
            return redirect(url_for('index'))
        else:
            flash("Invalid Credentials", "danger")
    return render_template('login.html')
```

## 5. **Technical Details**

- **Database Normalization**: The database is normalized to remove redundancy. For instance, user information is stored in separate tables with clear relationships defined via foreign keys.
- **Encryption**: Passwords are securely hashed using `Werkzeug` to ensure that no plaintext passwords are stored.
- **SQLAlchemy ORM**: Used to map Python objects to database tables, simplifying database interaction while maintaining security.
- **Jinja2 Templating**: HTML templates are dynamically rendered using Jinja2, which allows easy integration with Flask variables and logic.

## 7. **Conclusion**
The **Farmer Management System (FMS)** successfully provides a user-friendly interface for farmers to manage their profiles and agro products. The implementation of SQL triggers ensures a transparent system by logging all significant actions. The use of Flask and SQLAlchemy has made the backend robust, while Bootstrap ensures a responsive front-end.

## 7. **Future Enhancements**
- **Online Payment Integration**: Add a payment gateway for direct transactions.
- **Report Generation**: Implement advanced reporting features to track product sales and farmer performance.
- **State Quotas**: Introduce state-based quotas for product listings.

## 8. **References**
- Flask Documentation: https://flask.palletsprojects.com/
- SQLAlchemy ORM: https://www.sqlalchemy.org/
- MySQL Documentation: https://dev.mysql.com/doc/

---
