<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");

require_once  "models/model_{$view}.php";
//$_GET['title']) (по моему) поступает из AJAX запроса
//save_options() выдает на выходе или true или false,поэтому вниззу и поверяем
if( isset($_GET['title']) ){
		
	if( save_options() ){
		exit('Настройки сохранены');
	}else{
		exit('Ошибка сохранения настроек!');
	}
}
$get_options = get_options();
//внесли в БД новую опцию для изм -ий-это  "тема",создаем вападающий список тем 
$themes = get_themes();

require_once  "views/view_{$view}.php";


