<?php
error_reporting(E_ALL);
define("RUSLAN", TRUE);
session_start();
include_once 'config.php';



// не забываем приоритет роутинга...общие роутинги должны бытьниже кокретных ,т.е array('url' => '#^/login#i', 'view' => 'login') должен стоять выше по списку чем
//array('url' => '#^/page/(?P<page_alias>[a-z0-9-]+)#i', 'view' => 'page'), чтоб ненароком не подподали под регулярные выражения

$routes = array(
	array('url' => '#^$|^\?#', 'view' => 'category'),

	array('url' => '#^product/(?P<product_alias>[a-z0-9-]+)#i', 'view' => 'product'),
	array('url' => '#^category/(?P<category_alias>[a-z0-9-]+)#i', 'view' => 'category'),
	array('url' => '#^cart#i', 'view' => 'cart'),
	array('url' => '#^login#i', 'view' => 'login'),

	array('url' => '#^logout#i', 'view' => 'logout'),
	array('url' => '#^forgot#i', 'view' => 'forgot'),
	array('url' => '#^registration#i', 'view' => 'reg'),
	//array('url' => '#^add_comment#i', 'view' => 'add_comment'),
	//array('url' => '#^page/(?P<page_alias>[a-z0-9-]+)#i', 'view' => 'page'),
	array('url' => '#^search#i', 'view' => 'search')
);


/*P<product_alias>  и P<id> создают ключ с такими же названиями (product_alias и id ) в массиве $match!! называется именованная подмаска!!в нашем случая они нужны для получения значений
<product_alias> и <id> и подстановки в "нужных местах",т.е. вывод категориий или продуктов*/


//ниже до foreach переделал из за портируемости(http заменяем на https в случае защишенного хапур чапура) 
//получаем PATH след образом:
$app_path = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];

//мы получим после верней строки http://ruslan/index.php, но в адр строке не должно высвечиваться index.php,поэтому ниже в регулярке удаляем index.php

$app_path = preg_replace('#[^/]+$#', '', $app_path);
//мы получим после верней строки http://ruslan/
define("PATH", $app_path);
// константа "PATH" определена ,теперь определим $url для роутингов:

$url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
//после верхней строки получаем(например) http://ruslan/page/contacts,
//но для роутингов нам нужно убрать http://ruslan/, поэтому  внизу и срезаем его

$url = str_replace(PATH, '', $url);
// после верней строки  поучаем   page/contacts 
foreach ($routes as $route) {
	if (preg_match($route['url'], $url, $match)) {
		$view = $route['view'];
		break;
	}
}

if (empty($match)) {
	header("HTTP/1.1 404 Not Found");
	include 'views/404.php';
	exit;
}

//print_r($match);
//extract($match)- ф -ия делает переменные из ключей массива ()!!!и подстановки в "нужных местах",т.е. вывод категориий ил продуктов
extract($match);


// после ф- ии extract($match) мы имеем :
// $id - ID категории  или $product_alias - alias продукта (зависит от запроса)
// 
// $view - вид для подключения

include "controllers/controller_{$view}.php";
