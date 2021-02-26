<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");
include 'controller_main.php';
include "models/model_{$view}.php";

 
// ['val'] получаем  из ajax из view_reg.php ,которая проверяет в форме поля  email, login на  пустоту и уникальность
 if(isset($_POST['val'])){
	echo access_field();
	exit;
}
//если нажата кнопка "регистрация"
if(isset($_POST['reg'])){
	
	registration();
//вызываем redirect() для сброса данных формы
	redirect();
}

 
 $breadcrumbs = "<li><a href='" .PATH. "'> Главная</a></li> / <li>Регистрация</li>";

include "views/view_{$view}.php"
?>