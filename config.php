<?php

defined("RUSLAN") or die("тебе сюда нельзя!!!");
define("DBHOST", "localhost");
define("DBUSER", "root");
define("DBPASS", "1234");
define("DB", "new_catalogdb");
//define("PATH","http://myfirstjob/");
//define("PRODUCTIMG", "userfiles/products/");
//define("VIEW", "views/apple/");
define("PERPAGE", 6); //кол- во товаров на странице



$connection = @mysqli_connect(DBHOST, DBUSER, DBPASS, DB) or die("Нет соединения с БД");
mysqli_set_charset($connection, "utf8") or die("Не установлена кодировка соединения");
