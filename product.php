<!--подключение-->
<?php
	session_start();
	include "connect.php";
	
	$role = (isset($_SESSION["role"])) ? $_SESSION["role"] : "guest";
	$id = (isset($_GET["id"])) ? $_GET["id"] : 0;

	$sql = "SELECT * FROM `products` WHERE `count` > 0 AND `product_id`=". $id;
	if(!$result = $connect->query($sql))
		return die ("Ошибка получения данных: ". $connect->error);

	if(!$product = $result->fetch_assoc())
		return header("Location:index.php?message=Товар отсутствует");

	include "header.php";
?>

	<main>
		<div class="content">
			
			
			<div class="product wrap">
				<div class="image">
					<img src="<?= $product["image"] ?>" alt="" style="height: 400px;">
				</div>
				
				<div class="text">
					<div class="head"><?= $product["name"] ?></div>
					
					<p>Описание: <b><?= $product["country"] ?></b></p>
					<p >Оценка: <b><?= $product["year"] ?></b></p>
					<p>Автор: <b><?= $product["author"] ?></b></p>
					<p>Актер: <b><?= $product["actor"] ?></b></p>
					<p>Список похожих фильмов: <b><?= $product["films"] ?></b></p>
					<div class="image">
					<img src="<?= $product["images"] ?>" alt="">
				</div>
					</div>
					<div class="row">
						
					<br>
					<?php
						if($role == "admin")
							echo '
								<div class="row">
									<p><a href="update.php?id='.$product["product_id"].'" class="text-small">Редактировать</a></p>
									<p><a onclick="return confirm(\'Вы действительно хотите удалить этот товар?\')" href="asset/controllers/delete_product.php?id='.$product["product_id"].'" class="text-small">Удалить</a></p>
								</div>
							';

						if($role != "guest")
							
						echo '<a href="asset/controllers/add_cart.php?id='. $product["product_id"] .'" ><img src="asset/img/icons8-heart-50.png" style="width:50px; height: 50px;"></a></p>';
						
					?></div>
				</div>
			</div>

		</div>
		<?php
		include "footer.php";
		?>
	</main>

