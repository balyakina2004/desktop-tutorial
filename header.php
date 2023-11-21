<!--подключение-->
<?php
	$menu = '
	<div class="logo"><a href="index.php"><img src="asset/img/Group72.png" alt="img"></a></div>
	
		<li><a href="catalog.php">Фильмы</a></li>
		<li><a href="catalog2.php">Сериалы</a></li>
		<li><a href="catalog3.php">Тарифы</a></li>
		<!-- Форма для поиска товаров -->
		
		%s
		
	';

	$m = '';
	if(isset($_SESSION["role"])) {
		$m = '<li><a href="cart.php">Личный кабинет</a></li>';
		
		
		$m .= ($_SESSION["role"] == "admin") ? '<li><a href="admin.php">Заказы</a></li>' : '';
		$m .= '<li><a href="asset/controllers/logout.php"><button class="button__podrobnee">Выход</button></a></li>';
	} else
		$m = '
			<li><a href="login.php">Вход</a></li>
			
		';

	$menu = sprintf($menu, $m);
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Illuminos</title>
	<link rel="stylesheet" href="asset/css/style2.css">
	<script src="asset/scripts/filter.js"></script>
	<script>
		let role = "<?= (isset($_SESSION["role"])) ? $_SESSION["role"] : "guest" ?>";
	</script>
</head>
<body>

	<header>
		<div class="size">
		<div class="content">
			<ul>
				<?= $menu ?>
			</ul>
			
		</div>
	    </div>
	</header>

