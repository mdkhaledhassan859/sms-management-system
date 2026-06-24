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
