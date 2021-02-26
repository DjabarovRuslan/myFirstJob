<?php
defined("RUSLAN") or die("тебе сюда нельзя!!!");

 /*print_arr($array),check_remember(),function redirect($http = false)  эти ф- ии используются в админской части,т.к. в controller_main.php (админки) мы подключили model_main.php(пользовательской части ),то эти функции убираем отсюда (они там описаны)*/
 // ф-ия для экранирования данных(ковычки,апостроф)
 function escape_data($type = 'post'){
    global $connection;
    $data = [];
    if($type == 'post'){
        $data = $_POST;
    }elseif ($type == 'get'){
        $data = $_GET;
    }
    foreach($data as $k => $v){
        $data[$k] = mysqli_real_escape_string($connection, $v);
    }
    return $data;
}
// ф- ия выводит сессионные сообщения успеха или ошибки ,образец лежит в папке ниже путь
function get_flash(){
    require __DIR__ . '/../../views/flash.php';
}
	// ф- ия генерирует алиас у редактируемого товара
     // $table  таблица в БД
     //$field - поле в БД  для сравнения создаваемого алиаса с с алиасом из БД ,исключить одинаковость алиасов
     // $str - вх строка
     //$id  - id товара
//ЕСЛИ АЛИАС такой есть в БД то "пристыкуем "через дефис id товара(строка 36),даже после пристыковки найдется похожий алиас в БД то рекурсивно вызывем get_alias(кошмар) бесконечно добавляться id
function get_alias($table, $field, $str, $id){
    global $connection;
    $str = str2url($str);
    $str = mysqli_real_escape_string($connection, $str);
    $query = "SELECT $field FROM $table WHERE $field = '$str'";
    $res = mysqli_query($connection, $query);
    if(mysqli_num_rows($res)) {
        $str = "{$str}-{$id}";
        $res = mysqli_query($connection, $query);
        if (mysqli_num_rows($res)) {
            $str = get_alias($table, $field, $str, $id);
        }
    }
    return $str;
}

function rus2translit($string) {

    $converter = array(

        'а' => 'a',   'б' => 'b',   'в' => 'v',

        'г' => 'g',   'д' => 'd',   'е' => 'e',

        'ё' => 'e',   'ж' => 'zh',  'з' => 'z',

        'и' => 'i',   'й' => 'y',   'к' => 'k',

        'л' => 'l',   'м' => 'm',   'н' => 'n',

        'о' => 'o',   'п' => 'p',   'р' => 'r',

        'с' => 's',   'т' => 't',   'у' => 'u',

        'ф' => 'f',   'х' => 'h',   'ц' => 'c',

        'ч' => 'ch',  'ш' => 'sh',  'щ' => 'sch',

        'ь' => '\'',  'ы' => 'y',   'ъ' => '\'',

        'э' => 'e',   'ю' => 'yu',  'я' => 'ya',



        'А' => 'A',   'Б' => 'B',   'В' => 'V',

        'Г' => 'G',   'Д' => 'D',   'Е' => 'E',

        'Ё' => 'E',   'Ж' => 'Zh',  'З' => 'Z',

        'И' => 'I',   'Й' => 'Y',   'К' => 'K',

        'Л' => 'L',   'М' => 'M',   'Н' => 'N',

        'О' => 'O',   'П' => 'P',   'Р' => 'R',

        'С' => 'S',   'Т' => 'T',   'У' => 'U',

        'Ф' => 'F',   'Х' => 'H',   'Ц' => 'C',

        'Ч' => 'Ch',  'Ш' => 'Sh',  'Щ' => 'Sch',

        'Ь' => '\'',  'Ы' => 'Y',   'Ъ' => '\'',

        'Э' => 'E',   'Ю' => 'Yu',  'Я' => 'Ya',

    );

    return strtr($string, $converter);

}

function str2url($str) {
    // переводим в транслит
    $str = rus2translit($str);
    // в нижний регистр
    $str = strtolower($str);
    // заменям все ненужное нам на "-"
    $str = preg_replace('~[^-a-z0-9_]+~u', '-', $str);
    // удаляем начальные и конечные '-'
    $str = trim($str, "-");
    return $str;
}



function print_arr($array){
    echo "<pre>" . print_r($array, true) . "</pre>";
}


// 2-ая функция очистки данных
    function clean_data($data) {
  $data = trim($data);
  $data = stripslashes($data);// O'reilly
  $data = strip_tags($data);
  $data = htmlspecialchars($data);
 
  return $data;
}



