<?php 
defined("RUSLAN") or die("тебе сюда нельзя!!!");

/**
* проверка доступности поля!!
* 
*как я понял в целях безопасности эта  ф-ия проверяет вхоящие из формы post данные,т.е.в параметре data-field  должно быть значение или  login или email, остальные отсекаем
* // ['val'] получаем  из ajax из view_reg.php 
* ['dataField'] получаем из формы ...у инпутов login и  email есть параметры data-field со значениями login и  email, ,они поступают на  ajax и из него получаем ['dataField']в зависимости на какой инпут польз нажал
**/
function access_field(){
	
	global $connection;
	//по моему эта  ф-ия срабатывать будет по отдельности для 'login' и отдельно для 'email,в зависимости какое поле заполняет поль- ль
	//смысл ф- ии прроверка  при помощи AJAX  уникальности полей и формата емайла


	// список возможных полей( у нас их 2 )
	$fields = array('login', 'email');
	$val = trim(mysqli_real_escape_string($connection, $_POST['val']));
	$field = $_POST['dataField'];
	
	//присутствует ли в $field значение равное эл-ту массива $fields(или login или email),если б  проверяли бы и другие поля  формы то массив $fields включал бы его тоже 
	
	if(!in_array($field, $fields)){
		$res = array('answer' => 'no', 'info' => 'Ошибка!');
		return json_encode($res);
	}
	//ниже:проверка емайла на соответствие формату(валидация )
	if( $field == 'email' && !empty($val) ){
		if(!preg_match("#^\w+@\w+\.\w+$#i", $val)){
			$res = array('answer' => 'no', 'info' => "Email не соответствует формату");
			return json_encode($res);
		}
	}

  $query = "SELECT id FROM users WHERE $field = '$val'";
	$res = mysqli_query($connection, $query);
	if(mysqli_num_rows($res) > 0){
		$res = array('answer' => 'no', 'info' => "Выберите другой $field");
		return json_encode($res);
	}else{
		$res = array('answer' => 'yes');
		return json_encode($res);
	}
   
	
	//"no" или "yes" поступают в ajax из view_reg.php ..они  и меняют значки после инпута почта в зависимости от того есть ли емайл в БД подобный тому что ввели
}

/**
* регистрация
* 
* !!ВСЯ МУТЬ ПО ПРОВЕРКЕ существования в БД емейла и логина в этой ф- ии сводится к случаю когда  польз при регистрации ввел логин от одной учетной записи из БД и почту от другой от другой учетной записи
**/
function registration(){
	global $connection;
	$errors = '';
	//ниже: этот массив нужен для перевода на русский язык значений 'login'и 'email'  для подстановки в конце этой ф-ии в нужные места строка 84
	$fields = array('login' => 'Логин', 'email' => 'Email');
	$login = trim($_POST['login_reg']);
	$password = trim($_POST['password_reg']);
	$password2 = trim($_POST['password_reg2']);
	$name = trim($_POST['name_reg']);
	$email = trim($_POST['email_reg']);
// муть ..автор перебрал с проверками!!$post -создан чтоб проверить с $_POST,типа пробелы что ли убрать ни куя не  понятео !!!переделаю потом под свои нужды 
	$post = array($login, $email);//не путать с  $_POST
	$checkcaptcha = trim($_POST['checkcaptcha']);
//  $errors обрамляем в лишки
	if(empty($login)) $errors .= '<li>Не указан логин</li>';
	if(empty($password)) $errors .= '<li>Не указан пароль</li>';
	if(empty($name)) $errors .= '<li>Не указано имя</li>';
	if(empty($email)) $errors .= '<li>Не указан email</li>';
	if( !empty($email) ){
		//валидация емайла самая простая,просто как пример
		if(!preg_match("#^\w+@\w+\.\w+$#i", $email)){
			$errors .= '<li>Email не соответствует формату</li>';
		}
	}
	if( $password != $password2 ) $errors.= '<li>Пароли не совпадают</li>';
	if( $checkcaptcha != $_SESSION['captcha'] ) $errors.= "<li>Неверно введен проверочный код</li>";
	if(!empty($errors)){
		// не заполнены обязательные поля
		$_SESSION['reg']['errors'] = "Ошибка регистрации: <ul>{$errors}</ul>";
		return;
	}

	$login = mysqli_real_escape_string($connection, $login);
	$password = md5($password);
	$name = mysqli_real_escape_string($connection, $name);
	$email = mysqli_real_escape_string($connection, $email);

	// проверка дублирования данных
	$query = "SELECT login, email FROM users WHERE login = '$login' OR email = '$email'";
	$res = mysqli_query($connection, $query);
	if(mysqli_num_rows($res) > 0){
//редкий случай но проверяем:если польз при регистрации ввел логин от одной учетной записи из БД и почту от другой,тогда проверка mysqli_num_rows($res) вернет 2 ответа,поэтому ниже этот случай исключаем
		$data = array();
		while($row = mysqli_fetch_assoc($res)){
			// берем то, что совпадает с содержимым $_POST, т.е. дубликаты
//array_intersect сравнивает 2 массива
// ключи $key нам нужны для вывода польз что он ввел не правильно!! в  $key хранятся или логин или почта
// !!!мудреная проверка ...можно сделать проще
			$data = array_intersect($row, $post);
			foreach($data as $key => $val){
				$k[$key] = $key;
			}
		}
		foreach($k as $key => $val){
// $fields[$key] нужен для перевода 'login' => 'Логин', 'email' => 'Email'
			$errors .= "<li>{$fields[$key]}</li>";
		}
		$_SESSION['reg']['errors'] = "Выберите другие значения для полей: <ul>{$errors}</ul>";
		return;
	}

	$query = "INSERT INTO users (login, password, email, name)
				VALUES ('$login', '$password', '$email', '$name')";
	$res = mysqli_query($connection, $query);
//mysqli_affected_rows - кол- во рядов ,изм -ая последним запросом 
	if(mysqli_affected_rows($connection) > 0){
		$_SESSION['reg']['success'] = "Регистрация прошла успешно";
//stripslashes обратная ф -я от mysqli_real_escape_string для польз д'артаньян
		$_SESSION['auth']['user'] = stripslashes($name);
//ниже:т.к это пользовательская регистрация ,пока не знаю может дальше будет админская		
		$_SESSION['auth']['is_admin'] = 0;
	}else{
		// ошибка добавления
		$_SESSION['reg']['errors'] = "Ошибка регистрации";
	}

}

?>