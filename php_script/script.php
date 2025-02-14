<?php

require 'vendor/autoload.php';

$config = require 'config.php';

$redis = $config['redis'];
$lockKey = $config['lockKey'];
$lockDuration = $config['lockDuration'];

require 'lock.php';

if (isScriptLocked($redis, $lockKey)) {
    echo "Скрипт уже выполняется! Ожидайте...\n";
    exit;
}

setScriptLock($redis, $lockKey, $lockDuration);

echo "Скрипт начал выполнение...\n";
sleep(5);

echo "Скрипт завершил выполнение!\n";

releaseScriptLock($redis, $lockKey);