// $meta ГЛОБАЛЬНАЯ!!!ф- ия для использования в контроллерах (категории,продукты),в нашем случае мы пока реализовали получение метаданных для продукта (controller_product.php).самому сделать аналогично для категории(если сможешь)
function set_meta($data){
    global $meta;
    $meta = [
        //'m_title' => $data['m_title'] ?: '', строка для php7
        'm_title' => isset($data['m_title']) ? $data['m_title'] : '',
        'm_desc' => isset($data['m_desc']) ? $data['m_desc'] : '',
        'm_keys' => isset($data['m_keys']) ? $data['m_keys'] : '',
    ];
    return $meta;
}
//пример: для продукта запускается в view_header.php(apple).!!условие if( $meta['m_title'] =='') в ф- ии я вставил ,надо метаданные для вех страниц сделать,на данный момент все "сырое " поэтому вывожу Webformyself Каталог яблочной продукции если пустое значение m_title!!!проблема была следующая:если значение m_title пустое ,то в этих продуктах вместо title (в браузере) показывлись алиасы (не пойму)
function get_meta(){
    global $meta;
    if( $meta['m_title'] ==''){
      return '<title>Webformyself Каталог яблочной продукции</title>' ;    
    }
    
    return '<title>' . $meta['m_title'] . '</title>
    <meta name="description" content="' . $meta['m_desc'] . '">
    <meta name="keywords" content="' . $meta['m_keys'] . '">' . PHP_EOL;
}

function get_options_use(){
    global $connection;
    $query = "SELECT * FROM options";
    $res = mysqli_query($connection, $query);
    while($row = mysqli_fetch_assoc($res)){
        $options[$row['title']] = $row['value'];
    }
    return $options;
}
/**
* куки, проверка авторизации
**/
function check_remember(){
    // если пользователь авторизован - выходим из этой ф-ии
    if( isset( $_SESSION['auth']['user'] ) ) return;
    // если пользователь не запоминался(чекбокс),также выходим
    if( !isset($_COOKIE['hash']) ) return;
//если условия выше не сработали,то открываем сеанс для пользователя
    global $connection;
    //т.к. мы  получаем куку  от клиента то проводим через  mysqli_real_escape_string
    $hash = mysqli_real_escape_string($connection, $_COOKIE['hash']);
    $query = "SELECT name, is_admin FROM users WHERE remember = '$hash'";
    $res = mysqli_query($connection, $query);
    if(mysqli_num_rows($res) == 1){
        $row = mysqli_fetch_assoc($res);
        $_SESSION['auth']['user'] = $row['name'];
        $_SESSION['auth']['is_admin'] = $row['is_admin'];
    }else{
        setcookie('hash', '', time() - 3600);
    }
}

/**
* Редирект- универсальная ф-ия ,для разных переходов !!
* !ф-ия проверяет если в адр строке что то есть то переходим по нему иначе редирект на страницу с которой он зашел !!(т.е например авторизовался на странице какого нибудь товара то после авт -ии возращается на ту страницу товара!!!также если я правильно понял происходит обновление страницы и удаление сессионных переменных,т.е. очищение форм авт и регистр)
**/
function redirect($http = false){
    if($http) {$redirect = $http;}
    else
    {$redirect = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : PATH;}
    header("Location: $redirect");
    exit;
}

// получение  меню страниц(главная,о компании, контакты) над хл. крошками
function get_pages(){
    global $connection;
    $query = "SELECT title, alias FROM pages ORDER BY position";
    $res = mysqli_query($connection, $query);

    $pages = array();
    while($row = mysqli_fetch_assoc($res)){
        $pages[$row['alias']] = $row['title'];
    }
    return $pages;
    
}


/**
ниже :используется :меню категорий тот что  сбоку
* Получение массива категорий

**/
function get_cat(){
    global $connection;
    $query = "SELECT * FROM categories";
    $res = mysqli_query($connection, $query);

    $arr_cat = array();
    while($row = mysqli_fetch_assoc($res)){
        $arr_cat[$row['id']] = $row;
    }
    return $arr_cat;
}

/**
используется :меню
* Построение дерева
**/
function map_tree($dataset) {
    $tree = array();

    foreach ($dataset as $id=>&$node) {    
        if (!$node['parent']){
            $tree[$id] = &$node;
        }else{ 
            $dataset[$node['parent']]['childs'][$id] = &$node;
        }
    }

    return $tree;
}

/**используется :меню
* Дерево в строку HTML.

**/
//автор ввел 2-ой параметр ф-ии по умолчанию ($template = 'view_category_template.php') потому что эта ф- ия и ф- ия categories_to_template() исп - ся также в комментариях !!!!кошмар наделал урод
/**
* Дерево в строку HTML
**/
function categories_to_string($data, $template = 'view_category_template.php'){
    $string = null;
    foreach($data as $item){
        
        $string .= categories_to_template($item, $template);
    }
    return $string;
}

/**
* Шаблон вывода категорий
**/
function categories_to_template($category, $template){
    ob_start();
    include "views/{$template}";
    return ob_get_clean();
}


