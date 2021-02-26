<?php
//require_once 'config.php';
require_once 'function/function.php';



//ниже :используется :меню категорий тот что  сбоку
//Получение массива категорий


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
 /**
   * кол- товаров в корзине
   */ 

 
    //ниже :при нажатии на добавить в корзину эта ф-ия добавляет товар в сессию и 
   // на выходе запускает другую ф-ию для показа кол- ва товаров в корз
      function addProduct($id)
    {
        // Приводим $id к типу integer
        $id = intval($id);

        // Пустой массив для товаров в корзине
        $productsInCart = array();

        // Если в корзине уже есть товары (они хранятся в сессии)
        if (isset($_SESSION['products'])) {
            // То заполним наш массив товарами
            $productsInCart = $_SESSION['products'];
        }

        // Проверяем есть ли уже такой товар в корзине 
        if (array_key_exists($id, $productsInCart)) {
            // Если такой товар есть в корзине, но был добавлен еще раз, увеличим количество на 1
             $productsInCart[$id] ++;
        } else {
            // Если нет, добавляем id нового товара в корзину с количеством 1
            $productsInCart[$id] = 1;
        }

        // Записываем массив с товарами в сессию
        $_SESSION['products'] = $productsInCart;

        // Возвращаем количество товаров в корзине
        return countItems();
        //return true;
     
    }

    /**
     * Подсчет количество товаров в корзине (в сессии)
     * @return int <p>Количество товаров в корзине</p>
     */
     function countItems()
    {
        // Проверка наличия товаров в корзине
        if (isset($_SESSION['products'])) {
            // Если массив с товарами есть
            // Подсчитаем и вернем их количество
            $count = 0;
            foreach ($_SESSION['products'] as $id => $quantity) {
                $count = $count + $quantity;
            }
           return $count;
        } else {
            // Если товаров нет, вернем 0
            return 0;
        }
    }
//очищение корзины 
  function clear()
    {
        if (isset($_SESSION['products'])) {
            unset($_SESSION['products']);
        }
        return true;
    }


// пагинация
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


//конец пагинация 

/**ниже
* Хлебные крошки.
описание функции!!!!!!!!!
function breadcrumbs() на входе массив и $id элемента этого массива: 
пример входящего массива:[693] => Array
                                       (
                                            [id] => 693
                                            [title] => Запчасти iPod
                                            [parent] => 685
                                            [alias] => komplektuyuschie-k-apple
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

//--------------------------кэширование--------------------------------



/**
 * $key имя кэшируемого
 $data  данные ,кот будем записывать в файл кэша
$seconds время на кот будем записывать данные(когда не хотим кэшировать(админка),то $seconds устанавливаем = 0)
$content['end_time'] - текущее время +кол -во времени на кот кэшируем данне,нужен чтоб узнать устарел кэш или нет (для перезаписи устаревшего кэша)
 
serialize сериализует в строку

 я переделал ,взял из ishop2.loc,вроде работает...не нарвится вызов ф-ии из другой  ф-ии ...принцип понятен ...хочеш переделай 
 */
    function setCache($key, $data, $seconds = 3600 * 24){
        if($seconds){
            $content['data'] = $data;
            $content['end_time'] = time() + $seconds;
    //шифруем имя файла,чтоб внем были допустимые символы(безопасность)
            if(file_put_contents('cache' . '/' . md5($key) . '.txt', serialize($content))){
                return true;
            }
        }
        return false;
    }

 function getCache($key){
       
       $file = 'cache' . '/' . md5($key) . '.txt';
        if(file_exists($file)){
            $content = unserialize(file_get_contents($file));
    //проверяем не устарели ли кэш данные (время кэширования)
            if(time() <= $content['end_time']){

                return $content['data'];
            }
    //если устарели то удалим файл
            unlink($file);
        }
        return false;
    }

     function deleteCache($key){
        $file = 'cache' . '/' . md5($key) . '.txt';
        if(file_exists($file)){
            unlink($file);
        }
    }

   function cacheCategory(){
        //$cache = Cache::instance();
        $cats = getCache('cats');
       
        //если данных в кэше нет 
        if(!$cats){
              $cats = get_cat();
             // echo 'сработало новое кэширование';
            //$cats = \R::getAssoc("SELECT * FROM category");
            //запишем в кэш то что получили
            setCache('cats', $cats);
        }
        return $cats;
    }



?>