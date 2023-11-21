<!--подключение-->
<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "kino";
$conn = new mysqli($servername, $username, $password, $dbname);

include "header.php";
// Получение списка товаров из базы данных
if ($_SERVER["REQUEST_METHOD"] == "GET") {
 $search_query = $_GET["q"];
 $sql = "SELECT * FROM products WHERE name LIKE 
'%$search_query%'";
 $result = $conn->query($sql);
}

?>

 <?php while ($row = $result->fetch_assoc()) { ?>
<section class="search">
 <img src="<?php echo $row["image"]?>"> 
 <div class="search__text">
   <p> <?php echo $row["name"]; ?></p>
 <p class="text-small"><?php echo $row["model"]; ?></p>
 <p>Описание: <?php echo $row["country"]; ?></p>
 <p>Оценка: <?php echo $row["year"]; ?></p>
 <p>Автор: <?php echo $row["author"]; ?></p>
 <p>Актер: <?php echo $row["actor"]; ?></p>
 <p>Список похожих фильмов: <?php echo $row["films"]; ?></p>

 </div>
</section>
 <?php
 }?>