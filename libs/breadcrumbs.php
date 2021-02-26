<?php 


   // хлебные крошки !!!!  
	$breadcrumbs_array = breadcrumbs($categories, $id);
/*после верхнего получаем массив 
      Array
(
    [aksessuary-dlya-apple---876] => Аксессуары для Apple - 876
    [aksessuary-ipad] => Аксессуары iPad
    [ipad-mini---884] => iPad mini - 884
)
*/
	//print_arr($breadcrumbs_array);
		
if($breadcrumbs_array){
	$breadcrumbs = "<a href='" .PATH. "'>Главная</a> / ";
	foreach($breadcrumbs_array as $alias => $title){
		$breadcrumbs .= "<a href='" .PATH. "category/{$alias}'>{$title}</a> / ";
	}
	if( !isset($get_one_product) ){
		$breadcrumbs = rtrim($breadcrumbs, " / ");
		$breadcrumbs = preg_replace("#(.+)?<a.+>(.+)</a>$#", "$1$2", $breadcrumbs);
	}else{
		$breadcrumbs .= $get_one_product['title'];
	}
}else{
	$breadcrumbs = "<a href='" .PATH. "'>Главная</a> / Каталог";
}
//2 - й вариант хл крошек с дефисом(1 -й со слешем /...он выше,т.е. 2 варианта на выбор)
$breadcrumbs2 = explode(' / ', $breadcrumbs);
$breadcrumbs_new = null;
//удаляем посл эл - т массива и присваиваем его переменной $end
$end = array_pop($breadcrumbs2);
foreach($breadcrumbs2 as $item){
	$breadcrumbs_new .= "<li>{$item} - </li>";
}
//добавляем в конце удаленный посл эл-т ($end)...выводя его за рамки лишки
$breadcrumbs_new .= "<li>$end</li>";





?>