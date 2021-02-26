<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");
/**
 * Массив настроек сайта для редактирования
 **/
function get_options(){
	global $connection;
	$query = "SELECT * FROM options";
	$res = mysqli_query($connection, $query);
	if($res){
		return mysqli_fetch_all($res, MYSQLI_ASSOC);
	}
	return false;
}

//внесение изменений в странице настроек в БД
function save_options(){
	global $connection;
	//!!изменять в настройках можно значение полей "курс","Контактный email и т.д и в БД им соответствуют поля 'course', 'email'и т.д.,так вот при выводе на странице  в  name инпута каждого поля прописывается соответствующий 'course', 'email'и т.д., !!! в AJAX запросе(data: {val: val, title: title}) измененное поле в этот скрипт поступает как $_POST['title'] и $_POST['val'].!! В $_POST['title'] может быть'course' или 'email' и т.д. а в $_POST['val'] измененное значение . В целяях безопасности создаем след. массив и проверяем есть ли  $_POST['title'] в массиве $options(исключаем SQL инъекцию )
	$options = ['course', 'email', 'pagination', 'site_title', 'theme','theme'];
	if(!in_array($_GET['title'], $options)) return false;
	$value = mysqli_real_escape_string($connection, $_GET['val']);
	$query = "UPDATE options SET value = '$value' WHERE title = '{$_GET['title']}'";
	$res = mysqli_query($connection, $query);
	//ниже :если запрос что то изменил в таблице
	if(mysqli_affected_rows($connection) > 0){
		return true;
	}else{
		return false;
	}
}
//внесли в БД новую опцию для изм -ий-это  "тема",создаем вападающий список тем 
function get_themes(){
	//ниже: путь к папке с темами(__DIR__ текущее место,1- ый слеш это корень admin,2 -ой слеш это корень сайта(ни куя не понятны эти слеши и путь ))!!views это папка с темами
	$themes_path = __DIR__ . '/../../views/';
	//ниже: прочитать все что находится в этой папке
	$dirs = scandir($themes_path);
   //ф- ия scandir выводит содержимое папки views в виде массива:

/*(
    [0] => .(точка  это текущая папка)
    [1] => ..(2 точки это папка на уровень выше)
    [2] => apple
    [3] => basic
    [4] => tpl1
    [5] => view_category_template.php
    [6] => view_comments_template.php
)*/
//убираем из этого массива то что не папка (view_comments_template.php  не папка , т.к. он файл) и  "папки - точки"(0 и 1 элементы)!!КАК ПЕРЕМУДРИЛ ,НЕУЖЕЛИ НЕЛЬЗЯ ПО ДРУГОМУ
	
	$themes = [];
	foreach($dirs as $item){
//ниже :если в указанном пути находится каталог(папка),$themes_path . $item это путь(без пути работать не будет)
		if( is_dir($themes_path . $item) && $item != '.' && $item != '..' ){
			$themes[] = $item;
		}
	}
	return $themes;
	 //получим :
/*	Array
(
    [0] => apple
    [1] => basic
    [2] => tpl1
)*/
}