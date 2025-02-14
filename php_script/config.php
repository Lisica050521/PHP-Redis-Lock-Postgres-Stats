<?php

require 'vendor/autoload.php';

use Dotenv\Dotenv;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

$redis = new Predis\Client([
    'scheme' => 'tcp',
    'host'   => $_ENV['REDIS_HOST'],
    'port'   => $_ENV['REDIS_PORT'],
]);

// Ключ блокировки
$lockKey = $_ENV['LOCK_KEY'];
$lockDuration = $_ENV['LOCK_DURATION'];
