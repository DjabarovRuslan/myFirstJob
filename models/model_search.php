<?php 
require_once 'model_main.php';
//вывод выпадающего списка найденного (ajax)
function GetForBdAjax($arg){
 global $connection;

 if(!$connection){die('no connection');}

 $search = trim(mysqli_real_escape_string($connection, $arg));

	 $query = "SELECT title  FROM products WHERE title LIKE '%{$search}%' LIMIT 10";
	 $res = mysqli_query($connection, $query);
	
        // $result_search = array();

	/*while($row = mysqli_fetch_assoc($res)){
		$result_search[] = $row['alias'];
	}*/
	//return $result_search;
	while($row = mysqli_fetch_assoc($res)){
		//$result_search[] = $row['title'];
		echo "\n<li>".$row["title"]."</li>";
	  }
	}
	


	function search($start_pos, $perpage){
	global $connection;
	$search = trim(mysqli_real_escape_string($connection, $_GET['search_q']));
	$query = "SELECT id, title, alias, price, image FROM products WHERE title LIKE '%{$search}%' LIMIT $start_pos, $perpage";
	$res = mysqli_query($connection, $query);
	if( !mysqli_num_rows($res) ){
		return 'Ничего не найдено';
	}

	$result_search = array();
	while($row = mysqli_fetch_assoc($res)){
		$result_search[] = $row;
	}
	return $result_search;
}

/** кол-во результатов поиска(для пагинации "поиск")
!!!аналог search_autocomplete() только находим кол- во совпадений 
!! !! $_GET['search'] - в  view_header.php из формы "поиска" инпут
**/
function count_search(){
	global $connection;
	$search = trim(mysqli_real_escape_string($connection, $_GET['search_q']));
	$query = "SELECT COUNT(*) FROM products WHERE title LIKE '%{$search}%'";
	$res = mysqli_query($connection, $query);
	$count_search = mysqli_fetch_row($res);	
	return $count_search[0];
}


