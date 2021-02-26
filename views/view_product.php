<?php include 'view_header.php';?>
<div class="page-wrap">
    <h1>страница PRODUCT</h1>

     
    <div class="content">

         <ul class="breadcrumbs">
            <?=$breadcrumbs_new?>
            
        </ul>
        <div class="content-page">
            <?php if( $get_one_product):?>
            <h1 class="product_title">
                <?=$get_one_product['title']?>
            </h1>
            <div class="img-product"><img src="<?=PATH . 'pictures/product.jpg'?>" alt="" />
            </div>
            <a href="#" class="btn btn-default add-to-cart" data-id="<?=$get_one_product['id']?>"><i class="fa fa-shopping-cart"></i>В корзину</a>
            <div class="product-txt">
                <?php echo $get_one_product['content'];?>
            </div>
            <div class="clr"></div>
            <div class="product-inf">
            </div>
            <?php endif;?>
        </div>
    </div>
    <?php require_once 'view_sidebar.php'?>
</div>
<?php include 'view_footer.php';?>