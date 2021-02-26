<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");


//не понятно пока :авторизация может происходить из любой страницы (не только из главной)и после авт.  пользователь должен  вернуться на эту же страницу



include "models/model_main.php";
include "models/model_{$view}.php";

if(isset($_POST['log_in'])){
	//print_arr($_POST);
	//exit;
	authorization();
//redirect() ф- ия  для возврата на ту же стр где и авторизовались
	redirect();
}
else{
	header("Location: " . PATH);
}
 
?>