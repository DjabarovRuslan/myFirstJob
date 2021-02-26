<?php require_once 'view_header.php'?>
<div >
    

  <style>
   table {
    width: 100%; /* Ширина таблицы */
    background: white; /* Цвет фона таблицы */
    color: white; /* Цвет текста */
    border-spacing: 1px; /* Расстояние между ячейками */
   }
   td, th {
    background: maroon; /* Цвет фона ячеек */
    padding: 5px; /* Поля вокруг текста */
   }
  </style>
 
  
</div>



<div class="show-cart">
 <?php if($productsInCart): ?>
                        <p>Вы выбрали такие товары:</p>
                        <table >
                            <tr>
                                <th>id товара</th>
                                <th>Название</th>
                                <th>Стомость, $</th>
                                <th>Количество, шт</th>
                                <th>Удалить</th>
                            </tr>
                            <?php foreach ($products as $product): ?>
                                <tr>
                                    <td><?php echo $product['id'];?></td>
                                    <td>
                                        <a href="/product/<?php echo $product['alias'];?>">
                                            <?php echo $product['title'];?>
                                        </a>
                                    </td>
                                    <td><?php echo $product['price'];?></td>
                                    <td><?php echo $productsInCart[$product['id']];?></td> 
                                    <td>
                                        <a href="/cart?delete-id=<?php echo $product['id'];?>">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                                <tr>
                                    <td colspan="4">Общая стоимость, $:</td>
                                    <td><?php echo $totalPrice;?></td>
                                </tr>
                            
                        </table>
                       <?php else: ?>
                    <h1>корзина пуста</h1>
                     <a href="<?=PATH?>">вернуться к покупкам</a>    

                   <?php endif; ?>
                  
                  
                   <?php require_once 'view_sidebar.php'?>
             </div>
                   
  <?php require_once 'view_footer.php'?>