<?php 

// если есть в сессии инфо о товаре 
 function getProducts()
    {
        if (isset($_SESSION['products'])) {
            return $_SESSION['products'];
        }
        return false;
    }



    // получение инфо о товарах по id
   function getProdustsByIds($idsArray)
    {
        // Соединение с БД
       global $connection;

        // Превращаем массив в строку для формирования условия в запросе
        $idsString = implode(',', $idsArray);

        // Текст запроса к БД
        $sql = "SELECT * FROM products WHERE  id IN ($idsString)";

        //$result = $db->query($sql);
        $res = mysqli_query($connection, $sql);

        // Указываем, что хотим получить данные в виде массива
       // $result->setFetchMode(PDO::FETCH_ASSOC);

        // Получение и возврат результатов
        $i = 0;
        $products = array();
        while($row = mysqli_fetch_assoc($res))
        {
        	$products[$i]['id'] = $row['id'];
            $products[$i]['alias'] = $row['alias'];
            $products[$i]['title'] = $row['title'];
            $products[$i]['price'] = $row['price'];
            $i++;
		
	     }
	     return $products;
        
    }

   function getTotalPrice($products)
    {
        // Получаем массив с идентификаторами и количеством товаров в корзине
        $productsInCart = getProducts();

        // Подсчитываем общую стоимость
        $total = 0;
        if ($productsInCart) {
            // Если в корзине не пусто
            // Проходим по переданному в метод массиву товаров
            foreach ($products as $item) {
                // Находим общую стоимость: цена товара * количество товара
                $total += $item['price'] * $productsInCart[$item['id']];
            }
        }

        return $total;
    }


      /**
     * Удаляет товар с указанным id из корзины
     * @param integer $id <p>id товара</p>
     */
  function deleteProduct($id)
    {
        // Получаем массив с идентификаторами и количеством товаров в корзине
        $productsInCart = getProducts();

        // Удаляем из массива элемент с указанным id
        unset($productsInCart[$id]);

        // Записываем массив товаров с удаленным элементом в сессию
        $_SESSION['products'] = $productsInCart;
        return true;
    }



 ?>