<?php require_once 'view_header.php' ?>

<div class="page-wrap"> <!-- class="page-wrap" -->
    
    <div class="content"> <!-- class="content" -->
        <ul class="breadcrumbs">
            <?=$breadcrumbs?>
        </ul>                


<div class="content-page">

     <h1 class="product_title">Восстановление пароля</h1>

<!-- ошибки изменения пароля -->
<?php if( isset($_SESSION['forgot']['change_error']) ): ?>
	<div class="error"><?=$_SESSION['forgot']['change_error']?></div>
	<?php unset($_SESSION['forgot']); ?>

<form action="<?=PATH?>forgot" method="post">
<table width="730" border="0" cellspacing="2" cellpadding="0" class="regtable">
	<tr>
		<td>Новый пароль: <span style="color:red;">*</span></td>
		<td><input type="text" name="new_password" /></td>
	</tr>
	<tr>
		<input type="hidden" name="hash" value="<?=$_GET['forgot']?>">
		<td>Поля помеченные <span style="color:red;">*</span> обязательны для заполнения</td>
		<td><input type="submit" value="Изменить пароль" name="change_pass" class="regbtn" /></td>
	</tr>
</table>
</form>

<!-- пароль изменен -->
<?php elseif( isset($_SESSION['forgot']['ok']) ): ?>
	<div class="ok"><?=$_SESSION['forgot']['ok']?></div>
	<?php unset($_SESSION['forgot']); ?>

<!-- ошибки доступа на изменение пароля -->
<?php elseif(isset($_SESSION['forgot']['errors'])): ?>
	<div class="error"><?=$_SESSION['forgot']['errors']?></div>
	<?php unset($_SESSION['forgot']['errors']); ?>

<!-- только зашли -->
<?php else: ?>
	<form action="<?=PATH?>forgot" method="post">
	<table width="730" border="0" cellspacing="2" cellpadding="0" class="regtable">
		<tr>
			<td>Новый пароль: <span style="color:red;">*</span></td>
			<td><input type="text" name="new_password" /></td>
		</tr>
		<tr>
			<input type="hidden" name="hash" value="<?=$_GET['forgot']?>">
			<td>Поля помеченные <span style="color:red;">*</span> обязательны для заполнения</td>
			<td><input type="submit" value="Изменить пароль" name="change_pass" class="regbtn" /></td>
		</tr>
	</table>
	</form>

<?php endif; ?>

        <div class="clr"></div>

</div> <!-- .content-page -->

    
    </div> <!-- class="content" -->
    
<?php require_once 'view_sidebar.php' ?>
    
</div> <!-- class="page-wrap" -->

<?php require_once 'view_footer.php' ?>