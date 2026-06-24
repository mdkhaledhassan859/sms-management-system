CREATE TABLE sms_queue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    status ENUM('pending', 'processing', 'sent', 'failed') DEFAULT 'pending',
    attempts INT DEFAULT 0,
    last_error TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE sms_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    queue_id INT NULL,
    phone VARCHAR(20) NOT NULL,
    message TEXT NOT NULL,
    gateway_response TEXT NULL,
    gateway_message_id VARCHAR(100) NULL,
    status ENUM('sent', 'failed') NOT NULL,
    cost DECIMAL(10,2) DEFAULT 0.00,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (queue_id) REFERENCES sms_queue(id)
        ON DELETE SET NULL
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sms_usage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    total_sent INT DEFAULT 0,
    total_failed INT DEFAULT 0,
    date DATE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE SET NULL
);
