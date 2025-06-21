#!/bin/bash

# ----------------------------------------
# Configurations
# ----------------------------------------
DB_NAME="users_db"
DB_USER="root"
DB_PASS="yourpassword"   # 🔐 Replace this with your desired root password
DB_HOST="localhost"

# ----------------------------------------
# Step 1: Install MySQL Server
# ----------------------------------------
echo "🔧 Installing MySQL Server..."

sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y mysql-server

# Secure MySQL installation (skip prompts)
echo "🔒 Securing MySQL Installation..."
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${DB_PASS}'; FLUSH PRIVILEGES;"

# ----------------------------------------
# Step 2: Enable and Start MySQL
# ----------------------------------------
echo "🚀 Starting MySQL service..."
sudo systemctl enable mysql
sudo systemctl start mysql

# ----------------------------------------
# Step 3: Create Database, Table, and Insert Records
# ----------------------------------------
echo "📦 Creating database and table..."

SQL_COMMANDS=$(cat <<EOF
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

USE ${DB_NAME};

CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(255),
  gender VARCHAR(20),
  phone VARCHAR(20),
  birth_date DATE,
  company_name VARCHAR(255),
  role VARCHAR(50),
  address_country VARCHAR(100)
);

INSERT INTO users (first_name, last_name, email, gender, phone, birth_date, company_name, role, address_country) VALUES
('John', 'Doe', 'john@example.com', 'male', '+123456789', '1990-01-01', 'Acme Corp', 'developer', 'USA'),
('Jane', 'Smith', 'jane@example.com', 'female', '+987654321', '1992-03-15', 'Tech Inc', 'designer', 'UK'),
('Alice', 'Johnson', 'alice@example.com', 'female', '+192837465', '1988-07-21', 'Creative Studio', 'manager', 'Canada');
EOF
)

# Execute SQL
mysql -u$DB_USER -p$DB_PASS -e "$SQL_COMMANDS"

# ----------------------------------------
# Step 4: Done
# ----------------------------------------
if [ $? -eq 0 ]; then
  echo "✅ MySQL installed and users_db created successfully!"
else
  echo "❌ Something went wrong. Check your credentials or MySQL status."
fi
