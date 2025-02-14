<?php

require 'config.php';

/**
 * Проверка, занят ли уже скрипт.
 * @param Predis\Client $redis
 * @param string $lockKey
 * @return bool
 */
function isScriptLocked($redis, $lockKey) {
    return $redis->exists($lockKey);
}

/**
 * Установка блокировки на заданное время.
 * @param Predis\Client $redis
 * @param string $lockKey
 * @param int $duration
 */
function setScriptLock($redis, $lockKey, $duration) {
    $redis->setex($lockKey, $duration, 'locked');
}

/**
 * Удаление ключа блокировки.
 * @param Predis\Client $redis
 * @param string $lockKey
 */
function releaseScriptLock($redis, $lockKey) {
    $redis->del($lockKey);
}