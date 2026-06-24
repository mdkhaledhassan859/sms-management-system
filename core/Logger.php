<?php

class Logger {

    public static function log($message) {
        $file = __DIR__ . '/../logs/sms.log';

        $time = date('Y-m-d H:i:s');
        $entry = "[$time] " . $message . PHP_EOL;

        file_put_contents($file, $entry, FILE_APPEND);
    }
}
