<!--подключение-->
<?php
	session_start();
	include "connect.php";

	$role = (isset($_SESSION["role"])) ? $_SESSION["role"] : "guest";



	$sql = "SELECT * FROM `products2` WHERE `count` > 0 ORDER BY `created_at` DESC";
	if(!$result = $connect->query($sql))
		return die ("Ошибка получения данных: ". $connect->error);

	$data = "";
	while($row = $result->fetch_assoc())
		$data .= sprintf('
			<div class="col">
				
				<div class="row" style=" display: flex;
				flex-direction:column;">
					<h3><a href="product.php?id=%s">%s</a></h3>
					<p class="text-left">%s</p>
					<p>%s ₽⁠/⁠месяц</p>
					<input type="hidden" value="%s" name="product_id">
%s
				%s
				</div>
				
			</div>
		', $row["product_id"], $row["name"],$row["description"], $row["price"], $row["product_id"],
		($role == "admin") ? '
			<div class="row">
				<p><a href="update.php?id='.$row["product_id"].'" class="text-small">Редактировать</a></p>
				<p><a onclick="return confirm(\'Вы действительно хотите удалить этот товар?\')" href="asset/controllers/delete_product.php?id='.$row["product_id"].'" class="text-small">Удалить</a></p>
			</div>
		' : '',
		($role != "guest") ? '<button style="width:200px;color:black;padding:10px;margin:15px 0; "><a href="asset/controllers/add_cart2.php?id='. $row["product_id"] .'" style="color:black;">Оформить</a></button>' : '');

	if($data == "")
		$data = '<h3 class="text-center">Товары отсутствуют</h3>';

	include "header.php";
?>

	<main>
		<div class="content">
				
			</div>

			<div class="row" id="products2">
				<?= $data ?>
			</div>

		</div>
		<?php
		include "footer.php";
		?>
	</main>

	<script>filter.products()</script>

