<?php

require_once __DIR__ . '/Logger.php';

class SmsService {

    public function send($to, $message) {

        $config = include __DIR__ . '/../config/config.php';

        $curl = curl_init();

        curl_setopt_array($curl, [
            CURLOPT_URL => $config['api_url'],
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_POST => true,
            CURLOPT_POSTFIELDS => http_build_query([
                'user' => $config['sms_user'],
                'password' => $config['sms_password'],
                'to' => $to,
                'text' => $message
            ])
        ]);

        $response = curl_exec($curl);
        curl_close($curl);

        // LOG RESPONSE
        Logger::log("Phone: $to | Message: $message | Response: $response");

        return $response;
    }
}
