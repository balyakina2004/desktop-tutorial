<?php
	include "check_admin.php";
	include "../../connect.php";

	$image = "images/upload/1_". time() ."_". $_FILES["image"]["name"];
	move_uploaded_file($_FILES["image"]["tmp_name"], "../../".$image);

	$connect->query(sprintf("INSERT INTO `products`(`name`,  `country`, `year`, `model`, `category`, `count`, `image`) VALUES('%s', '%s','%s', '%s', '%s', '%s', '%s')", $_POST["name"],  $_POST["country"], $_POST["year"], $_POST["model"], $_POST["category"], $_POST["count"], $image));

	return header("Location:../../admin.php?message=Товар добавлен");