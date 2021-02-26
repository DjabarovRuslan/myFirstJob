<?php
//defined("RUSLAN") or die("тебе сюда нельзя!!!");
require_once 'controller_main.php';

require_once "models/model_{$view}.php";


/*echo 'controller_product';
echo '<br>';
echo "это переменная product_alias:$product_alias";
echo '<br>';
echo "это переменная view:$view";*/
	
	$get_one_product = get_one_product($product_alias);
	//print_arr($get_one_product);
 
  // ниже проверка ,если польз обращается не к существующему продукту

  if(!$get_one_product){
   header("HTTP/1.1 404 Not Found");
 include 'views/404.php';
  exit();
}
 
$id = $get_one_product['parent'];


include "libs/breadcrumbs.php";

//require_once "views/view_{$view}.php";
require_once 'views/view_product.php';
?>