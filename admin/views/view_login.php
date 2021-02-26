
<?php require_once 'view_header.php' ?>
<div class="page-wrap"> <!-- class="page-wrap" -->
    
	<div id="auth" style="margin-top: 20px;">
		<form action="<?=PATH?>login" method="post">
			<ul class="auth-user">
				<li>
					<input name="login" type="text" class="login" placeholder="Введите ваш логин" />
				</li>
				<li>
					<input name="password" type="password" class="password" placeholder="Введите ваш пароль" />
				</li>
				<li>
					<input type="checkbox" name="remember"> Запомнить?
				</li>
				<li>
					<input class="lisubmit" name="log_in" type="submit" value="Войти" style="float: none;" />
				</li>
			</ul>
		</form>
<?php if(isset($_SESSION['auth']['errors'])): ?>
	<div class="error"><?=$_SESSION['auth']['errors']?></div>
	<?php unset($_SESSION['auth']); ?>
<?php endif; ?>
	</div>
    
</div> <!-- class="page-wrap" -->



<?php require_once 'view_footer.php' ?>
