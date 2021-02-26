<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");

include "models/model_main.php";
// в этот контроллер мы попадаем если польз.нажал "выход"
//models/model_main.php подкл- ем из за  ф-ии redirect() ...после выхода попасть на ту же страницу с которой сделан выход
//принцип удалений:раз мы попали на этот контроллер ,значит польз. нажал "выход",и мы проверяем если сущ. куки  то удаляем из БД тоже

 if( isset($_COOKIE['hash']) ){
	$hash = mysqli_real_escape_string($connection, $_COOKIE['hash']);
	$query = "UPDATE users SET remember = '' WHERE remember = '$hash'";
	mysqli_query($connection, $query);
	setcookie('hash', '', time() - 3600);
}
 unset($_SESSION['auth']);
 redirect();

?>