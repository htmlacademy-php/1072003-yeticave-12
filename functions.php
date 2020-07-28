<?php
function format_cost (float $cost): string
{
    $cost = ceil($cost);

    if($cost >= 1000) {
        $cost = number_format($cost, 0, '.', ' ');
    }
    return "{$cost} ₽";
}

function esc(string $str): string
{
    $text = htmlspecialchars($str);

    return $text;
}

function include_template($name, $data)
{
    $name = 'templates/' . $name;
    $result = '';

    if (!file_exists($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}

function get_dt_range(string $date): array
{
    $secs_in_hour = 3600;
    $secs_in_minute = 60;
    $dt_end = strtotime($date);
    $dt_now = time();
    $dt_diff = $dt_end - $dt_now;
    $hours_until_end = floor($dt_diff / $secs_in_hour);
    $minutes_until_end = floor(($dt_diff % $secs_in_hour) / $secs_in_minute);

    $arr = [$hours_until_end, $minutes_until_end];

    return $res = array_map(function($num) {
        return str_pad($num, 2, "0", STR_PAD_LEFT);
    }, $arr);
}
