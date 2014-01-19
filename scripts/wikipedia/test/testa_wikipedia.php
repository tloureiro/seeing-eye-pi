<?php

$url = 'http://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvprop=content&format=xml&redirects&titles=Main%20Page';
$c = file_get_contents($url);
echo $c;


?>