function pagination($page, $count_pages,$modrew= true){
    // << < 3 4 5 6 7 > >>
     $back = null; //  ссылка НАЗАД
     $forward = null; //  ссылка ВПЕРЕД
     $startpage = null; //  ссылка В НАЧАЛО
     $endpage = null; //  ссылка В КОНЕЦ
     $page2left = null; //  вторая страница слева
     $page1left = null; //  первая страница слева
     $page2right = null; //  вторая страница справа
     $page1right = null; //  первая страница справа
    // $modrew= true- флаг ..если true , то ф-ия настроена под ЧПУ,false-без ЧПУ

    $uri = "?";//? для GET параметров
    /*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    !!!!!все  что ниже было не понятно ,я переделал для ЧПУ  для пагинации через .htaccess 

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    // как я понял !!!пагинация действует из активной категории товара поэтому мы используем
    строку запроса $_SERVER['QUERY_STRING'](так мы сохраняем в хл крошках активность действующей страницы)и добавляем  к нему  page для перехода ,но когда мы из page1 перейдем в page2 в $_SERVER['QUERY_STRING'] сохранится page1, поэтому в нижней проверке мы удаляем page1  ???Т.е.если в запросе есть параметр page мы ее удаляем , чтоб page прописать из нижнего кода ,чтоб не было 2 page (как я понял)*/
    //ниже своими словами:
    // $_SERVER['QUERY_STRING'] -всечто после ? в адр строке 
    //$_SERVER['REQUEST_URI']-все что после домена в адр строке 
    //ниже:если не используем ЧПУ
    if(!$modrew)
    {
      if( $_SERVER['QUERY_STRING'] ){//строка запроса!!если есть параметры в запросе !
        foreach ($_GET as $key => $value) {
            if( $key != 'page' ) $uri .= "{$key}=$value&amp;";//собираем адр строку без page,потом в коде добавляем его
        }
      }
    //ниже часть этой ф- ии если используется ЧПУ!так же удаляем из GET параметр  page
    }else{
        $url = $_SERVER['REQUEST_URI'];
        $url = explode("?", $url);
        if(isset($url[1]) && $url[1] != ''){
            $params = explode("&", $url[1]);
            foreach($params as $param){
                if(!preg_match("#page=#", $param)) $uri .= "{$param}&amp;";
            }
        }
    }

    /*^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^*/

          //тут все понятно в зависимости от кол-ва страниц $count_pages и текущей станицы генерируются ссылки... 
    if( $page > 1 ){
        $back = "<li><a class='nav-link' href='{$uri}page=" .($page-1). "'> назад</a></li>";        
    }
    
    if( $page < $count_pages ){
        $forward = "<li><a class='nav-link' href='{$uri}page=" .($page+1). "'>вперед</a></li>";
    }
    if( $page > 3 ){
        $startpage = "<li><a class='nav-link' href='{$uri}page=1'>начало</a></li>";
    }
    if( $page < ($count_pages - 2) ){
        $endpage = "<li><a class='nav-link' href='{$uri}page={$count_pages}'>конец</a></li>";
    }
    if( $page - 2 > 0 ){
        $page2left = "<li><a class='nav-link' href='{$uri}page=" .($page-2). "'>" .($page-2). "</a></li>";
    }
    if( $page - 1 > 0 ){
        $page1left = "<li><a class='nav-link' href='{$uri}page=" .($page-1). "'>" .($page-1). "</a></li>";
    }
    if( $page + 1 <= $count_pages ){
        $page1right = "<li><a class='nav-link' href='{$uri}page=" .($page+1). "'>" .($page+1). "</a></li>";
    }
    if( $page + 2 <= $count_pages ){
        $page2right = "<li><a class='nav-link' href='{$uri}page=" .($page+2). "'>" .($page+2). "</a></li>";
    }

    return $startpage.$back.$page2left.$page1left.'<li class="active-page">'.$page.'</li>'.$page1right.$page2right.$forward.$endpage;
}

/**ниже
* Хлебные крошки.
описание функции!!!!!!!!!
function breadcrumbs() на входе массив и $id элемента этого массива: 
пример входящего массива:[693] => Array
                                       (
                                            [id] => 693
                                            [title] => Запчасти iPod
                                            [parent] => 685
                                          )
если у массива есть [id](т.е.[693] строка 70 в 
 if($array[$id]) проверка есть ли [$id] (если 0 в [$id]) то false,если условие верно то в $breadcrumbs_array записываем [693] => Запчасти iPod(строка 88),
и $id записываем $id родителя т.е.[parent] 685,так по циклу пока $id родителя не достигнет 0!так выведется вся цепочка до вверха

**/
function breadcrumbs($array, $id){
    if(!$id) return false;

    $count = count($array);
    $breadcrumbs_array = array();
    for($i = 0; $i < $count; $i++){
        if(isset($array[$id])){
              $breadcrumbs_array[$array[$id]['alias']]= $array[$id]['title']  ;              
              $id = $array[$id]['parent'];//перезаписываем $id
        }else break;
    }
    return array_reverse($breadcrumbs_array, true);//список разворачиваем
}

