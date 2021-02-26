<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");
require_once "models/model_main.php";
// ниже подключаем в админской части model_main.php из пользовательской части,нужно для вывода меню категорий 
//require_once "../models/model_main.php";

check_remember();

if( !isset($_SESSION['auth']['is_admin']) || $_SESSION['auth']['is_admin'] != 1 ){
	$view = 'login';
}
