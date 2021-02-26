<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");
require_once 'controllers/controller_main.php';
require_once  "models/model_{$view}.php";



if(isset($_POST['log_in'])){
	authorization();
	redirect();
}
require_once  "views/view_{$view}.php";
