<?php
require_once('functions.php');
require_once('data.php');

$main_content = include_template('main.php', [
    'categories' => $categories,
    'lots' => $lots,
]);

$layout_content = include_template('layout.php', [
    'main_content' => $main_content,
    'categories' => $categories,
    'title' => $title,
    'user_name' => $user_name,
    'is_auth' => $is_auth,
]);

print($layout_content);
