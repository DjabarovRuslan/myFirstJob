<?php
//defined("RUSLAN") or die("тебе сюда нельзя!!!");
//include 'translit.php';
function print_arr($array){
	echo "<pre>" . print_r($array, true) . "</pre>";
}

// $meta ГЛОБАЛЬНАЯ!!!ф- ия для использования в контроллерах (категории,продукты),в нашем случае мы пока реализовали получение метаданных для продукта (controller_product.php).самому сделать аналогично для категории(если сможешь)

function redirect($http = false){
	if($http) {$redirect = $http;}
	else
	{$redirect = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : PATH;}
    header("Location: $redirect");
	exit;
}

 
 function isAjax() {
        return isset($_SERVER['HTTP_X_REQUESTED_WITH']) && $_SERVER['HTTP_X_REQUESTED_WITH'] === 'XMLHttpRequest';
    }



?>