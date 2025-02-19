<?php

require 'config.php';

use Predis\Client;

/**
 * Проверка, занят ли уже скрипт.
 * @param Client $redis
 * @param string $lockKey
 * @return bool
 */
function isScriptLocked(Client $redis, string $lockKey): bool {
    return (bool) $redis->exists($lockKey);
}

/**
 * Установка блокировки на заданное время.
 * @param Client $redis
 * @param string $lockKey
 * @param int $duration
 * @return void
 */
function setScriptLock(Client $redis, string $lockKey, int $duration): void {
    $redis->setex($lockKey, $duration, 'locked');
}

/**
 * Удаление ключа блокировки.
 * @param Client $redis
 * @param string $lockKey
 * @return void
 */
function releaseScriptLock(Client $redis, string $lockKey): void {
    $redis->del($lockKey);
}