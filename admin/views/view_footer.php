<div class="footer">
	
        <div class="menu"> <!-- class="menu" -->
          <!--  <?php //require 'view_menu.php';?> -->
        </div> <!-- class="/menu" -->
        <center>Какая то информация о авторе, сайте, продукции, поставщиках, счетчики, статистика или что-либо еще!</center>
 </div>
<!--  нижние 2 div нужны для эффектов (ответ от сервера id="mes-edit,loader знак загрузки)-->
 <div id="mes-edit">
  <span class="responce"></span> <!-- подгружается ответ -->
  <span class="cross-times">&times;</span> <!-- крестик для закр сообщ-->
</div>
<div id="loader">
  <span></span>
</div>


   <script>
var path = "<?=PATH?>";
var search = "<?php if( isset($_GET['search']) ) echo htmlspecialchars($_GET['search']); else echo ''; ?>"; 
</script>
<script src="<?=PATH?>views/scripts/jquery-1.9.0.min.js"></script>
<script src="<?=PATH?>views/scripts/jquery.js"></script>
 <script src="<?=PATH?>views/scripts/jquery-ui-1.10.4.custom.min.js"></script>
<script src="<?=PATH?>views/scripts/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<?=PATH?>views/scripts/jquery.highlight.js"></script>
<script src="<?=PATH?>views/scripts/jquery.hoverIntent.minified.js"></script>
<script src="<?=PATH?>views/ckeditor_4.14.0_standard/ckeditor/ckeditor.js">"></script>

<script src="<?=PATH?>views/ckeditor_4.14.0_standard/ckeditor/adapters/jquery.js">"></script>
<script src="<?=PATH?>views/scripts/jquery.cookie.js"></script>
<script src="<?=PATH?>views/scripts/jquery.accordion.js"></script>
<script src="<?=PATH?>views/bootstrap/js/bootstrap.min.js"></script>
 <script src="<?=PATH?>views/dropzone/dropzone.js"></script> 
<script src="<?=PATH?>views/scripts/scripts.js"></script>
</body>
</html>


