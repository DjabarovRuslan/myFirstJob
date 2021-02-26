<?php 
require_once  'controller_main.php';
require_once  "models/model_{$view}.php";

$productsInCart = getProducts();

        if ($productsInCart) {


            // Если в корзине есть товары, получаем полную информацию о товарах для списка
            // Получаем массив только с идентификаторами товаров
            $productsIds = array_keys($productsInCart);

            // Получаем массив с полной информацией о необходимых товарах
            $products = getProdustsByIds($productsIds);

            // Получаем общую стоимость товаров
            $totalPrice = getTotalPrice($products);
        }
   
   if(isset($_GET['delete-id']) && !empty($_GET['delete-id']))
   {
   	$tempo = $_GET['delete-id'];
      deleteProduct($tempo);   
      $referrer = $_SERVER['HTTP_REFERER'];
        header("Location: $referrer");
   }

require_once "views/view_{$view}.php";

 ?>