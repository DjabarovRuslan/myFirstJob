<?php
error_reporting(E_ALL);
define("RUSLAN", TRUE);
session_start();
require_once '../config.php';
// индексный файл админской части
// аналог индексного файла пользовательской части с изменениями
$app_path = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];

$app_path = preg_replace('#[^/]+$#', '', $app_path);
define("PATH", $app_path);
//определяем $url для роутингов

$url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$url = str_replace(PATH, '', $url);

//константа SITE нам нужна в админке для перехода из админской части сайта к реальному сайту и определяется она как $url админки "минус" (admin и слеш /),что и сделали внизу

 $site_url = rtrim( str_replace('admin', '', PATH), '/' );
define("SITE", $site_url);

// не забывать о приоритетах в роутингах
$routes = [
	 ['url' => '#^$|^\?#', 'view' => 'options'],
	 ['url' => '#^login#i', 'view' => 'login'],
	// ['url' => '#^category/(?P<category_alias>[a-z0-9-]+)#i', 'view' => 'category'],
	// ['url' => '#^category#i', 'view' => 'category'],
	// ['url' => '#^edit-product/(?P<product_id>[0-9-]+)|^edit-product#i', 'view' => 'edit_product'],
	// ['url' => '#^upload#i', 'view' => 'upload'],
	// ['url' => '#^add_product#i', 'view' => 'add_product'],
	// ['url' => '#^search_admin#i', 'view' => 'search_admin']
];

foreach ($routes as $route) {
	if( preg_match($route['url'], $url, $match) ){
		$view = $route['view'];
		break;
	}
}

if( empty($match) ){
	header("HTTP/1.1 404 Not Found");
	//include '../' . VIEW . '404.php';
	include 'views/404.php';
	exit;
}


require_once 'controllers/controller_main.php';

extract($match);

require_once "controllers/controller_{$view}.php";

