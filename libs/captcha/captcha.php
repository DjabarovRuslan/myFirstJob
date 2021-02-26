<?php
session_start();
//генерируем строку и берем первые 5 символов
$str = substr( md5(time()), 0, 5 );

//ниже исп- ем расширение Image Processing and GD для работы с картинками(см.документацию php  )
//ниже:создает новое изобр из файла
$image = imagecreatefromjpeg('captcha.jpg');
//ниже:Возвращает идентификатор цвета в соответствии с заданными RGB компонентами.
$text_color = imagecolorallocate($image, 100, 100, 100);
//в цикле меняем вид каждой "буквы"!!$x - отступ
for($i = 0, $x = 20; $i < strlen($str); $i++){
	$size = mt_rand(20, 30);
	$angle = mt_rand(-20, 20);
	imagettftext($image, $size, $angle, $x, 30, $text_color, 'arial.ttf', $str{$i});
	$x += 25;
}


$_SESSION['captcha'] = $str;
header("Content-type: image/jpeg");//читать GD для работы с картинками
//вывводим изображение в браузер
imagejpeg($image);

//сессия нам  понадобится для сравнения нашей каптчи с тем что вводит поль-ль:для этого сравниваем  $_SESSION['captcha'](в ней хранится рандомная строка ,которая высветилась у поль- ля ) и $_POST['checkcaptcha'] ( то ,что введет поль- ль ,копируя нашу каптчу)!!!'checkcaptcha - это name  инпута каптчи.проверяется это в function registration() из model_reg.php

