<?php


/**
* получение ID по алиасу
**/
function get_id($categories, $category_alias){
	if(!$category_alias) return false;
//ниже:  в массиве $categories $k это $id категории(так формировали этот масив)
	foreach($categories as $k => $v){
		if($v['alias'] == $category_alias) return $k;
	}
	return false;
}


/**
* Получение ID дочерних категорий
используется :вывод товаров!!!
описание ф-ии!!!!
  на входе массив в виде таких массивов
  [693] => Array
                 (
                   [id] => 693
                   [title] => Запчасти iPod
                   [parent] => 685 (этот "массив" потомок катег.у кот id = 685 )
                  ) 
     как работает:польз нажал пункт меню ил хл.крошек(не важно) ,ф-ия получает весь массив и $id (например  685)  ,ф-я начинает выводить все id "массивов "   где  [parent] => 685(находит все массивы ,для кототых он "пункт 685"является родителем),затем в  $id попадает [693]  и ф-я выводит все id "массивов "   где  [parent] =>693   вот и рекурсия 
    ------------------------------------------------------------------
   в цикле проходимся по массивам и если [parent] равен $id,то  в $data записываем [id] этого массива  ,затем рекурсивно вызываем эту же ф-ию но с новым [id]  .выдает ф-ия список [id]-шек в виде: 691,695,696,697,698,699,692,700,701, 
   ---------------------------------------------------------------
   !!!функция принимает массив и $id(категории неважно из  меню или из хл.крошек) !!.результат:все  id  всех потомков            
**/


function cats_id($array, $id){
	if(!$id) return false;//
      $data = null;
	foreach($array as $item){
		if($item['parent'] == $id){
			$data .= $item['id'] . ",";// запятая нужна для удобного просмотра !!
			$data .= cats_id($array, $item['id']);
		}
	}
	return $data;
}

/**
используется :вывод товаров!!!
* Получение товаров из БД:на входе ф- ия получает:
1  $ids -результат ф-ии  cats_id($array, $id)!!(список дочерних id пункта категории на которую мы нажали)
2

**/

function get_products($ids, $start_pos, $perpage){
	global $connection;
	if($ids){
		$query = "SELECT * FROM products WHERE parent IN($ids) ORDER BY title LIMIT $start_pos, $perpage";
	}else{
		$query = "SELECT * FROM products ORDER BY title LIMIT $start_pos, $perpage";
	}
	$res = mysqli_query($connection, $query);
	$products = array();
	while($row = mysqli_fetch_assoc($res)){
		$products[] = $row;
	}
	return $products;
}

/**
* Кол-во товаров
используется:для пагинации!!!!
возвращает ф-ия 1 значение т.к.использ.оператор COUNT в запросе ,
поэтому  $count_goods[0]
**/
function count_goods($ids){
	global $connection;
	if( !$ids ){
		$query = "SELECT COUNT(*) FROM products";
	}else{
		$query = "SELECT COUNT(*) FROM products WHERE parent IN($ids)";
	}
	$res = mysqli_query($connection, $query);
	$count_goods = mysqli_fetch_row($res);
	return $count_goods[0];
}

?>