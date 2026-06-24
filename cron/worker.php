<?php

require_once __DIR__ . '/../core/SmsService.php';

$sms = new SmsService();

// Example queue data
$queue = [
    ['to' => '017xxxxxxxx', 'message' => 'Test SMS']
];

foreach ($queue as $job) {
    $response = $sms->send($job['to'], $job['message']);
    echo $response . PHP_EOL;
}
