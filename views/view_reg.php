<?php require_once 'view_header.php' ?>
<div class="page-wrap">
    <!-- class="page-wrap" -->
    <div class="content">
        <!-- class="content" -->
        <ul class="breadcrumbs">
            <?=$breadcrumbs?>
        </ul>
        <div class="content-page">
            <h1 class="product_title">Регистрация</h1>
            <?php if(isset($_SESSION['reg']['success'])): ?>
            <div class="ok">
                <?=$_SESSION['reg']['success']?>
            </div>
            <?php elseif(!isset($_SESSION['auth']['user'])): ?>
            <form action="<?=PATH?>registration" method="post">
                <table width="730" border="0" cellspacing="2" cellpadding="0" class="regtable">
                    <tr>
                        <td>Введите ваше имя <span style="color:red;">*</span></td>
                        <td><input type="text" name="name_reg" /></td>
                    </tr>
                    <tr>
                        <td>Введите ваш логин <span style="color:red;">*</span></td>
                        <td><input class="access" type="text" data-field="login" name="login_reg" /><span></span><span class="info"></span></td>
                    </tr>
                    <tr>
                        <td>Введите ваш email <span style="color:red;">*</span></td>
                        <td><input class="access" type="text" data-field="email" name="email_reg" /><span></span><span class="info"></span></td>
                    </tr>
                    <tr>
                        <td>Введите ваш пароль <span style="color:red;">*</span></td>
                        <td><input type="password" name="password_reg" /></td>
                    </tr>
                    <tr>
                        <td>Повторите ваш пароль <span style="color:red;">*</span></td>
                        <td><input type="password" name="password_reg2" /></td>
                    </tr>
                    <tr>
                        <td>Введите цифры с картинки <span style="color:red;">*</span><br>
                            <img src="<?=PATH?>libs/captcha/captcha.php" alt="" width="150" height="41" class="regcaptcha" id="captcha" /><span style="cursor: pointer; color: #ff0000;" onclick="document.getElementById('captcha').src = '<?=PATH?>libs/captcha/captcha.php?' + Math.random()">Обновить</span> </td>
  <!-- выше:  Math.random() в get параметре должен обновляться иначе браузер будет игнорировать нажатие кнопки (браузерная морока какая то с кэшированием) -->
                        <td><input type="text" name="checkcaptcha" /></td>
                    </tr>
                    <tr>
                        <td>Поля помеченные <span style="color:red;">*</span> обязательны для заполнения</td>
                        <td><input type="submit" value="Зарегистрироваться" name="reg" class="regbtn" /></td>
                    </tr>
                </table>
            </form>
            <?php if(isset($_SESSION['reg']['errors'])): ?>
            <br>
            <div class="error">
                <?=$_SESSION['reg']['errors'];?>
            </div>
            <?php endif; ?>
            <?php endif; unset($_SESSION['reg']); ?>
            <div class="clr"></div>
        </div> <!-- .content-page -->
    </div> <!-- class="content" -->
    <?php require_once 'view_sidebar.php' ?>
</div> <!-- class="page-wrap" -->
<?php require_once 'view_footer.php' ?>