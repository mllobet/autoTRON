<?php

function check_AI($a)
{
	return strlen($a) >= 2 && $a[0]	== 'A' && $a[1] == 'I';

}

	$allowedExts = array("o");
$temp = explode(".", $_FILES["file"]["name"]);
$extension = end($temp);
if (in_array($extension, $allowedExts) && mb_detect_encoding($_FILES["file"]["name"], 'ASCII', true) && strlen($_FILES["file"]["name"]) >= 3 && strlen($_FILES["file"]["name"]) <= 12 && check_AI($_FILES["file"]["name"]) && $_FILES["file"]["size"] <= 2097152)
  {
  if ($_FILES["file"]["error"] > 0)
    {
    echo "Return Code: " . $_FILES["file"]["error"] . "<br>";
    }
  else
    {
    echo "Upload: " . $_FILES["file"]["name"] . "<br>";
    echo "Type: " . $_FILES["file"]["type"] . "<br>";
    echo "Size: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
    echo "Temp file: " . $_FILES["file"]["tmp_name"] . "<br>";

    if (file_exists("upload/" . $_FILES["file"]["name"]))
     {
	unlink("upload/" . $_FILES["file"]["name"]);
     }
      move_uploaded_file($_FILES["file"]["tmp_name"],
      "upload/" . $_FILES["file"]["name"]);
      echo "Stored in: " . "upload/" . $_FILES["file"]["name"];
?>
<center>Èxit! redireccionant en 3 segons...</center>
<script type="text/javascript">
setTimeout(function(){window.location.href = "index.lol";}, 3000);
</script>
<?php
  }
}
else
  {
  echo "Invalid file";
  }
?>