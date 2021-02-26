<?php require_once 'view_header.php'?>
<div class="page-wrap">
    <!-- class="page-wrap" -->
    <div class="content">
        <!-- class="content" -->
          <ul class="breadcrumbs">
            <?=$breadcrumbs_new?>
           
        </ul> 
        <!-- ниже:вывод товаров -->
        <?php if($products): ?>
        <?php foreach($products as $product): ?>
        <div class="product">
            <!-- class="product" -->
            <h1><a href="<?=PATH?>product/<?=$product['alias']?>">
                    <?=$product['title']?></a></h1>
            <div class="img-wrap">
                <img src="<?=PATH . "pictures/product.jpg"?>" alt="" />
            </div>
            <p class="price">Цена: <span>
                    <?=$product['price']?></span> руб</p>
            <p class="views"> <span>680</span></p>
            <a href="#" class="btn btn-default add-to-cart" data-id="<?=$product['id']?>"><i class="fa fa-shopping-cart"></i>В корзину</a>
            <p class="permalink"><a href="<?=PATH?>product/<?=$product['alias']?>">подробнее</a></p>
        </div> <!-- class="product" -->
        <?php endforeach; ?>
        <?php else: ?>
        <p>в этой категории товаров пока нет...</p>
        <?php endif; ?>
        <div class="clr"></div>
        <!-- ниже:проверка,чтоб крошки показывались если кол- во страниц больше 1
 -->
        <?php if( $count_pages > 1): ?>
        <ul class="pagination">
            <?php echo $pagination;?>
        </ul>
        <?php endif ;?>
    </div> <!-- class="content" -->
    <?php require_once 'view_sidebar.php'?>
</div> <!-- class="page-wrap" -->
<?php require_once'view_footer.php'?>