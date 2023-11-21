<!--подключение-->
<?php
	session_start();
	include "connect.php";

	$sql = "SELECT * FROM `products` WHERE `count` > 0 ORDER BY `created_at` DESC LIMIT 5";
	if(!$result = $connect->query($sql))
		return die ("Ошибка получения данных: ". $connect->error);
		$data = "";
		while($row = $result->fetch_assoc())
			$data .= sprintf('
				<div class="slide col">
					<img src="%s" alt="" />
					<h3><a href="product.php?id=%s">%s</a></h3>
				</div>
			', $row["image"], $row["product_id"], $row["name"]);

	include "header.php";
?>
<!--общий контейнер-->
 <div class="content">
<!--секция постер-->
 <section class="poster">
	<div class="poster-img1">
	</div>
	<div class="poster-img2">
		<div class="poster-img2_text">
			<p>Смотрите кино и сериалы по подписке 
на Illuminos</p>
<button><a href="catalog3.php" style="color:black;">Подробнее</a></button>
		</div>
	</div>
 </section>
 <!--категории-->
<section class="icon">
	<div class="icon__item">
		<img src="asset/img/icons8-комедия-64.png" alt="icon">
		<p><a href="catalog.php">Комедии</a></p>

	</div>
	<div class="icon__item">
	<img src="asset/img/icons8-фентези-85.png" alt="icon">
	<p><a href="catalog.php">Фентези</a></p>
	</div>
	<div class="icon__item">
	<img src="asset/img/icons8-детектив-64.png" alt="icon">
	<p><a href="catalog.php">Детективы</a></p>
	</div>
	<div class="icon__item">
	<img src="asset/img/icons8-ужастик-51.png" alt="icon">
	<p><a href="catalog.php">Ужасы</a></p>
	</div>
	<div class="icon__item">
	<img src="asset/img/icons8-драма-50.png" alt="icon">
	<p><a href="catalog.php">Драма</a></p>
	</div>
	<div class="icon__item">
	<img src="asset/img/icons8-рекомендация-64.png" alt="icon">
	<p><a href="catalog.php">Рекомендация</a></p>
	</div>
</section>
<!--слайдер-->
		<div id="slider">
			<h2>Новинки</h2>
				<div class="slides">
					<?= $data ?>
				</div>
			</div>
</div>
<!--подключение к футеру-->
		<?php
		include "footer.php";
		?>
	<script src="asset/js/slider.js"></script>
