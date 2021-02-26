<?php require_once 'view_header.php' ?>

<div class="page-wrap">
	<div class="content">
	<h1>Настройки сайта</h1>
	<small>*Измените настройку и кликните вне поля для ее сохранения или нажмите Enter</small>

	<table class="zebra" data-table="">
		<!--  атрибут data-table=""  нужен как адрес на кот  будем отпрвлять данные!!
		!!не понятно почему он пуст??в скрипте он указан кук путь url!!и автор говорит раз этот путь указан ,значит попадет на этот контроллер (controller_options.php) 	см. scripts.js
		!!data-table означает атрибут data со значением table-->
		<thead>
			<tr>
				<th>Настройка</th>
				<th>Значение</th>
			</tr>
		</thead>
		<tbody>
		 <?php foreach($get_options as $option): ?>
			<tr>
				<td><?=$option['name'] ?></td>
				<td>
<!-- ниже: формируется выпадающий список тем-->					
					<?php if($option['title'] == 'theme'): ?>
						<select class="edit" name="theme">
							<?php foreach($themes as $theme): ?>
								<option value="<?=$theme?>"<?php if($theme == $option['value']) echo ' selected'?>><?=$theme?></option>
	<!-- из строки  выше  <?php if($theme == $option['value']) echo ' selected'?>><?=$theme?>  означает  делаем "активным "тему,т.е.показываем 1 ым в выпадающем списке(за это и отвечает ' selected')!! $theme == $option['value'] проверяет $theme равен ли $option['value'](значению в БД)(пояснил как мог)-->
							<?php endforeach; ?>
						</select>
					<?php else: ?>
						<input type="text" name="<?=$option['title'] ?>" value="<?=$option['value'] ?>" class="edit">
					<?php endif; ?>
				</td>
			</tr>
		<?php endforeach; ?>
		</tbody>
	</table>
  </div>
  <!-- <div class="sidebar-wrap">
		<?php //require_once 'view_sidebar.php'; ?>
 </div> -->
</div>

<?php require_once 'view_footer.php' ?>