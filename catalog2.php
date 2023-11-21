<!--подключение-->
<?php
	session_start();
	include "connect.php";

	$role = (isset($_SESSION["role"])) ? $_SESSION["role"] : "guest";

	$sql = "SELECT * FROM `categories`";
	$result = $connect->query($sql);
	$categories = "";
	while($row = $result->fetch_assoc())
		$categories .= sprintf('<option value="%s">%s</option>', $row["category"], $row["category"]);

	$sql = "SELECT * FROM `products` WHERE `model` ='сериал' ORDER BY `created_at` DESC";
	if(!$result = $connect->query($sql))
		return die ("Ошибка получения данных: ". $connect->error);

	$data = "";
	while($row = $result->fetch_assoc())
		$data .= sprintf('
			<div class="col">
				<img src="%s" alt="">
				<div class="row" style=" display: flex;
				flex-direction:column;">
					<h3><a href="product.php?id=%s">%s</a></h3>
					<input type="hidden" value="%s" name="product_id">
					<input type="hidden" value="%s" name="year">
					<input type="hidden" value="%s" name="category">
				</div>
				%s
				%s
			</div>
		', $row["image"], $row["product_id"], $row["name"], $row["product_id"], $row["year"], $row["category"],
		($role == "admin") ? '
			<div class="row">
				<p><a href="update.php?id='.$row["product_id"].'" class="text-small">Редактировать</a></p>
				<p><a onclick="return confirm(\'Вы действительно хотите удалить этот товар?\')" href="asset/controllers/delete_product.php?id='.$row["product_id"].'" class="text-small">Удалить</a></p>
			</div>
		' : '',
		($role != "guest") ? '<button style="background-color: transparent; width:50px; height: 50px;padding:0; border:none;"><a href="asset/controllers/add_cart.php?id='. $row["product_id"] .'"><img src="asset/img/icons8-heart-50.png" style="width:50px; height: 50px;"></a></button>' : '');

	if($data == "")
		$data = '<h3 class="text-center">Товары отсутствуют</h3>';

	include "header.php";
?>

	<main>
		<!--общий контейнер-->
		<div class="content">

			<!--сериалы-->
			<div class="row catalogs">
			<select id="category" onchange="filter.filter('category', 'filter')">
					<option value disabled selected >Фильтр</option>
					<?= $categories ?>
				</select>
										<!-- Форма для поиска товаров -->
<form class="search" method="get" action="search.php">
 <input type="text" name="q" placeholder="Поиск" required>
</form>
				
			</div>

			<div class="row" id="products">
				<?= $data ?>
			</div>

		</div>
		<?php
		include "footer.php";
		?>
	</main>

	<script>filter.products()</script>

