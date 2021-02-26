<?php defined("RUSLAN") or die("тебе сюда нельзя!!!");


/**
* начало восстановления пароля
**/
function forgot(){
	global $connection;
	$email = trim(mysqli_real_escape_string($connection, $_POST['email']));

	if( empty($email) ){
		$_SESSION['auth']['errors'] = 'Поле email не заполнено';
	}else{
		$query = "SELECT id FROM users WHERE email = '$email' LIMIT 1";
		$res = mysqli_query($connection, $query);
		if(mysqli_num_rows($res) == 1){
//$expire будет существоать 1 час
			$expire = time() + 3600;
			$hash = md5($expire . $email);
			$query = "INSERT INTO forgot (hash, expire, email)
						VALUES ('$hash', $expire, '$email')";
			$res = mysqli_query($connection, $query);
			if(mysqli_affected_rows($connection) > 0){
				// выше :если добавлена запись в таблицу forgot
//ниже :формируем ссылку для отрп на емейл				
				$link = PATH . "forgot/?forgot={$hash}";
				//ниже: тема письма
				$subject = "Запрос на восстановление пароля на сайте " . PATH;
				//тело письма
				$body = "По ссылке <a href='{$link}'>{$link}</a> вы найдете страницу с формой, где сможете ввести новый пароль. Ссылка активна в течение 1 часа.";
				//ниже необязательный параметр письма ,не путать с  переадр header
				$headers = "FROM: " . strtoupper($_SERVER['SERVER_NAME']) . "\r\n";
	//ниже:уст кодировку ,чтоб не было краказябров
				$headers .= "Content-type:text/html; charset=utf-8";
				mail($email, $subject, $body, $headers);

				$_SESSION['auth']['ok'] = 'На ваш email выслана инструкция по восстановлению пароля';
			}else{
				$_SESSION['auth']['errors'] = 'Ошибка!';
			}
		}else{
			$_SESSION['auth']['errors'] = 'Пользователь с таким email не найден';
		}
	}
}

/**
* проверка пользователя на изменение пароля
**/
function access_change(){
	
	global $connection;
	$hash = trim(mysqli_real_escape_string($connection, $_GET['forgot']));
	// если нет хэша
	if( empty($hash) ){
		$_SESSION['forgot']['errors'] = 'Перейдите по корректной ссылке';
		return;
	}

	$query = "SELECT * FROM forgot WHERE hash = '$hash' LIMIT 1";
	$res = mysqli_query($connection, $query);
	// если не найден хэш
	if(!mysqli_num_rows($res)){
		$_SESSION['forgot']['errors'] = 'Ссылка устарела или вы перешли по некорректной ссылке. Пройдите процедуру восстановления пароля заново';
		return;
	}
//получаем текущее время чтоб сравнить с expire(время запроса замены пароля, мы даем 1 час на воод нов пароля)
	$now = time();
	$row = mysqli_fetch_assoc($res);

	// если ссылка устарела
	if($row['expire'] - $now < 0){
		$_SESSION['forgot']['errors'] = 'Ссылка устарела. Пройдите процедуру восстановления пароля заново';
		return;
	}
}

/**
* смена пароля
**/
function change_forgot_password(){
	global $connection;
	$hash = trim(mysqli_real_escape_string($connection, $_POST['hash']));
	$password = trim($_POST['new_password']);

	if( empty($password) ){
		$_SESSION['forgot']['change_error'] = "Не введен пароль";
		return;
	}

	$query = "SELECT * FROM forgot WHERE hash = '$hash' LIMIT 1";
	$res = mysqli_query($connection, $query);
	// если не найден хэш
	if(!mysqli_num_rows($res)) return;
//проверим еще раз на сроки хеша
	$now = time();
	$row = mysqli_fetch_assoc($res);

	// если ссылка устарела,то  удалим не только текущую ссылку но и все у которых время жизни превысило 1 час к текущему времени за ненанобностью
	if($row['expire'] - $now < 0){
		mysqli_query($connection, "DELETE FROM forgot WHERE expire < $now");
		return;
	}
//не путать  ..пароль меняем в таблице users
	$password = md5($password);
	mysqli_query($connection, "UPDATE users SET password = '$password' WHERE email = '{$row['email']}'");
	//выше:$row['email'] это из запроса стока 91.т.к.запрос захватывает всю строку
	//ниже:после смены пароля удаляем все записи связанные с этим емейлом из forgot
	mysqli_query($connection, "DELETE FROM forgot WHERE email = '{$row['email']}'");
	$_SESSION['forgot']['ok'] = "Вы успешно сменили пароль. Теперь можно авторизоваться";
}

