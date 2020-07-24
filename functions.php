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
