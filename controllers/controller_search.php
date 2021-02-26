<?php
require_once 'controller_main.php';
require_once  "models/model_{$view}.php";
  
  if(isset($_POST['search_q']) && $_POST['search_q'])
  {
    $result_search = GetForBdAjax($_POST['search_q']);
    exit( $result_search);

  }

 


elseif(isset($_GET['search_q']))
  {
   // print_arr($_GET);
  $query = !empty(trim($_GET['search_q'])) ? trim($_GET['search_q']) : null;
  if($query)
   {
     
     $count_goods = count_search();
     
// необходимое кол-во страниц
 //$options['pagination'] переменная ,изменяемая в админке (бывшая конст.PERPAGE)-кол- товаров на странице
 $count_pages = ceil($count_goods / PERPAGE);
// ниже :если товара нет то выводим хотя бы  минимум 1 страницу
if( !$count_pages ) $count_pages = 1;

// получение текущей страницы:(пока не понятно)при постраничной навигации в адресную строку добавляется дополнительный параметр page,т.е. к http://catalognotend/?category=705 добавится  & page =  со своим значением(на кот нажал пользователь),если этого параметра нет то по умолчанию  page = 1 поэтому ниже:

if( isset($_GET['page']) ){
  $page = (int)$_GET['page'];
  if( $page < 1 ) $page = 1;// не 0 и  в минусах в адр строке
}else{
  $page = 1;
}

// если запрошенная страница в адресной строке больше максимума!!!пояснения:при нажатии на определенную категорию выводятся все товары этой категории,если товаров много вывод на страницу ограничиваем $perpage ,если товаров 20 и $perpage = 5 ,то нам нужно 4 страницы для вывода всех товаров этой категории, для того чтоб польз в адр строке не  запросил  page >4 ниже:

if( $page > $count_pages ) $page =1;

// начальная позиция для запроса из БД!!пояснения:$start_pos нужна для запроса в БД для ф- ии get_products(), если польз запросил page = 1 то $start_pos будет = 0 ,т.е. выводятся с от 0 до $perpage товаров из БД!!стандартная ф- ла для постр навигации!!!
  $start_pos = ($page - 1) * PERPAGE;

$pagination = pagination($page, $count_pages);
$result_search = search($start_pos, PERPAGE);

}else{
  $result_search = 'а что вы ищете?';
}

    }
 
 $breadcrumbs_new = "<li><a href='" .PATH. "'> Главная</a></li> / <li>результаты поиска</li>";
  

require_once "views/view_{$view}.php";
