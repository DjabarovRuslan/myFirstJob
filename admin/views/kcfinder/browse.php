<?php

/** This file is part of KCFinder project
  *
  *      @desc Browser calling script
  *   @package KCFinder
  *   @version 3.12
  *    @author Pavel Tzonkov <sunhater@sunhater.com>
  * @copyright 2010-2014 KCFinder Project
  *   @license http://opensource.org/licenses/GPL-3.0 GPLv3
  *   @license http://opensource.org/licenses/LGPL-3.0 LGPLv3
  *      @link http://kcfinder.sunhater.com
  */
// ниже до require "core/bootstrap.php" мы вставили чтоб ограничить доступ если не админ,'disabled' => false означает доступ разрешен
session_start();
if( !isset($_SESSION['auth']['is_admin']) || $_SESSION['auth']['is_admin'] != 1 ){
    exit('No access');
}
$_SESSION['KCFINDER'] = array(
    'disabled' => false
);

require "core/bootstrap.php";
$browser = "kcfinder\\browser"; // To execute core/bootstrap.php on older
$browser = new $browser();      // PHP versions (even PHP 4)
$browser->action();

?>