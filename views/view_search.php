<?php require_once 'view_header.php';?>
<hr>
<div class="content">
<ul class="breadcrumbs">
            <?=$breadcrumbs_new?>
</ul>    
</div>
            
<h2> страница view_search</h2>
<?php if( is_array($result_search) ): ?>
<?php foreach($result_search as $product): ?>
<div class="product">
    <!-- class="product" -->
    <h1><a href="<?=PATH?>product/<?=$product['alias']?>">
            <?=$product['title']?></a>
    </h1>
     <div class="img-wrap">
        <img src="<?=PATH . "pictures/product.jpg"?>" alt="" />
    </div> 
    <p class="price">Цена: <span>
            <?=$product['price']?></span> руб
    </p>
    <a href="#" class="btn btn-default add-to-cart" data-id="<?=$product['id']?>"><i class="fa fa-shopping-cart"></i>В корзину</a>
    <p class="permalink"><a href="<?=PATH?>product/<?=$product['alias']?>">подробнее</a></p>



</div> <!-- class="product" -->

<?php require_once 'view_sidebar.php'?>
<?php endforeach; ?>
<div class="clr"></div>
<?php if( $count_pages > 1 ): ?>
<ul class="pagination">
    <?=$pagination?>
</ul>
<?php endif; ?>
<?php else: ?>
<p><b>
        <?php echo $result_search; ?></b></p>
<?php endif; ?>
<hr>

<?php require_once 'view_footer.php'; ?>