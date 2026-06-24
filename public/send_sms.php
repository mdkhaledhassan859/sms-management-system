<?php

require_once __DIR__ . '/../core/SmsService.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $to = $_POST['to'] ?? null;
    $message = $_POST['message'] ?? null;

    if (!$to || !$message) {
        exit("Missing phone number or message.");
    }

    $sms = new SmsService();
    $response = $sms->send($to, $message);

    echo "<h3>Response from Gateway:</h3>";
    echo "<pre>" . htmlspecialchars($response) . "</pre>";
}
