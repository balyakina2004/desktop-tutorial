-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 15 2023 г., 15:52
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kino`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(1, 'Комедии'),
(2, 'Фэнтези'),
(3, 'Детективы'),
(5, 'Драмы'),
(7, 'Ужасы'),
(8, 'Рекомендации');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `count` int DEFAULT NULL,
  `status` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`order_id`, `product_id`, `user_id`, `number`, `count`, `status`, `reason`, `created_at`, `updated_at`) VALUES
(39, 0, 4, '1886259086', 2, 'Новый', NULL, '2023-11-14 04:31:57', '2023-11-14 04:31:57'),
(52, 0, 3, '1140334133', 7, 'Новый', NULL, '2023-11-15 11:16:45', '2023-11-15 11:16:45'),
(53, 43, 3, NULL, 1, NULL, NULL, '2023-11-15 11:17:13', '2023-11-15 11:17:13'),
(54, 300, 3, NULL, 3, NULL, NULL, '2023-11-15 11:18:42', '2023-11-15 11:40:57'),
(55, 12, 3, NULL, 1, NULL, NULL, '2023-11-15 11:44:06', '2023-11-15 11:44:06'),
(56, 41, 1, NULL, 1, NULL, NULL, '2023-11-15 12:23:47', '2023-11-15 12:23:47');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` float NOT NULL,
  `model` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `actor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `films` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `name`, `country`, `year`, `model`, `category`, `image`, `count`, `created_at`, `author`, `actor`, `films`, `images`) VALUES
(3, 'Круэлла', 'Эстелла была необычным ребёнком, и особенно трудно ей было мириться со всякого рода несправедливостью.', 9.3, 'кино', 'Комедии', 'asset/img/image44.png', 76, '2023-11-02 09:40:41', 'Крэйг Гиллеспи', 'Эмма Стоун Эмма Томпсон Джоэль Фрай Пол Уолтер Хаузер Джон Маккри', 'Круэлла 2', 'asset/img/imgs1.png'),
(5, 'Живая сталь', 'События фильма происходят в будущем, где бокс запрещен за негуманностью и заменен боями 2000-фунтовых роботов, управляемых людьми. ', 7.1, 'кино', 'Комедии', 'asset/img/image56.png', 58, '2023-11-02 09:40:41', 'Шон Леви', 'Хью Джекман Дакота Гойо Эванджелин Лилли Энтони Маки Кевин Дюран', 'Живая сталь 2', 'asset/img/imgs2.png'),
(6, 'Не дождетесь\r\n', 'Молодой мошенник Виталик, попадает на работу в дом престарелых, чтобы спрятаться от преследователей.', 5.9, 'кино', 'Комедии', 'asset/img/image46.png', 42, '2023-11-02 09:40:41', 'Ольга Арлаускас', 'Влад Кунеевский Эммануил Виторган Светлана Немоляева Наталья Варлей Марина Шиманская', 'Нет похожих фильмов', 'asset/img/imgs3.png'),
(7, 'Начало', 'Кобб – талантливый вор, лучший из лучших в опасном искусстве извлечения: он крадет ценные секреты из глубин подсознания во время сна, когда человеческий разум наиболее уязвим.', 8.5, 'кино', 'Фэнтези', 'asset/img/image38.png', 85, '2023-11-02 09:40:41', ' Кристофер Нолан', 'Леонардо ДиКаприо Джозеф Гордон-Левитт Эллиот Пейдж Том Харди', 'Остров проклятых', 'asset/img/imgs4.png'),
(8, 'Интерстеллар', 'Когда засуха, пыльные бури и вымирание растений приводят человечество к продовольственному кризису, коллектив исследователей и учёных отправляется сквозь червоточину (которая предположительно соединяет области пространства-времени через большое расстояние)', 6.5, 'кино', 'Фэнтези', 'asset/img/image39.png', 26, '2023-11-02 09:40:41', ' Кристофер Нолан', 'Мэттью Макконахи Энн Хэтэуэй Джессика Честейн', 'Пекло', 'asset/img/imgs5.png'),
(9, 'Пекло', 'Солнце погибает, и человечество сталкивается с перспективой вымирания. Последняя надежда планеты Земля связана с «Икаром 2» - космическим кораблем, экипаж которого состоит из восьми мужчин и женщин во главе с капитаном Канэдой.', 5.9, 'кино', 'Фэнтези', 'asset/img/image40.png', 15, '2023-11-02 09:40:41', 'Дэнни Бойл', 'Киллиан Мерфи Роуз Бирн Клифф Кёртис Мишель Йео Крис Эванс', 'Интерстеллар', 'asset/img/images6.png'),
(10, 'Бэтмен', 'После двух лет поисков правосудия на улицах Готэма Бэтмен становится для горожан олицетворением беспощадного возмездия.', 9.1, 'кино', 'Детективы', 'asset/img/image41.png', 47, '2023-11-02 09:40:41', ' Мэтт Ривз', 'Роберт Паттинсон Зои Кравиц Пол Дано Джеффри Райт Джон Туртурро', 'Семь', 'asset/img/images30.png'),
(11, 'Шестое чувство', 'Детский психиатр Малкольм Кроу сталкивается со странным случаем: девятилетнего Коула посещают страшные видения - призраки умерших. ', 5.6, 'кино', 'Детективы', 'asset/img/image42.png', 4856, '2023-11-02 09:40:41', ' М. Найт Шьямалан', 'Брюс Уиллис Хэйли Джоэл Осмент Тони Коллетт Оливия Уильямс Тревор Морган', 'Другие', 'asset/img/images31.png'),
(12, 'Кошка', 'В городе один за другим пропадают дети. Родители в отчаянии, полиция уверена, что те вернутся сами, волонтеров на всех не хватает. ', 6.3, 'кино', 'Детективы', 'asset/img/image43.png', 4843, '2023-11-02 09:40:41', ' Карен Оганесян', 'Анастасия Тодореску Вадим Андреев Владимир Капустин Екатерина Вилкова Павел Чинарёв', 'Кошка 2', 'asset/img/images32.png'),
(22, 'Игра в лифте', 'Блогеры повторяют известный ритуал, не подозревая, как он опасен. Хоррор по мотивам городской легенды.', 4.9, 'кино', 'Ужасы', 'asset/img/image10.png', 4184, '2023-11-02 09:40:41', ' Ребека МакКендри', 'Джино Анания Меган Бест Алек Карлос Назарий Демкович Саманта Халас', 'Игра в кальмара', 'asset/img/images10.png'),
(23, 'Оно', 'Когда в городке Дерри штата Мэн начинают пропадать дети, несколько ребят сталкиваются со своими величайшими страхами.', 5.3, 'кино', 'Ужасы', 'asset/img/image8.png', 4841, '2023-11-02 09:40:41', ' Андрес Мускетти', 'Джейден Мартелл Джереми Рэй Тейлор София Лиллис Финн Вулфхард Чоузен Джейкобс', 'Оно 2', 'asset/img/images11.png'),
(24, 'Экзамен', 'Кандидаты на вакансию мечты проходят тест на стрессоустойчивость. Камерный триллер для фанатов «Куба» и «Пилы».', 7.9, 'кино', 'Ужасы', 'asset/img/image9.png', 143, '2023-11-02 09:40:41', ' М. Найт Шьямалан', 'Марк Дюсо Джан Паскаль Фрэнк Грю Мэйн Ди', 'Пила', 'asset/img/images12.png'),
(26, 'Брат', 'Демобилизовавшись, Данила Багров вернулся в родной городок. Но скучная жизнь российской провинции не устраивала его, и он решился податься в Петербург.', 8.9, 'кино', 'Драмы', 'asset/img/image47.png', 2145, '2023-11-02 09:40:41', ' Мэтт Ривз', 'Брюс Уиллис Хэйли Джоэл Осмент Тони Коллетт Оливия Уильямс Тревор Морган', 'Брат 2', 'asset/img/images13.png'),
(27, 'Игла', 'Вернувшись в Алма-Ату, Моро не хочет, чтобы родители знали о его приезде, и в поисках временного пристанища вспоминает о девушке, которую он когда-то любил.', 10, 'кино', 'Драмы', 'asset/img/image48.png', 357, '2023-11-02 09:40:41', ' Карен Оганесян', 'Анастасия Тодореску Вадим Андреев Владимир Капустин Екатерина Вилкова Павел Чинарёв', 'Асса', 'asset/img/images14.png'),
(28, 'Асса', 'Надеясь на яркую и безбедную жизнь, девушка связывает свою судьбу с криминальным авторитетом. Но есть и другая жизнь — свободная и с музыкой, жизнь мальчика Бананана.', 6.7, 'кино', 'Драмы', 'asset/img/image49.png', 6852, '2023-11-02 09:40:41', ' Ребека МакКендри', 'Джино Анания Меган Бест Алек Карлос Назарий Демкович Саманта Халас', 'Игла', 'asset/img/images15.png'),
(29, 'Кухня', 'Молодой повар-провинциал попадает в адский котел модного ресторана. Один из лучших российских ситкомов.', 8.3, 'сериал', 'Комедии', 'asset/img/image50.png', 5875, '2023-11-02 09:40:41', ' Андрес Мускетти', 'Джейден Мартелл Джереми Рэй Тейлор София Лиллис Финн Вулфхард Чоузен Джейкобс', 'Кухня в Париже', 'asset/img/images16.png'),
(30, 'Батя', 'По дороге на юбилей отца Максим вспоминает свое постсоветское детство. Комедия с Владимиром Вдовиченковым.', 7.5, 'сериал', 'Комедии', 'asset/img/image45.png', 259, '2023-11-02 09:40:41', ' Дмитрий Ефимович', 'Андрей Андреев Елена Лядова Стас Старовойтов Надежда Михалкова', 'Трепачи', 'asset/img/images17.png'),
(31, 'Новые папины дочки', 'Веник повторяет судьбу тестя и становится многодетным отцом-одиночкой. Возвращение героев хитового сериала.', 9.8, 'сериал', 'Комедии', 'asset/img/image52.png', 6574, '2023-11-02 09:40:41', ' Александр Жигалкин', 'Филипп Бледный Полина Денисова Полина Айнутдинова Виталия Корниенко', 'Папины дочки', 'asset/img/images18.png'),
(32, 'Открытие ведьм', 'Потомственная ведьма и вампир объединяются для изучения магии. Мистика и романтика в декорациях Оксфорда.', 5.9, 'сериал', 'Фэнтези', 'asset/img/image53.png', 9635, '2023-11-02 09:40:41', ' М. Найт Шьямалан', 'Брюс Уиллис Хэйли Джоэл Осмент Тони Коллетт Оливия Уильямс Тревор Морган', 'Ведьма', 'asset/img/images18.png'),
(33, 'Вечность', 'Героиня попадает в 1993 г. 3 марта и не может от туда выбраться.', 7.2, 'сериал', 'Фэнтези', 'asset/img/image54.png', 2580, '2023-11-02 09:40:41', ' Карен Оганесян', 'Анастасия Тодореску Вадим Андреев Владимир Капустин Екатерина Вилкова Павел Чинарёв', 'Против всех', 'asset/img/images19.png'),
(34, 'Невероятные', 'Герои со сверхспособностями сражаются со злодеями в викторианском Лондоне. Стимпанк-сериал Джосса Уидона.', 8.2, 'сериал', 'Фэнтези', 'asset/img/image55.png', 3254, '2023-11-02 09:40:41', ' Ребека МакКендри', 'Джино Анания Меган Бест Алек Карлос Назарий Демкович Саманта Халас', 'Супер семейка', 'asset/img/images20.png'),
(35, 'Ганнибал', 'Хитроумный маньяк водит за нос талантливого психолога. Самая вычурная и мрачная история о докторе Лектере.', 4.9, 'сериал', 'Детективы', 'asset/img/image57.png', 6324, '2023-11-02 09:40:41', ' Мэтт Ривз', 'Джейден Мартелл Джереми Рэй Тейлор София Лиллис Финн Вулфхард Чоузен Джейкобс', 'Канибал', 'asset/img/images21.png'),
(36, 'Перевал дятлова', 'Зима 1959 года, Уральские горы. Группа из девяти студентов под руководством Игоря Дятлова отправилась в поход к заснеженным вершинам.', 6.8, 'сериал', 'Детективы', 'asset/img/image58.png', 5873, '2023-11-02 09:48:55', ' Дмитрий Ефимович', 'Андрей Андреев Елена Лядова Стас Старовойтов Надежда Михалкова', 'Эльбрус', 'asset/img/images22.png'),
(37, 'Убийство', 'Одно убийство с трех точек зрения — детективов, семьи погибшей и подозреваемых. Следствие затрагивает местных политиков и их связь с этим делом. ', 6.4, 'сериал', 'Детективы', 'asset/img/image59.png', 7967, '2023-11-02 09:48:55', ' Александр Жигалкин', 'Филипп Бледный Полина Денисова Полина Айнутдинова Виталия Корниенко', 'Очень странные дела', 'asset/img/images23.png'),
(38, 'ЛСД 4', '1980-е годы, тихий провинциальный американский городок. Благоприятное течение местной жизни нарушает загадочное исчезновение подростка по имени Уилл.', 8.6, 'сериал', 'Ужасы', 'asset/img/image61.png', 49, '2023-11-02 09:50:46', ' Дмитрий Ефимович', 'Андрей Андреев Елена Лядова Стас Старовойтов Надежда Михалкова', 'Убийство', 'asset/img/images24.png'),
(39, 'Ходячие мертвецы', 'Зомби-эпидемия захлестнула планету. Шериф Рик Граймс путешествует с семьей и небольшой группой выживших в поисках безопасного места. ', 7.9, 'сериал', 'Ужасы', 'asset/img/image60.png', 49, '2023-11-02 09:52:51', ' М. Найт Шьямалан', 'Брюс Уиллис Хэйли Джоэл Осмент Тони Коллетт Оливия Уильямс Тревор Морган', 'Зомби', 'asset/img/images25.png'),
(40, 'AHS', 'Первый сезон сериала сосредоточен на семействе Хармонов, которые переезжают из Бостона в Лос-Анджелес, чтобы начать новую жизнь, и поселяются в старинном отреставрированном особняке.', 6.7, 'сериал', 'Ужасы', 'asset/img/image62.png', 78432, '2023-11-02 09:52:51', ' Карен Оганесян', 'Анастасия Тодореску Вадим Андреев Владимир Капустин Екатерина Вилкова Павел Чинарёв', 'Американская история ужасов', 'asset/img/images26.png'),
(41, 'Король и Шут', 'Чтобы сбежать от реальности, они изобрели свой мир — с колдунами и лесниками. Главный сериал весны.', 8.9, 'сериал', 'Драмы', 'asset/img/image63.png', 47, '2023-11-02 09:54:19', ' Ребека МакКендри', 'Джино Анания Меган Бест Алек Карлос Назарий Демкович Саманта Халас', 'Время', 'asset/img/images27.png'),
(42, 'Монастырь', 'Московская оторва попадает в монастырь. Завораживающая трансформация Насти Ивлеевой в руках Филиппа Янковского.', 8.1, 'сериал', 'Драмы', 'asset/img/image64.png', 78432, '2023-11-02 09:54:19', ' Андрес Мускетти', 'Джейден Мартелл Джереми Рэй Тейлор София Лиллис Финн Вулфхард Чоузен Джейкобс', 'Страсти по Матвею', 'asset/img/images28.png'),
(43, 'Отчаенные домохозяйки', 'В центре событий - четыре современные домохозяйки, которые живут в тихом пригороде и отчаянно ищут личного счастья.\n\nСьюзан осталась одна после того, как муж променял её на секретаршу.', 6.8, 'сериал', 'Драмы', 'asset/img/image65.png', 46, '2023-11-02 09:55:01', ' Мэтт Ривз', 'Брюс Уиллис Хэйли Джоэл Осмент Тони Коллетт Оливия Уильямс Тревор Морган', 'Один дома', 'asset/img/images29.png'),
(44, 'Бэтмон', 'После двух лет поисков правосудия на улицах Готэма Бэтмен становится для горожан олицетворением беспощадного возмездия.', 9.1, 'кино', 'Рекомендации', 'asset/img/image41.png', 47, '2023-11-02 09:40:41', 'Мэтт Ривз', 'Роберт Паттинсон Зои Кравиц Пол Дано Джеффри Райт Джон Туртурро', 'Семь', 'asset/img/images30.png'),
(45, 'Оно', 'Когда в городке Дерри штата Мэн начинают пропадать дети, несколько ребят сталкиваются со своими величайшими страхами.', 5.3, 'кино', 'Рекомендации', 'asset/img/image8.png', 4841, '2023-11-02 09:40:41', ' Андрес Мускетти', 'Джейден Мартелл Джереми Рэй Тейлор София Лиллис Финн Вулфхард Чоузен Джейкобс', 'Оно 2', 'asset/img/images11.png'),
(46, 'Асса', 'Надеясь на яркую и безбедную жизнь, девушка связывает свою судьбу с криминальным авторитетом. Но есть и другая жизнь — свободная и с музыкой, жизнь мальчика Бананана.', 6.7, 'кино', 'Рекомендации', 'asset/img/image49.png', 6852, '2023-11-02 09:40:41', 'Ребека МакКендри', 'Джино Анания Меган Бест Алек Карлос Назарий Демкович Саманта Халас', 'Игла', 'asset/img/images15.png');

-- --------------------------------------------------------

--
-- Структура таблицы `products2`
--

CREATE TABLE `products2` (
  `product_id` int NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` int NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products2`
--

INSERT INTO `products2` (`product_id`, `name`, `count`, `created_at`, `price`, `description`) VALUES
(300, 'illuminos', 55, '2023-11-02 09:40:41', 199, 'Более 70 000 фильмов, сериалов и мультфильмов, прямые трансляции, детский профиль и родительский контроль, загрузка и просмотр без интернета'),
(500, 'illuminos +', 49, '2023-11-02 09:40:41', 299, 'Более 70 000 фильмов, сериалов и мультфильмов, прямые трансляции, детский профиль и родительский контроль, загрузка и просмотр без интернета, музыка, подкасты и аудиокниги, повышенные бонусы \"СберСпасибо\" от партнеров');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `patronymic` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `name`, `surname`, `patronymic`, `login`, `email`, `password`, `role`) VALUES
(1, 'admin', 'admin', 'admin', 'admin', 'admin@ds', 'admin', 'admin'),
(2, 'ads', 'asfd', 'sdfa', 'qwe', 'saad@as', '123', 'client'),
(3, 'ф', 'ф', 'ф', '1', 'd@hjgkj.gvb', '1234567', 'client');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `products2`
--
ALTER TABLE `products2`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `products2`
--
ALTER TABLE `products2`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
