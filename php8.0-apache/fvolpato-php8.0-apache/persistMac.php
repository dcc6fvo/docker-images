<?php

require_once "connection.php";
require_once "dao.php";
require_once "pojoGuest.php";
require_once "voucher.php";

$dao = Dao::getInstance();
$voucher = new Voucher();

$results = $dao->SearchGuestsWithoutMac();
$voucher->PersistGuestMac($results);

date_default_timezone_set('America/Sao_Paulo');
$date = date('m/d/Y h:i:s a', time());

print "Dados persistidos.... ".$date;


?>
