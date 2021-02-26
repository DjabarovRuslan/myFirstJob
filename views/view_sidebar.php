<div class="sidebar-wrap">
    <!-- class="sidebar-wrap" -->
    <div class="block-body">
        <!-- class="block-body" -->
        <?php if(!isset($_SESSION['auth']['user'])): ?>
        <div class="block-title">Войти</div>
        <?php else: ?>
        <div class="block-title">Мини-профиль</div>
        <?php endif; ?>
        <div id="auth">
            <?php if(!isset($_SESSION['auth']['user'])): ?>
            <form action="<?=PATH?>login" method="post">
                <ul class="auth-user">
                    <li>
                        <input name="login" type="text" class="login" placeholder="Введите ваш логин" />
                    </li>
                    <li>
                        <input name="password" type="password" class="password" placeholder="Введите ваш пароль" />
                    </li>
                    <li>
                        <input type="checkbox" name="remember">Запомнить
                    </li>
                    <li>
                        <input class="lisubmit" name="log_in" type="submit" value="Войти" />
                    </li>
                </ul>
            </form>
            <a id="forgot-link" href="#">Забыл пароль?</a>
            <a href="<?=PATH?>registration">Зарегистрироваться</a>
            <?php if(isset($_SESSION['auth']['errors'])): ?>
            <div class="error">
                <?=$_SESSION['auth']['errors']?>
            </div>
            <?php unset($_SESSION['auth']); ?>
            <?php endif; ?>
            <?php if(isset($_SESSION['auth']['ok'])): ?>
            <div class="ok">
                <?=$_SESSION['auth']['ok']?>
            </div>
            <?php unset($_SESSION['auth']); ?>
            <?php endif; ?>
            <?php else: ?>
            <p class="s1">Здравствуйте,
                <?=htmlspecialchars($_SESSION['auth']['user'])?>
            </p>
            <p class="s1">Вы состоите в группе:
                <?php if($_SESSION['auth']['is_admin']) echo 'Администраторы'; else echo 'Пользователи'; ?>
            </p>
            <p><a href="<?=PATH?>logout">Выход</a></p>
            <?php endif; ?>
        </div> <!-- #auth -->
        <!-- форма восстановление пароля -->
        <div id="forgot">
            <form action="<?=PATH?>forgot" method="post">
                <ul class="auth-user">
                    <li><input type="text" name="email" id="email" class="login" placeholder="Введите ваш email"></li>
                    <li><input type="submit" value="Выслать пароль" name="fpass"></li>
                </ul>
            </form>
            <p><a id="auth-link" href="#">Вход на сайт</a></p>
        </div> <!-- #forgot -->
    </div> <!-- class="block-body" -->
    <div class="block-body">
        <!-- class="block-body" -->
        <div class="block-title">Каталог</div>
        <ul class="catalog">
            <?php
            if(isset($categories_menu))
            echo $categories_menu; ?>
        </ul>
    </div> <!-- class="block-body" -->
</div> <!-- class="sidebar-wrap" -->