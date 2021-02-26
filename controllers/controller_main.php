<?php
//include_once 'controller_main.php';
include_once "models/model_main.php";


/*как эксперимент кэшировал вывод категорий,если не нужен кэш раском-уй нижнюю строку*/
$categories = cacheCategory();
//$categories = get_cat();
$categories_tree = map_tree($categories);
$categories_menu = categories_to_string($categories_tree);



//внести товар в корзину


/*если нажата "в корзину ",то при помощи ajax получаем $_POST['idForCart'] записываем товар в сессию при помощи ф-ии addProduct() и также увеличиваем кол-во товаров в корз ине именно в момент нажатия "в корзину",а в остальное время (переход на др страницу,лазанья посайту ) коде в views/view_header.php вызываем ф-ию countItems() для показа кол- во товара 
 */ 
if(isset($_POST['idForCart'])){
 echo  $countItemsInCart = addProduct($_POST['idForCart'])	;  
exit($countItemsInCart);
}
// конец внести товар в корзину


// очищение корзины
if(isset($_POST['clearCart'])){

	 $tempo = clear();
	}

//очищение корзины 

//ниже: меню страниц(главная,о компании, контакты)
//$pages = get_pages();

// ниже ф- ия для проверки авторизации пользователя
//check_remember();


?>