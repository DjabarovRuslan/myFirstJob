<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<?=PATH?>css/style.css" />
    <link href="<?=PATH?>css/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>myfirstjob</title>
</head>

<body>
<h2>hello,Dolly</h2>
    <a href="<?=PATH?>">домашняя страница</a>
    <br>
    <a href="<?=PATH?>admin/">админка</a>
    <div class="clr"></div>
    <div class="cart">
        <a href="/cart"> <i class="fa fa-shopping-cart fa-1x"></i> Корзина
            (<span id="cart-count">
                <?php echo countItems();?></span>) </a>
              <br>  
         <a href=""> 
               
                <span class="clear-cart">очистить корзину</span>
           </a>
    </div>
    <div class="main">
        <form class="form_search" action="<?=PATH?>search" method="get">
            <input type="search" id="complete" class="search" name="search_q" placeholder="ваш запрос" autocomplete="off" required />
            <input type="submit" id="search-choice" class="search-go" name="go-search" value="Поиск" />
        </form>
        <div class="show-msg">
            <ul class="search_result"></ul>
        </div>
        <p></p>
    </div>