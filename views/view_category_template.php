<?php defined("RUSLAN") or die("тебе сюда нельзя!!!");?>
   <li>
	   <a href=" <?=PATH?>category/<?=$category['alias']?>"><?=$category['title']?></a>
	   <?php if(isset($category['childs']) && $category['childs']): ?>
	   <ul>
		   <?php echo categories_to_string($category['childs']); ?>
      </ul>
	<?php endif; ?>
 </li>

