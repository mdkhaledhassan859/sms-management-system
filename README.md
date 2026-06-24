# SMS Management System (PHP)

A simple SMS gateway integration system with queue support and reporting.

## Features
- SMS API integration
- Queue processing
- Cron-based worker
- Logging system
- Extensible architecture

## Setup
1. Clone repository
2. Copy `.env.example` to `.env`
3. Set credentials
4. Run worker via cron

## Run worker
php cron/worker.php
