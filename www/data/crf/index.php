<?php
lib('Controller/Crf');
if (isset($_GET['callback']) && $_GET['callback'] != 'null') {
    $callback = $_GET['callback'];
} else {
    header('HTTP/1.0 403 Forbidden');
    exit;
}
$crf = New Crf();
header('content-type: application/json; charset=utf-8');
print "$callback(" . json_encode($crf) . ");";
?>
