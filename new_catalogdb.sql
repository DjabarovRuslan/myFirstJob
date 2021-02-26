-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 09 2020 г., 20:12
-- Версия сервера: 5.6.41
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `new_catalogdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL,
  `alias` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `parent`, `alias`) VALUES
(685, 'Комплектующие к Apple', 0, 'komplektuyuschie-k-apple'),
(691, 'Запчасти iPad - 691', 685, 'zapchasti-ipad---691'),
(692, 'Запчасти iPhone', 685, 'zapchasti-iphone'),
(693, 'Запчасти iPod', 685, 'zapchasti-ipod'),
(694, 'Запчасти Mac', 685, 'zapchasti-mac'),
(695, 'iPad - 695', 691, 'ipad---695'),
(696, 'iPad 2 - 696', 691, 'ipad-2---696'),
(697, 'iPad NEW (iPad 3)', 691, 'ipad-new-ipad-3'),
(698, 'iPad 4', 691, 'ipad-4'),
(699, 'iPad mini - 699', 691, 'ipad-mini---699'),
(700, 'iPhone - 700', 692, 'iphone---700'),
(701, 'iPhone 3G/3GS', 692, 'iphone-3g-3gs'),
(702, 'iPhone 4', 692, 'iphone-4'),
(703, 'iPhone 4S', 692, 'iphone-4s'),
(704, 'iPhone 5 -704', 692, 'iphone-5--704'),
(705, 'Микросхемы Apple', 685, 'mikroshemy-apple'),
(836, 'Защитные плёнки на Apple', 0, 'zaschitnye-plenki-na-apple'),
(840, 'iPad- 841', 836, 'ipad--841'),
(841, 'iPhone - 841', 836, 'iphone---841'),
(842, 'iPod', 836, 'ipod'),
(843, 'Mac', 836, 'mac'),
(853, 'Оборудование для ремонта Apple', 0, 'oborudovanie-dlya-remonta-apple'),
(876, 'Аксессуары для Apple - 876', 0, 'aksessuary-dlya-apple---876'),
(877, 'Аксессуары iPad', 876, 'aksessuary-ipad'),
(878, 'Аксессуары iPhone', 876, 'aksessuary-iphone'),
(879, 'Аксессуары iPod', 876, 'aksessuary-ipod'),
(880, 'Аксессуары Mac', 876, 'aksessuary-mac'),
(881, 'iPad - 881', 877, 'ipad---881'),
(882, 'iPad 2- 882', 877, 'ipad-2--882'),
(883, 'iPad NEW 3 / iPad 4', 877, 'ipad-new-3-ipad-4'),
(884, 'iPad mini - 884', 877, 'ipad-mini---884'),
(885, 'iPhone 3G / 3GS', 878, 'iphone-3g-3gs'),
(886, 'iPhone 4 / 4S', 878, 'iphone-4-4s'),
(887, 'iPhone 5 - 887', 878, 'iphone-5---887'),
(888, 'Аксессуары для Apple - 888', 876, 'aksessuary-dlya-apple---888'),
(895, 'iPhone 5 Lamborghini', 878, 'iphone-5-lamborghini');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_text` text NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comment_product` int(10) UNSIGNED NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_author`, `comment_text`, `parent`, `comment_product`, `approved`, `created`, `is_admin`) VALUES
(1, 'Андрей', 'Привет, мир!', 0, 10875, '1', '2013-12-01 07:24:31', 0),
(2, 'Валерия', 'Товар подошел', 0, 10875, '1', '2013-12-03 11:25:05', 0),
(3, 'Менеджер', 'Отлично!\r\nОбращайтесь еще :)', 2, 10875, '1', '2013-12-04 11:26:02', 1),
(4, '<h1>Просто покупатель</h1>', '<h1> хулиган </h1>', 0, 10875, '0', '2013-12-17 11:26:34', 0),
(5, 'Валерия', 'Спасибо)', 3, 10875, '1', '2013-12-31 11:27:15', 0),
(6, 'Конкурент', 'Тестовый коммент', 0, 11608, '1', '2013-12-31 11:28:17', 0),
(91, '111', '111', 0, 11608, '0', '2020-04-12 21:03:41', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `forgot`
--

CREATE TABLE `forgot` (
  `id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(32) NOT NULL,
  `expire` int(10) UNSIGNED NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `forgot`
--

INSERT INTO `forgot` (`id`, `hash`, `expire`, `email`) VALUES
(6, '89ff4faf48005144e225e4f907824b29', 1587961649, 'andrey@mail.ru');

-- --------------------------------------------------------

--
-- Структура таблицы `options`
--

CREATE TABLE `options` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `options`
--

INSERT INTO `options` (`id`, `title`, `name`, `value`) VALUES
(1, 'course', 'Курс', '22'),
(2, 'email', 'Контактный email', 'admin@catalog.loc'),
(3, 'pagination', 'Кол-во товаров на страницу', '6'),
(4, 'site_title', 'Название сайта', 'Webformyself Каталог ruslan'),
(7, 'theme', 'тема', 'apple');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `page_id` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`page_id`, `title`, `alias`, `description`, `keywords`, `text`, `position`) VALUES
(1, 'Главная', 'index', 'Описание главной', 'ключевики главной', 'Текст главной страницы', 1),
(2, 'О компании', 'about', 'Описание о компании', 'ключевики о компании', 'Текст страницы о компании!!<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt eaque a sint nam nihil officiis ex praesentium incidunt pariatur similique, cum, repudiandae accusamus! Ipsam optio facere ducimus consequatur magni modi, eveniet iusto explicabo sapiente, sint numquam expedita quo, incidunt sed minima iste ullam repellat ipsum ea cupiditate, delectus rerum tempora rem mollitia! In, minus delectus aliquid! Libero ipsa alias quo voluptas ullam deserunt, earum aspernatur amet magnam, asperiores assumenda ipsam, beatae consectetur non tenetur, veniam molestiae. Dolorem illo voluptatibus repudiandae dicta dolores dolore accusantium non eveniet tempora sint ipsa, eius iure excepturi ratione magnam quaerat reiciendis ducimus ipsum molestias est!</p>\r\n      <p>Nemo porro hic repellendus fugit suscipit error quasi, placeat commodi ducimus aliquid similique officia provident quisquam ipsum odit in? Quos soluta qui dolores ratione minima officia aspernatur quod laborum eligendi inventore possimus, id eum, velit repellat at fuga rem sint. Veniam, sed facilis doloremque nostrum, tenetur, corporis, voluptatem quam reiciendis quis adipisci beatae culpa. Doloribus numquam eum dolorem dolore asperiores unde commodi accusamus temporibus eius autem. Impedit perspiciatis cum perferendis consequatur, dicta, praesentium nam nobis quae eligendi dignissimos sequi quas voluptas, dolorem pariatur modi. Necessitatibus eaque molestiae saepe sint repellendus a nisi? Totam ipsum voluptatem sunt molestias eaque, veritatis illum.</p>\r\n      <p>Suscipit odio facere adipisci id excepturi consequuntur at, illo voluptatem incidunt nesciunt temporibus nisi alias, natus, doloremque laudantium esse sint maiores ad. Impedit ea quos odit temporibus unde saepe velit maxime quis neque distinctio quia sapiente exercitationem eaque, fugit cumque hic, dolor veniam sit modi obcaecati commodi. Quaerat consectetur iure provident earum ipsa aliquam laboriosam illo id ex sint perspiciatis fugiat, ea repellendus, est ut placeat incidunt magni facere. Quisquam provident recusandae eum tempore! Rerum natus, deleniti nam iusto obcaecati repudiandae eaque necessitatibus voluptatibus dolorem earum cum qui adipisci totam ducimus nemo veniam, ea dolor facilis sit doloremque maiores quidem.</p>', 2),
(3, 'Контакты', 'contacts', 'Описание Контакты', 'ключевики контакты', 'Текст страницы Контакты!!!<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt eaque a sint nam nihil officiis ex praesentium incidunt pariatur similique, cum, repudiandae accusamus! Ipsam optio facere ducimus consequatur magni modi, eveniet iusto explicabo sapiente, sint numquam expedita quo, incidunt sed minima iste ullam repellat ipsum ea cupiditate, delectus rerum tempora rem mollitia! In, minus delectus aliquid! Libero ipsa alias quo voluptas ullam deserunt, earum aspernatur amet magnam, asperiores assumenda ipsam, beatae consectetur non tenetur, veniam molestiae. Dolorem illo voluptatibus repudiandae dicta dolores dolore accusantium non eveniet tempora sint ipsa, eius iure excepturi ratione magnam quaerat reiciendis ducimus ipsum molestias est!</p>\r\n      <p>Nemo porro hic repellendus fugit suscipit error quasi, placeat commodi ducimus aliquid similique officia provident quisquam ipsum odit in? Quos soluta qui dolores ratione minima officia aspernatur quod laborum eligendi inventore possimus, id eum, velit repellat at fuga rem sint. Veniam, sed facilis doloremque nostrum, tenetur, corporis, voluptatem quam reiciendis quis adipisci beatae culpa. Doloribus numquam eum dolorem dolore asperiores unde commodi accusamus temporibus eius autem. Impedit perspiciatis cum perferendis consequatur, dicta, praesentium nam nobis quae eligendi dignissimos sequi quas voluptas, dolorem pariatur modi. Necessitatibus eaque molestiae saepe sint repellendus a nisi? Totam ipsum voluptatem sunt molestias eaque, veritatis illum.</p>\r\n      <p>Suscipit odio facere adipisci id excepturi consequuntur at, illo voluptatem incidunt nesciunt temporibus nisi alias, natus, doloremque laudantium esse sint maiores ad. Impedit ea quos odit temporibus unde saepe velit maxime quis neque distinctio quia sapiente exercitationem eaque, fugit cumque hic, dolor veniam sit modi obcaecati commodi. Quaerat consectetur iure provident earum ipsa aliquam laboriosam illo id ex sint perspiciatis fugiat, ea repellendus, est ut placeat incidunt magni facere. Quisquam provident recusandae eum tempore! Rerum natus, deleniti nam iusto obcaecati repudiandae eaque necessitatibus voluptatibus dolorem earum cum qui adipisci totam ducimus nemo veniam, ea dolor facilis sit doloremque maiores quidem.</p>', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'empty_thumb.jpg',
  `price` float NOT NULL,
  `m_title` varchar(255) DEFAULT NULL,
  `m_desc` varchar(255) DEFAULT NULL,
  `m_keys` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `alias`, `parent`, `content`, `image`, `price`, `m_title`, `m_desc`, `m_keys`) VALUES
(7582, 'LCD iPod Touch ', 'lcd-ipod-touch', 693, 'tlcd', 'product.jpg', 22, NULL, NULL, NULL),
(7583, 'Len+Touchscreen iPod Touch ', 'len-touchscreen-ipod-touch', 693, '', 'product.jpg', 12, NULL, NULL, NULL),
(8833, 'Аккумулятор iPod Touch 1G ', 'akkumulyator-ipod-touch-1g', 693, 'to2uch', 'product.jpg', 7.3, NULL, NULL, NULL),
(8834, 'Аккумулятор iPod Touch 2G ', 'akkumulyator-ipod-touch-2g', 693, '', 'product.jpg', 7.7, NULL, NULL, NULL),
(8935, 'Len+Touchscreen iPod Touch 2G', 'len-touchscreen-ipod-touch-2g', 693, '', 'product.jpg', 15, NULL, NULL, NULL),
(8989, 'LCD iPod Touch 2G', 'lcd-ipod-touch-2g', 693, '', 'product.jpg', 12, NULL, NULL, NULL),
(9087, 'Buzzer iPod Nano 5G', 'buzzer-ipod-nano-5g', 693, '', 'product.jpg', 2.7, NULL, NULL, NULL),
(9352, 'LCD iPod Nano 4G', 'lcd-ipod-nano-4g', 693, '', 'product.jpg', 14, NULL, NULL, NULL),
(9353, 'Len iPod Nano 4G', 'len-ipod-nano-4g', 693, '', 'product.jpg', 5.3, NULL, NULL, NULL),
(9508, 'Аккумулятор iPod Nano 2G', 'akkumulyator-ipod-nano-2g', 693, '', 'product.jpg', 7, NULL, NULL, NULL),
(9509, 'Аккумулятор iPod Nano 3G', 'akkumulyator-ipod-nano-3g', 693, '', 'product.jpg', 8.5, NULL, NULL, NULL),
(9918, 'LCD iPod Touch 4G+Touchscreen (black)', 'lcd-ipod-touch-4g-touchscreen-black', 693, '', 'product.jpg', 24, NULL, NULL, NULL),
(9967, 'LCD iPod Nano 5G', 'lcd-ipod-nano-5g', 693, '', 'product.jpg', 14, NULL, NULL, NULL),
(10390, 'LCD iPod Nano 6G', 'lcd-ipod-nano-6g', 693, '<p>\r\n	only lcd</p>\r\n', 'product.jpg', 16, NULL, NULL, NULL),
(10486, 'Flat сable iPod nano 6G with on/off button and volume', 'flat-sable-ipod-nano-6g-with-on-off-button-and-volume', 693, '', 'product.jpg', 10.1, NULL, NULL, NULL),
(10733, 'Housing Cover iPod nano 3G (silver)', 'housing-cover-ipod-nano-3g-silver', 693, '', 'product.jpg', 8.5, NULL, NULL, NULL),
(11062, 'LCD iPod Touch 4G+Touchscreen (white)', 'lcd-ipod-touch-4g-touchscreen-white', 693, '', 'product.jpg', 23, NULL, NULL, NULL),
(11629, 'Flat Cable on/off iPod touch 4G', 'flat-cable-on-off-ipod-touch-4g', 693, '', 'product.jpg', 8.5, NULL, NULL, NULL),
(11630, 'Аккумулятор iPod Classic 616-0232(160gb)', 'akkumulyator-ipod-classic-616-0232-160gb', 693, '', 'product.jpg', 9, NULL, NULL, NULL),
(12100, 'LCD iPod Nano 2G', 'lcd-ipod-nano-2g', 693, '', 'product.jpg', 14, NULL, NULL, NULL),
(12145, 'LCD iPod Nano 6G module', 'lcd-ipod-nano-6g-module', 693, '', 'product.jpg', 50, NULL, NULL, NULL),
(12147, 'On/off outside home iPod Touch 4G (black)', 'on-off-outside-home-ipod-touch-4g-black', 693, '', 'product.jpg', 4, NULL, NULL, NULL),
(12148, 'On/off outside home iPod Touch 4G (white)', 'on-off-outside-home-ipod-touch-4g-white', 693, '', 'product.jpg', 4, NULL, NULL, NULL),
(12217, 'Аккумулятор iPod Nano 6G', 'akkumulyator-ipod-nano-6g', 693, '', 'product.jpg', 10.5, NULL, NULL, NULL),
(13219, 'Camera iPod Touch 4G', 'camera-ipod-touch-4g', 693, '', 'product.jpg', 12, NULL, NULL, NULL),
(12915, 'Housing iPod Touch 4G 32G/64G (silver)', 'housing-ipod-touch-4g-32g-64g-silver', 693, '', 'product.jpg', 17.5, NULL, NULL, NULL),
(13003, 'Скотч для Touchscreen iPod Touch 4G', 'skotch-dlya-touchscreen-ipod-touch-4g', 693, '', 'product.jpg', 1.1, NULL, NULL, NULL),
(13065, 'Аккумулятор iPod Classic 616-0229 (80gb/120gb)', 'akkumulyator-ipod-classic-616-0229-80gb-120gb', 693, '', 'product.jpg', 9, NULL, NULL, NULL),
(13094, 'Аккумулятор iPod Touch 4G', 'akkumulyator-ipod-touch-4g', 693, '', 'product.jpg', 13.4, NULL, NULL, NULL),
(13220, 'Hands-free connector iPod Touch 4G', 'hands-free-connector-ipod-touch-4g', 693, '', 'product.jpg', 6.5, NULL, NULL, NULL),
(13295, 'LCD iPod Nano 7G', 'lcd-ipod-nano-7g', 693, '', 'product.jpg', 20, NULL, NULL, NULL),
(10621, 'Glass Screen Cover for MacBook Pro 13.3\"', 'glass-screen-cover-for-macbook-pro-13-3', 694, 'защитное стекло экрана', 'product.jpg', 59, NULL, NULL, NULL),
(10622, 'Glass Screen Cover for MacBook Pro 15.4\"', 'glass-screen-cover-for-macbook-pro-15-4', 694, 'защитное стекло экрана ', 'product.jpg', 69, NULL, NULL, NULL),
(10623, 'Glass Screen Cover for MacBook Pro 17.1\"', 'glass-screen-cover-for-macbook-pro-17-1', 694, 'защитное стекло экрана', 'product.jpg', 77, NULL, NULL, NULL),
(9639, 'Клипсы для дисплея iPad ', 'klipsy-dlya-displeya-ipad', 695, '', 'product.jpg', 0.3, NULL, NULL, NULL),
(9780, 'Housing iPad 3G (silver)', 'housing-ipad-3g-silver', 695, 'Корпус на iPad 3G серебристый', 'product.jpg', 55, NULL, NULL, NULL),
(10162, 'Аккумулятор iPad ', 'akkumulyator-ipad', 695, '', 'product.jpg', 30, NULL, NULL, NULL),
(10373, 'Housing iPad  Wi-Fi', 'housing-ipad-wi-fi', 695, 'Корпус для iPad 3 Wi-Fi', 'product.jpg', 75, NULL, NULL, NULL),
(10462, 'Flat Cable iPad + HF connector', 'flat-cable-ipad-hf-connector', 695, 'Шлейф с разъёмом наушников на iPad', 'product.jpg', 8.8, NULL, NULL, NULL),
(10131, 'Flat Cable iPad 2 with charger connector', 'flat-cable-ipad-2-with-charger-connector', 696, 'Шлейф на iPad 2 с системным разьемом.', 'product.jpg', 8.5, NULL, NULL, NULL),
(10132, 'Flat Cable iPad 2 with switch on/off & switch vibro', 'flat-cable-ipad-2-with-switch-on-off-switch-vibro', 696, 'Шлейф с кнопками громкости и кнопкой включения', 'product.jpg', 13.5, NULL, NULL, NULL),
(10133, 'Двухсторонний скотч для iPad 2 (комплект)', 'dvuhstoronniy-skotch-dlya-ipad-2-komplekt', 696, '', 'product.jpg', 3, NULL, NULL, NULL),
(10134, 'Flat Cable iPad 2 3G with sim & HF connector (black)', 'flat-cable-ipad-2-3g-with-sim-hf-connector-black', 696, 'Шлейф в комплекте с SIM-держателем и разьемом гарнитуры черного цвета ', 'product.jpg', 9.99, NULL, NULL, NULL),
(10135, 'Flat Cable iPad 2 3G with sim & HF connector (white)', 'flat-cable-ipad-2-3g-with-sim-hf-connector-white', 696, 'Шлейф в комплекте с SIM-держателем и разьемом гарнитуры белого цвета ', 'product.jpg', 9.99, NULL, NULL, NULL),
(10136, 'Flat Cable iPad 2 Wi-Fi with HF connector', 'flat-cable-ipad-2-wi-fi-with-hf-connector', 696, '', 'product.jpg', 10, NULL, NULL, NULL),
(10161, 'LCD iPad 2  only lcd', 'lcd-ipad-2-only-lcd', 696, 'AB0970003013', 'product.jpg', 70, NULL, NULL, NULL),
(10163, 'Touchscreen + Len iPad 2 (black)', 'touchscreen-len-ipad-2-black', 696, 'сенсорное стекло с чёрной рамкой', 'product.jpg', 36, NULL, NULL, NULL),
(10164, 'Touchscreen + Len iPad 2 (white)', 'touchscreen-len-ipad-2-white', 696, 'сенсорное стекло с белой рамкой', 'product.jpg', 36, NULL, NULL, NULL),
(10375, 'Camera iPad 2 big (front)', 'camera-ipad-2-big-front', 696, 'камера передняя', 'product.jpg', 4.8, NULL, NULL, NULL),
(10461, 'Mic iPad 2 (микрофон)', 'mic-ipad-2-mikrofon', 696, 'микрофон на шлейфе с разъёмом для iPad 2', 'product.jpg', 4.8, NULL, NULL, NULL),
(10463, 'Camera iPad 2 small (back)', 'camera-ipad-2-small-back', 696, 'камера задняя', 'product.jpg', 4.8, NULL, NULL, NULL),
(10563, 'On/off inside Home iPad 2', 'on-off-inside-home-ipad-2', 696, 'центральная кнопка  (внутреняя) на плате для iPad 2.', 'product.jpg', 3.99, NULL, NULL, NULL),
(10564, 'Button Home iPad 2 (black)', 'button-home-ipad-2-black', 696, 'Наружная кнопка главного меню на iPad 2 WiFi/iPad 2 WiFi+3G, чёрного цвета.', 'product.jpg', 1.99, NULL, NULL, NULL),
(10565, 'Antenna iPad 2 bluetooth', 'antenna-ipad-2-bluetooth', 696, '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt eaque a sint nam nihil officiis ex praesentium incidunt pariatur similique, cum, repudiandae accusamus! Ipsam optio facere ducimus consequatur magni modi, eveniet iusto explicabo sapiente, sint numquam expedita quo, incidunt sed minima iste ullam repellat ipsum ea cupiditate, delectus rerum tempora rem mollitia! In, minus delectus aliquid! Libero ipsa alias quo voluptas ullam deserunt, earum aspernatur amet magnam, asperiores assumenda ipsam, beatae consectetur non tenetur, veniam molestiae. Dolorem illo voluptatibus repudiandae dicta dolores dolore accusantium non eveniet tempora sint ipsa, eius iure excepturi ratione magnam quaerat reiciendis ducimus ipsum molestias est!</p>\r\n      <p>Nemo porro hic repellendus fugit suscipit error quasi, placeat commodi ducimus aliquid similique officia provident quisquam ipsum odit in? Quos soluta qui dolores ratione minima officia aspernatur quod laborum eligendi inventore possimus, id eum, velit repellat at fuga rem sint. Veniam, sed facilis doloremque nostrum, tenetur, corporis, voluptatem quam reiciendis quis adipisci beatae culpa. Doloribus numquam eum dolorem dolore asperiores unde commodi accusamus temporibus eius autem. Impedit perspiciatis cum perferendis consequatur, dicta, praesentium nam nobis quae eligendi dignissimos sequi quas voluptas, dolorem pariatur modi. Necessitatibus eaque molestiae saepe sint repellendus a nisi? Totam ipsum voluptatem sunt molestias eaque, veritatis illum.</p>\r\n      <p>Suscipit odio facere adipisci id excepturi consequuntur at, illo voluptatem incidunt nesciunt temporibus nisi alias, natus, doloremque laudantium esse sint maiores ad. Impedit ea quos odit temporibus unde saepe velit maxime quis neque distinctio quia sapiente exercitationem eaque, fugit cumque hic, dolor veniam sit modi obcaecati commodi. Quaerat consectetur iure provident earum ipsa aliquam laboriosam illo id ex sint perspiciatis fugiat, ea repellendus, est ut placeat incidunt magni facere. Quisquam provident recusandae eum tempore! Rerum natus, deleniti nam iusto obcaecati repudiandae eaque necessitatibus voluptatibus dolorem earum cum qui adipisci totam ducimus nemo veniam, ea dolor facilis sit doloremque maiores quidem.</p>', 'product.jpg', 6.8, NULL, NULL, NULL),
(10566, 'Antenna iPad 2 Wi-Fi', 'antenna-ipad-2-wi-fi', 696, 'антенна Wi-Fi', 'product.jpg', 6.2, NULL, NULL, NULL),
(10734, 'Touch socket iPad 2 (black) ', 'touch-socket-ipad-2-black', 696, 'Рамка под дисплей на iPad 2 чёрного цвета', 'product.jpg', 3.9, NULL, NULL, NULL),
(10735, 'Touch socket iPad 2 (white) ', 'touch-socket-ipad-2-white', 696, 'Рамка под дисплей на iPad 2 белого цвета', 'product.jpg', 3.9, NULL, NULL, NULL),
(10786, 'Sim card holder outside iPad 2', 'sim-card-holder-outside-ipad-2', 696, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(10880, 'Аккумулятор iPad 2', 'akkumulyator-ipad-2', 696, '', 'product.jpg', 29, NULL, NULL, NULL),
(11061, 'Button Home iPad 2 (white)', 'button-home-ipad-2-white', 696, 'Наружная кнопка главного меню на iPad 2 WiFi/iPad 2 WiFi+3G, белого цвета.', 'product.jpg', 1.99, NULL, NULL, NULL),
(12972, 'Touchscreen + Len iPad 2 (black) copy', 'touchscreen-len-ipad-2-black-copy', 696, 'сенсорное стекло с чёрной рамкой', 'product.jpg', 29, NULL, NULL, NULL),
(13211, 'Flat Cable iPad 2 on LCD', 'flat-cable-ipad-2-on-lcd', 696, 'дисплейный шлейф', 'product.jpg', 5.99, NULL, NULL, NULL),
(13402, 'Housing iPad 2', 'housing-ipad-2', 696, '', 'product.jpg', 85, NULL, NULL, NULL),
(12149, 'LCD iPad NEW 3/4 only lcd', 'lcd-ipad-new-3-4-only-lcd', 697, '<p>\r\n	дисплей для iPad NEW 3 без сенсора</p>\r\n', 'product.jpg', 72, NULL, NULL, NULL),
(12154, 'Touchscreen + Len iPad NEW 3/4 (black)', 'touchscreen-len-ipad-new-3-4-black', 697, 'Сенсорное стекло черного цвета для iPad 3', 'product.jpg', 58, NULL, NULL, NULL),
(12263, 'Touchscreen + Len iPad NEW 3/4 (white)', 'touchscreen-len-ipad-new-3-4-white', 697, '<p>\r\n	Сенсорное стекло белого цвета для iPad 3</p>\r\n', 'product.jpg', 58, NULL, NULL, NULL),
(12836, 'Camera iPad New 3 back', 'camera-ipad-new-3-back', 697, 'камера задняя', 'product.jpg', 25.5, NULL, NULL, NULL),
(12922, 'Housing iPad NEW 3 Wi-Fi 3G', 'housing-ipad-new-3-wi-fi-3g', 697, '<p>\r\n	Задняя крышка корпуса для iPad 3 WiFi серебристого цвета</p>\r\n', 'product.jpg', 105, NULL, NULL, NULL),
(13118, 'Flat Cable NEW iPad 3 with switch volume on/off &amp; switch vibro', 'flat-cable-new-ipad-3-with-switch-volume-on-off-amp-switch-vibro', 697, '<p>\r\n	Шлейф для iPad New 3 с кнопками регулировки громкости и включения</p>\r\n', 'product.jpg', 6, NULL, NULL, NULL),
(13209, 'Flat Cable iPad 3 with HF connector', 'flat-cable-ipad-3-with-hf-connector', 697, '', 'product.jpg', 39.9, NULL, NULL, NULL),
(13251, 'Touchscreen + Len iPad NEW 3/4 (black) copy', 'touchscreen-len-ipad-new-3-4-black-copy', 697, '', 'product.jpg', 45, NULL, NULL, NULL),
(13252, 'Touchscreen + Len iPad NEW 3/4 (white) copy ', 'touchscreen-len-ipad-new-3-4-white-copy', 697, '', 'product.jpg', 45, NULL, NULL, NULL),
(13408, 'Flat Cable iPad NEW 3 with charger connector', 'flat-cable-ipad-new-3-with-charger-connector', 697, '<p>\r\n	Шлейф с системным коннектором для iPad NEW (iPad 3)</p>\r\n', 'product.jpg', 7.4, NULL, NULL, NULL),
(13409, 'Buzzer iPad NEW 3 (2pcs) with frame', 'buzzer-ipad-new-3-2pcs-with-frame', 697, '<p>\r\n	Динамик полифонический для iPad New 3 (2 шт) в рамке</p>\r\n', 'product.jpg', 15.9, NULL, NULL, NULL),
(13417, 'Antenna iPad NEW 3 bluetooth', 'antenna-ipad-new-3-bluetooth', 697, '<p>\r\n	Антенна з блютузом для iPad 3</p>\r\n', 'product.jpg', 4.8, NULL, NULL, NULL),
(13418, 'Antenna iPad NEW 3 GPS', 'antenna-ipad-new-3-gps', 697, '<p>\r\n	Антенна для iPad 3 GPS</p>\r\n', 'product.jpg', 4.8, NULL, NULL, NULL),
(13420, 'Antenna 3G iPad NEW 3 (2pcs)', 'antenna-3g-ipad-new-3-2pcs', 697, '<p>\r\n	Антенна 3G для iPad New 3 (правая и левая)</p>\r\n', 'product.jpg', 6.8, NULL, NULL, NULL),
(13422, 'Flat Cable iPad NEW 3 with microphone', 'flat-cable-ipad-new-3-with-microphone', 697, '<p>\r\n	Шлейф для iPad New 3 c микрофоном</p>\r\n', 'product.jpg', 3.8, NULL, NULL, NULL),
(13547, 'Camera iPad New 3 front', 'camera-ipad-new-3-front', 697, '', 'product.jpg', 12, NULL, NULL, NULL),
(12913, 'Touchscreen iPad mini (black)', 'touchscreen-ipad-mini-black', 699, 'Сенсорное стекло на iPad mini чёрного цвета', 'product.jpg', 99, NULL, NULL, NULL),
(12914, 'Touchscreen iPad mini (white)', 'touchscreen-ipad-mini-white', 699, 'Сенсорное стекло на iPad mini белого цвета', 'product.jpg', 99, NULL, NULL, NULL),
(12970, 'LCD iPad mini', 'lcd-ipad-mini', 699, 'Дисплей на iPad mini', 'product.jpg', 68, NULL, NULL, NULL),
(13410, 'Flat Cable iPad mini with connector system (white)', 'flat-cable-ipad-mini-with-connector-system-white', 699, '<p>\r\n	Шлейф с системным разьёмом белого цвета для iPad MINI.</p>\r\n', 'product.jpg', 12.8, NULL, NULL, NULL),
(13412, 'Button Home iPad mini (black)', 'button-home-ipad-mini-black', 699, '<p>\r\n	Кнопка главного меню чёрного цвета для iPad MINI.</p>\r\n', 'product.jpg', 2.8, NULL, NULL, NULL),
(13411, 'Flat Cable iPad mini with connector system (black)', 'flat-cable-ipad-mini-with-connector-system-black', 699, '<p>\r\n	Шлейф с системным разьёмом чёрного цвета для iPad MINI</p>\r\n', 'product.jpg', 12.8, NULL, NULL, NULL),
(13413, 'Button Home iPad mini (white)', 'button-home-ipad-mini-white', 699, '<p>\r\n	Кнопка главного меню белого цвета для iPad MINI.</p>\r\n', 'product.jpg', 2.8, NULL, NULL, NULL),
(13414, 'Flat Cable iPad mini with hands-free connector (black)', 'flat-cable-ipad-mini-with-hands-free-connector-black', 699, '<p>\r\n	Шлейф с разьемом гарнитуры черного цвета для iPad MINI</p>\r\n', 'product.jpg', 7.4, NULL, NULL, NULL),
(13415, 'Flat Cable iPad mini with hands-free connector (white)', 'flat-cable-ipad-mini-with-hands-free-connector-white', 699, '<p>\r\n	Шлейф с разьемом гарнитуры белого цвета для iPad MINI</p>\r\n', 'product.jpg', 7.4, NULL, NULL, NULL),
(13416, 'Flat Cable iPad mini microphone', 'flat-cable-ipad-mini-microphone', 699, '<p>\r\n	Шлейф с микрофоном для iPad MINI</p>\r\n', 'product.jpg', 4.8, NULL, NULL, NULL),
(7225, 'Housing iPhone 2G', 'housing-iphone-2g', 700, 'USED!!!black .silver ', 'product.jpg', 24, NULL, NULL, NULL),
(7424, 'Sim card holder iPhone 2G', 'sim-card-holder-iphone-2g', 700, 'silver', 'product.jpg', 5, NULL, NULL, NULL),
(7425, 'Flat cable iPhone 2G for light sensor and speaker ', 'flat-cable-iphone-2g-for-light-sensor-and-speaker', 700, 'with components', 'product.jpg', 2.8, NULL, NULL, NULL),
(7426, 'Charger flat cable iPhone 2G', 'charger-flat-cable-iphone-2g', 700, 'Шлейф с разъемом заряда на iPhone 2G', 'product.jpg', 6.5, NULL, NULL, NULL),
(7427, 'Housing cover iPhone 2G (крышка акб) ', 'housing-cover-iphone-2g-kryshka-akb', 700, 'black, green, blue, red, pink, 8G, 16G', 'product.jpg', 21, NULL, NULL, NULL),
(7428, 'Flat cable iPhone 2G with vibro ', 'flat-cable-iphone-2g-with-vibro', 700, ' handsfree connector and on/off button', 'product.jpg', 9.2, NULL, NULL, NULL),
(7597, 'Len iPhone 2G', 'len-iphone-2g', 700, '', 'product.jpg', 7, NULL, NULL, NULL),
(7806, 'Buzzer iPhone 2G ', 'buzzer-iphone-2g', 700, 'Полифонический динамик на iPhone 2G', 'product.jpg', 2.2, NULL, NULL, NULL),
(8144, 'Аккумулятор iPhone 2G', 'akkumulyator-iphone-2g', 700, '', 'product.jpg', 8.3, NULL, NULL, NULL),
(8197, 'Выталкиватель сим карты iPhone', 'vytalkivatel-sim-karty-iphone', 700, '', 'product.jpg', 0.6, NULL, NULL, NULL),
(8215, 'Винтики iPhone 2G', 'vintiki-iphone-2g', 700, '', 'product.jpg', 0.1, NULL, NULL, NULL),
(8238, 'Charger connector iPhone 2G', 'charger-connector-iphone-2g', 700, 'Разъём заряда (системный разъём) на iPhone 2G', 'product.jpg', 0.9, NULL, NULL, NULL),
(8311, 'Sim card holder inside iPhone 2G', 'sim-card-holder-inside-iphone-2g', 700, '', 'product.jpg', 3.9, NULL, NULL, NULL),
(8509, 'Camera iPhone 2G', 'camera-iphone-2g', 700, 'Камера на iPhone 2G', 'product.jpg', 5.5, NULL, NULL, NULL),
(9182, 'Металлическая основа под LCD iPhone 2G', 'metallicheskaya-osnova-pod-lcd-iphone-2g', 700, '', 'product.jpg', 9, NULL, NULL, NULL),
(9183, 'Скотч под LCD iPhone 2G', 'skotch-pod-lcd-iphone-2g', 700, '', 'product.jpg', 0.9, NULL, NULL, NULL),
(9356, 'Antenna block iPhone ', 'antenna-block-iphone', 700, 'Антенна на iPhone', 'product.jpg', 5, NULL, NULL, NULL),
(9609, 'Mic iPhone 2G', 'mic-iphone-2g', 700, '', 'product.jpg', 1.5, NULL, NULL, NULL),
(7581, 'Len iPhone 3G ', 'len-iphone-3g', 701, 'стекло', 'product.jpg', 9, NULL, NULL, NULL),
(7649, 'Housing cover iPhone 3G high copy (black)', 'housing-cover-iphone-3g-high-copy-black', 701, 'задняя крышка', 'product.jpg', 36, NULL, NULL, NULL),
(7725, 'Sim card holder outside (tray) iPhone 3G/3GS (black)', 'sim-card-holder-outside-tray-iphone-3g-3gs-black', 701, '', 'product.jpg', 2.5, NULL, NULL, NULL),
(7867, 'Charger flat cable iPhone 3G ', 'charger-flat-cable-iphone-3g', 701, 'Шлейф с разъемом зарядки', 'product.jpg', 4.5, NULL, NULL, NULL),
(7868, 'Antenna+buzzer iPhone 3G ', 'antenna-buzzer-iphone-3g', 701, 'with data connector', 'product.jpg', 6.5, NULL, NULL, NULL),
(7925, 'Button Home  iPhone 3G/3GS white', 'button-home-iphone-3g-3gs-white', 701, '<p>\r\n	центральная кнопка</p>\r\n', 'product.jpg', 1.8, NULL, NULL, NULL),
(8145, 'Аккумулятор iPhone 3G', 'akkumulyator-iphone-3g', 701, '', 'product.jpg', 7.6, NULL, NULL, NULL),
(8174, 'Touchscreen+Len iPhone 3G (black)', 'touchscreen-len-iphone-3g-black', 701, '', 'product.jpg', 11, NULL, NULL, NULL),
(8216, 'Screws iPhone 3G small', 'screws-iphone-3g-small', 701, 'винтики', 'product.jpg', 0.1, NULL, NULL, NULL),
(8307, 'Charger flat cable iPhone 3GS', 'charger-flat-cable-iphone-3gs', 701, 'Шлейф с разъемом зарядки', 'product.jpg', 5.5, NULL, NULL, NULL),
(8308, 'Charger connector iPhone 3G/3GS', 'charger-connector-iphone-3g-3gs', 701, 'разъём заряда', 'product.jpg', 0.95, NULL, NULL, NULL),
(8310, 'Sim card holder inside iPhone 3G', 'sim-card-holder-inside-iphone-3g', 701, 'внутренний держатель сим карты', 'product.jpg', 4.65, NULL, NULL, NULL),
(8338, 'Housing iPhone 3GS (black)', 'housing-iphone-3gs-black', 701, 'задняя крышка', 'product.jpg', 19.5, NULL, NULL, NULL),
(8390, 'Sim card contact iPhone 2G/3G/3GS', 'sim-card-contact-iphone-2g-3g-3gs', 701, 'контакты для сим карты', 'product.jpg', 1.2, NULL, NULL, NULL),
(8391, 'On/off vibro mode iPhone 3G/3GS (black)', 'on-off-vibro-mode-iphone-3g-3gs-black', 701, '<p>\r\n	кнопка вкл/выкл беззвучного режима</p>\r\n', 'product.jpg', 1, NULL, NULL, NULL),
(8392, 'Внутренний выталкиватель сим карты iPhone 3G/3GS', 'vnutrenniy-vytalkivatel-sim-karty-iphone-3g-3gs', 701, '', 'product.jpg', 1, NULL, NULL, NULL),
(8508, 'Sim card holder inside iPhone 3GS', 'sim-card-holder-inside-iphone-3gs', 701, 'внутренний держатель сим карты', 'product.jpg', 4.7, NULL, NULL, NULL),
(8640, 'Touchscreen+Len iPhone 3GS (black)', 'touchscreen-len-iphone-3gs-black', 701, '', 'product.jpg', 11.8, NULL, NULL, NULL),
(8643, 'Flat cable on/off iPhone 3GS/3G + HF (black)', 'flat-cable-on-off-iphone-3gs-3g-hf-black', 701, '<p>\r\n	шлейф с разъёмам наушников</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(8841, 'Button outside volume iPhone 3G/3GS', 'button-outside-volume-iphone-3g-3gs', 701, 'кнопка регулировки громкости звука iPhone 3G/3GS', 'product.jpg', 2, NULL, NULL, NULL),
(9027, 'Camera iPhone 3G', 'camera-iphone-3g', 701, 'камера', 'product.jpg', 9, NULL, NULL, NULL),
(9077, 'Housing iPhone 3G (black)', 'housing-iphone-3g-black', 701, '', 'product.jpg', 21, NULL, NULL, NULL),
(9081, 'Flat button inside Home iPhone 3G/3GS', 'flat-button-inside-home-iphone-3g-3gs', 701, 'внутренняя центральная кнопка со шлейфом', 'product.jpg', 2, NULL, NULL, NULL),
(9082, 'Frame mounting LCD iPhone 3G/3GS (black)', 'frame-mounting-lcd-iphone-3g-3gs-black', 701, 'Пластиковая рамка крепления дисплея и сенсорного стекла на iPhone 3G/3GS', 'product.jpg', 8.5, NULL, NULL, NULL),
(9083, 'Металлическая основа под LCD iPhone 3G/3GS', 'metallicheskaya-osnova-pod-lcd-iphone-3g-3gs', 701, '', 'product.jpg', 6, NULL, NULL, NULL),
(9085, 'Microphone iPhone 3G/3GS with flat cable', 'microphone-iphone-3g-3gs-with-flat-cable', 701, 'Микрофон на iPhone 3G/3GS в комплекте со шлейфом и резиновым колпачком', 'product.jpg', 2, NULL, NULL, NULL),
(9177, 'Аккумулятор iPhone 3GS ', 'akkumulyator-iphone-3gs', 701, '', 'product.jpg', 7.8, NULL, NULL, NULL),
(9180, 'Button on/off outside iPhone 3G/3GS', 'button-on-off-outside-iphone-3g-3gs', 701, 'накладка на кнопку включения и выключения iPhone 3G/3GS', 'product.jpg', 1.35, NULL, NULL, NULL),
(9346, 'Flat cable iPhone 3G/3GS for light sensor ', 'flat-cable-iphone-3g-3gs-for-light-sensor', 701, '', 'product.jpg', 5.2, NULL, NULL, NULL),
(9355, 'Buzzer iPhone 3G/3GS', 'buzzer-iphone-3g-3gs', 701, 'with antenna cover', 'product.jpg', 3.5, NULL, NULL, NULL),
(9517, 'Housing iPhone 3G Full (black)', 'housing-iphone-3g-full-black', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'product.jpg', 42, NULL, NULL, NULL),
(9583, 'Housing iPhone 3GS Full (black)', 'housing-iphone-3gs-full-black', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'product.jpg', 45, NULL, NULL, NULL),
(9771, 'Screws iPhone 3G big', 'screws-iphone-3g-big', 701, 'винтики', 'product.jpg', 0.1, NULL, NULL, NULL),
(10008, 'Vibro iPhone 3G/3GS', 'vibro-iphone-3g-3gs', 701, 'вибромотор', 'product.jpg', 2.6, NULL, NULL, NULL),
(10474, 'Sticker for fixing the Touchscreen iPhone 3G/3GS', 'sticker-for-fixing-the-touchscreen-iphone-3g-3gs', 701, 'Двухсторонняя клеящая лента для  iPhone 3G/3GS.', 'product.jpg', 1.5, NULL, NULL, NULL),
(10499, 'Antenna Cable iPhone 3G', 'antenna-cable-iphone-3g', 701, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(10500, 'Antenna Cable iPhone 3GS ', 'antenna-cable-iphone-3gs', 701, '', 'product.jpg', 4.8, NULL, NULL, NULL),
(10560, 'Camera iPhone 3GS', 'camera-iphone-3gs', 701, 'камера', 'product.jpg', 6.6, NULL, NULL, NULL),
(10561, 'Antenna+buzzer iPhone 3GS', 'antenna-buzzer-iphone-3gs', 701, 'with data connector', 'product.jpg', 7.6, NULL, NULL, NULL),
(11059, 'Sim card holder outside (tray) iPhone 3G/3GS (white)', 'sim-card-holder-outside-tray-iphone-3g-3gs-white', 701, '', 'product.jpg', 2.5, NULL, NULL, NULL),
(11245, 'Flat cable on/off iPhone 3GS/3G + HF (white)', 'flat-cable-on-off-iphone-3gs-3g-hf-white', 701, '<p>\r\n	шлейф с разъёмам наушников</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(11258, 'Housing iPhone 3G Full (white)', 'housing-iphone-3g-full-white', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'product.jpg', 42, NULL, NULL, NULL),
(11259, 'Housing iPhone 3GS Full (white)', 'housing-iphone-3gs-full-white', 701, '<p>\r\n	Housing+vibro+charge flat cable+flat cable on/off</p>\r\n', 'product.jpg', 45, NULL, NULL, NULL),
(11261, 'Housing iPhone 3G (white)', 'housing-iphone-3g-white', 701, '', 'product.jpg', 21, NULL, NULL, NULL),
(11262, 'Housing iPhone 3GS (white)', 'housing-iphone-3gs-white', 701, '<p>\r\n	задняя крышка</p>\r\n', 'product.jpg', 19.5, NULL, NULL, NULL),
(11540, 'Touchscreen+Len iPhone 3G (white)', 'touchscreen-len-iphone-3g-white', 701, '', 'product.jpg', 11, NULL, NULL, NULL),
(11970, 'On/off vibro mode iPhone 3G/3GS (white)', 'on-off-vibro-mode-iphone-3g-3gs-white', 701, 'кнопка вкл/выкл беззвучного режима', 'product.jpg', 1, NULL, NULL, NULL),
(12032, 'Touchscreen+Len iPhone 3GS (white)', 'touchscreen-len-iphone-3gs-white', 701, '', 'product.jpg', 12, NULL, NULL, NULL),
(12140, 'Wi-Fi Antenna Cable iPhone 3G/3GS', 'wi-fi-antenna-cable-iphone-3g-3gs', 701, '', 'product.jpg', 3.2, NULL, NULL, NULL),
(12180, 'LCD iPhone 3G ', 'lcd-iphone-3g', 701, 'дисплей', 'product.jpg', 24, NULL, NULL, NULL),
(12181, 'LCD iPhone 3GS', 'lcd-iphone-3gs', 701, '<p>\r\n	дисплей</p>\r\n', 'product.jpg', 19, NULL, NULL, NULL),
(13105, 'Button Home  iPhone 3G/3GS black', 'button-home-iphone-3g-3gs-black', 701, '<p>\r\n	центральная кнопка</p>\r\n', 'product.jpg', 1.8, NULL, NULL, NULL),
(9384, 'Speaker iPhone 4', 'speaker-iphone-4', 702, 'динамик', 'product.jpg', 2.2, NULL, NULL, NULL),
(9469, 'LCD+Touchscreen iPhone 4 (black)', 'lcd-touchscreen-iphone-4-black', 702, '', 'product.jpg', 33, NULL, NULL, NULL),
(9470, 'LCD+Touchscreen iPhone 4 (white)', 'lcd-touchscreen-iphone-4-white', 702, '', 'product.jpg', 35, NULL, NULL, NULL),
(9471, 'Middle part iPhone 4', 'middle-part-iphone-4', 702, 'Средняя часть корпуса', 'product.jpg', 19, NULL, NULL, NULL),
(9472, 'Back cover iPhone 4 (white)', 'back-cover-iphone-4-white', 702, 'Задняя крышка корпуса белого цвета на iPhone 4', 'product.jpg', 11.8, NULL, NULL, NULL),
(9474, 'Sim-card holder outside iPhone 4', 'sim-card-holder-outside-iphone-4', 702, '', 'product.jpg', 3.9, NULL, NULL, NULL),
(9510, 'Microphone iPhone 4', 'microphone-iphone-4', 702, '', 'product.jpg', 1.4, NULL, NULL, NULL),
(9511, 'Buzzer Ringer for iPhone 4/4S', 'buzzer-ringer-for-iphone-4-4s', 702, 'полифонический динамик', 'product.jpg', 3.2, NULL, NULL, NULL),
(9514, 'Аккумулятор iPhone 4G', 'akkumulyator-iphone-4g', 702, '', 'product.jpg', 13.2, NULL, NULL, NULL),
(9515, 'Home button outside iPhone 4 high copy (black)', 'home-button-outside-iphone-4-high-copy-black', 702, 'центральная кнопка', 'product.jpg', 3.95, NULL, NULL, NULL),
(9519, 'Charger flat cable iPhone 4 black connector', 'charger-flat-cable-iphone-4-black-connector', 702, 'Шлейф с разъёмом зарядки (чёрный) c компонентами и микрофоном на iPhone 4', 'product.jpg', 9.5, NULL, NULL, NULL),
(9562, 'Touchscreen+Len iPhone 4 (white)', 'touchscreen-len-iphone-4-white', 702, '', 'product.jpg', 18, NULL, NULL, NULL),
(9563, 'Touchscreen+Len iPhone 4 (black)', 'touchscreen-len-iphone-4-black', 702, '', 'product.jpg', 18, NULL, NULL, NULL),
(9564, 'LCD iPhone 4 only lcd', 'lcd-iphone-4-only-lcd', 702, '', 'product.jpg', 33, NULL, NULL, NULL),
(9630, 'Flat Cable iPhone 4 for light proximity sensor & power key', 'flat-cable-iphone-4-for-light-proximity-sensor-power-key', 702, 'Шлейф с датчиком приближения уха к динамику и мембраной кнопки вкл/выкл на iPhone 4', 'product.jpg', 9, NULL, NULL, NULL),
(9637, 'Home button outside  iPhone 4 (black)', 'home-button-outside-iphone-4-black', 702, 'центральная кнопка ', 'product.jpg', 2.2, NULL, NULL, NULL),
(9638, 'Home button outside iPhone 4 (white) ', 'home-button-outside-iphone-4-white', 702, 'центральная кнопка ', 'product.jpg', 2.2, NULL, NULL, NULL),
(9774, 'Flat Cable iPhone 4 with hands-free connector (black) + volume switch', 'flat-cable-iphone-4-with-hands-free-connector-black-volume-switch', 702, 'Шлейф с разъёмом гарнитуры (чёрный) и мембранами кнопок управления звуком на iPhone 4', 'product.jpg', 7, NULL, NULL, NULL),
(9781, 'LCD+Touchscreen iPhone 4 high copy (black) ', 'lcd-touchscreen-iphone-4-high-copy-black', 702, '', 'product.jpg', 64, NULL, NULL, NULL),
(10009, 'Camera back iPhone 4 ', 'camera-back-iphone-4', 702, 'задняя', 'product.jpg', 11, NULL, NULL, NULL),
(10094, 'Turbo-SIM for iPhone 4', 'turbo-sim-for-iphone-4', 702, '', 'product.jpg', 6.5, NULL, NULL, NULL),
(10112, 'Vibro module iPhone 4', 'vibro-module-iphone-4', 702, 'вибро звонок', 'product.jpg', 2.6, NULL, NULL, NULL),
(10113, 'LCD+Touchscreen iPhone 4 high copy (white) ', 'lcd-touchscreen-iphone-4-high-copy-white', 702, '', 'product.jpg', 64, NULL, NULL, NULL),
(10114, 'Back cover iPhone 4 high copy (white) ', 'back-cover-iphone-4-high-copy-white', 702, 'Задняя крышка корпуса белого цвета на iPhone 4', 'product.jpg', 27, NULL, NULL, NULL),
(10130, 'Набор винтов для iPhone 4', 'nabor-vintov-dlya-iphone-4', 702, '<p>\r\n	комплект</p>\r\n', 'product.jpg', 4.7, NULL, NULL, NULL),
(10285, 'Back cover iPhone 4 high copy (black) ', 'back-cover-iphone-4-high-copy-black', 702, 'Задняя крышка корпуса чёрного цвета на iPhone 4', 'product.jpg', 27, NULL, NULL, NULL),
(10326, 'Flat Cable on/off inside Home iPhone 4', 'flat-cable-on-off-inside-home-iphone-4', 702, '', 'product.jpg', 3.4, NULL, NULL, NULL),
(10331, 'Back cover iPhone 4 (black) ', 'back-cover-iphone-4-black', 702, 'Задняя крышка корпуса чёрного цвета на iPhone 4', 'product.jpg', 11.8, NULL, NULL, NULL),
(10488, 'Charger flat cable iPhone 4 white connector', 'charger-flat-cable-iphone-4-white-connector', 702, 'Шлейф с разъёмом зарядки (белый) c компонентами и микрофоном на iPhone 4', 'product.jpg', 10, NULL, NULL, NULL),
(10493, 'Waterproof sticker iPhone 4', 'waterproof-sticker-iphone-4', 702, 'индикатор влаги ', 'product.jpg', 0.3, NULL, NULL, NULL),
(10495, 'Connector on board for Back camera iPhone 4', 'connector-on-board-for-back-camera-iphone-4', 702, '', 'product.jpg', 6.5, NULL, NULL, NULL),
(10497, 'Connector on board for Sensor flat iPhone 4', 'connector-on-board-for-sensor-flat-iphone-4', 702, '', 'product.jpg', 6, NULL, NULL, NULL),
(10498, 'Connector on board for Audio iPhone 4', 'connector-on-board-for-audio-iphone-4', 702, '', 'product.jpg', 5.9, NULL, NULL, NULL),
(10558, 'LCD+Touchscreen iPhone 4+Housing cover (Purple)', 'lcd-touchscreen-iphone-4-housing-cover-purple', 702, '', 'product.jpg', 45, NULL, NULL, NULL),
(10559, 'LCD+Touchscreen iPhone 4+Housing cover (Gold)', 'lcd-touchscreen-iphone-4-housing-cover-gold', 702, '', 'product.jpg', 45, NULL, NULL, NULL),
(10562, 'Camera front iPhone 4 ', 'camera-front-iphone-4', 702, 'передняя', 'product.jpg', 7.9, NULL, NULL, NULL),
(10567, 'Antenna iPhone 4 with WiFi ', 'antenna-iphone-4-with-wifi', 702, 'антенна', 'product.jpg', 4.2, NULL, NULL, NULL),
(10642, 'Sim-card holder inside iPhone 4', 'sim-card-holder-inside-iphone-4', 702, 'держатель сим карты на iPhone 4', 'product.jpg', 3.4, NULL, NULL, NULL),
(10643, 'Button set iPhone 4 (volume+power+mute)', 'button-set-iphone-4-volume-power-mute', 702, 'Набор кнопок (3шт.) . В комплект входит: кнопка вкл/выкл телефона, кнопка регулировки громкости, кнопка беззвучного режима и держатель SIM карты.', 'product.jpg', 4.9, NULL, NULL, NULL),
(10644, 'товар крутой', 'tovar-krutoy-10644', 702, '<p>разъём аккумулятора</p>\r\n', 'product.jpg', 2.9, NULL, NULL, NULL),
(10645, 'Внутренний выталкиватель iPhone 4', 'vnutrenniy-vytalkivatel-iphone-4', 702, '', 'product.jpg', 2.2, NULL, NULL, NULL),
(10646, 'Connector on board for Front camera iPhone 4', 'connector-on-board-for-front-camera-iphone-4', 702, '', 'product.jpg', 6.5, NULL, NULL, NULL),
(10647, 'Connector on board for Touchscreen iPhone 4', 'connector-on-board-for-touchscreen-iphone-4', 702, '', 'product.jpg', 5.2, NULL, NULL, NULL),
(10648, 'Защитная сетка для Speaker iPhone 4', 'zaschitnaya-setka-dlya-speaker-iphone-4', 702, '', 'product.jpg', 1.1, NULL, NULL, NULL),
(11060, 'Flat Cable iPhone 4 with hands-free connector (white) + volume switch', 'flat-cable-iphone-4-with-hands-free-connector-white-volume-switch', 702, 'Шлейф с разъёмом гарнитуры (белый) и мембранами кнопок управления звуком на iPhone 4', 'product.jpg', 7, NULL, NULL, NULL),
(11524, 'Защитная сетка для Buzzer iPhone 4', 'zaschitnaya-setka-dlya-buzzer-iphone-4', 702, '', 'product.jpg', 1, NULL, NULL, NULL),
(11529, 'Скотч для Touchscreen iPhone 4', 'skotch-dlya-touchscreen-iphone-4', 702, '', 'product.jpg', 1.2, NULL, NULL, NULL),
(11627, 'Frame Housing cover iPhone 4 Black', 'frame-housing-cover-iphone-4-black', 702, '<p>\r\n	Рамка задней крышки корпуса на iPhone 4 чёрного цвета</p>\r\n', 'product.jpg', 10, NULL, NULL, NULL),
(11628, 'Frame Housing cover iPhone 4 White', 'frame-housing-cover-iphone-4-white', 702, '<p>\r\n	Рамка задней крышки корпуса на iPhone 4 белого цвета</p>\r\n', 'product.jpg', 10, NULL, NULL, NULL),
(10487, 'Аккумулятор iPhone 4S', 'akkumulyator-iphone-4s', 703, '', 'product.jpg', 18.7, NULL, NULL, NULL),
(10489, 'Flat Cable iPhone 4S(black) with hands-free connector', 'flat-cable-iphone-4s-black-with-hands-free-connector', 703, 'шлейф с разьёмом для наушников ', 'product.jpg', 14, NULL, NULL, NULL),
(10490, 'Flat Cable iPhone 4S(white) with hands-free connector', 'flat-cable-iphone-4s-white-with-hands-free-connector', 703, 'шлейф с разьёмом для наушников ', 'product.jpg', 14, NULL, NULL, NULL),
(10491, 'Charger flat cable iPhone 4S (black) connector', 'charger-flat-cable-iphone-4s-black-connector', 703, 'Шлейф с разъемом зарядки чёрный', 'product.jpg', 14, NULL, NULL, NULL),
(10492, 'Charger flat cable iPhone 4S (white) connector', 'charger-flat-cable-iphone-4s-white-connector', 703, 'Шлейф с разъемом зарядки белый', 'product.jpg', 14, NULL, NULL, NULL),
(10494, 'LCD connector iPhone 4S', 'lcd-connector-iphone-4s', 703, '', 'product.jpg', 5.5, NULL, NULL, NULL),
(10568, 'Flat Cable on/off inside Home iPhone 4S ', 'flat-cable-on-off-inside-home-iphone-4s', 703, '', 'product.jpg', 5.5, NULL, NULL, NULL),
(10569, 'LCD iPhone 4S + Touchscreen (black)', 'lcd-iphone-4s-touchscreen-black', 703, '', 'product.jpg', 42, NULL, NULL, NULL),
(10570, 'LCD iPhone 4S + Touchscreen (white)', 'lcd-iphone-4s-touchscreen-white', 703, '', 'product.jpg', 43, NULL, NULL, NULL),
(10571, 'LCD iPhone 4S + Touchscreen (black) high copy', 'lcd-iphone-4s-touchscreen-black-high-copy', 703, '', 'product.jpg', 67, NULL, NULL, NULL),
(10572, 'LCD iPhone 4S + Touchscreen (white) high copy', 'lcd-iphone-4s-touchscreen-white-high-copy', 703, '', 'product.jpg', 67, NULL, NULL, NULL),
(10573, 'Flat Cable iPhone 4S with proximity sensor', 'flat-cable-iphone-4s-with-proximity-sensor', 703, 'шлейф с кнопкой вкл.', 'product.jpg', 14, NULL, NULL, NULL),
(10575, 'Camera front  iPhone 4S', 'camera-front-iphone-4s', 703, 'передняя', 'product.jpg', 13.5, NULL, NULL, NULL),
(10636, 'Back cover iPhone 4S (black) ', 'back-cover-iphone-4s-black', 703, '<p>\r\n	задняя крышка</p>\r\n', 'product.jpg', 17.5, NULL, NULL, NULL),
(10637, 'Back cover iPhone 4S (white) ', 'back-cover-iphone-4s-white', 703, '<p>\r\n	задняя крышка</p>\r\n', 'product.jpg', 17.5, NULL, NULL, NULL),
(11623, 'Back cover iPhone 4S high copy (black) ', 'back-cover-iphone-4s-high-copy-black', 703, '<p>\r\n	задняя крышка</p>\r\n', 'product.jpg', 29, NULL, NULL, NULL),
(11624, 'Middle part iPhone 4S (silver)', 'middle-part-iphone-4s-silver', 703, '', 'product.jpg', 49, NULL, NULL, NULL),
(11625, 'Frame Housing cover iPhone 4S (black)', 'frame-housing-cover-iphone-4s-black', 703, '', 'product.jpg', 10.5, NULL, NULL, NULL),
(11626, 'Frame Housing cover iPhone 4S (white)', 'frame-housing-cover-iphone-4s-white', 703, '', 'product.jpg', 10, NULL, NULL, NULL),
(11998, 'Turbo-SIM for iPhone 4S (5.0/ 5.1/ 5.01)', 'turbo-sim-for-iphone-4s-5-0-5-1-5-01', 703, '', 'product.jpg', 20, NULL, NULL, NULL),
(12031, 'Camera back iPhone 4S 8MP', 'camera-back-iphone-4s-8mp', 703, '<p>\r\n	задняя</p>\r\n', 'product.jpg', 26, NULL, NULL, NULL),
(12033, 'Back cover iPhone 4S high copy (white) ', 'back-cover-iphone-4s-high-copy-white', 703, '<p>\r\n	задняя крышка</p>\r\n', 'product.jpg', 29, NULL, NULL, NULL),
(12151, 'Home button outside for iPhone 4S (black)', 'home-button-outside-for-iphone-4s-black', 703, '', 'product.jpg', 2.5, NULL, NULL, NULL),
(12152, 'Home button outside for iPhone 4S (white)', 'home-button-outside-for-iphone-4s-white', 703, '', 'product.jpg', 2.5, NULL, NULL, NULL),
(12153, 'Vibro module iPhone 4S', 'vibro-module-iphone-4s', 703, '', 'product.jpg', 4.5, NULL, NULL, NULL),
(12869, 'Аккумулятор iPhone 4S original', 'akkumulyator-iphone-4s-original', 703, '', 'product.jpg', 25, NULL, NULL, NULL),
(12666, 'Charger flat cable iPhone 5 (black) connector with HF ', 'charger-flat-cable-iphone-5-black-connector-with-hf', 704, 'Шлейф на iPhone 5 с разъёмом зарядки и разъёмом наушников', 'product.jpg', 7.8, NULL, NULL, NULL),
(12667, 'Charger flat cable iPhone 5 (white) connector with HF', 'charger-flat-cable-iphone-5-white-connector-with-hf', 704, 'Шлейф на iPhone 5  с разъёмом зарядки и разъёмом наушников', 'product.jpg', 8, NULL, NULL, NULL),
(12668, 'Buzzer Ringer for iPhone 5', 'buzzer-ringer-for-iphone-5', 704, 'Полифонический динамик на iPhone 5', 'product.jpg', 3.4, NULL, NULL, NULL),
(12669, 'Vibro module iPhone 5', 'vibro-module-iphone-5', 704, 'Вибро звонок для iPhone 5', 'product.jpg', 2, NULL, NULL, NULL),
(12670, 'Flat Cable on/off inside iPhone 5', 'flat-cable-on-off-inside-iphone-5', 704, 'Шлейф на iPhone 5 с кнопкой включения, кнопками регулировки громкости и беззвучного режима', 'product.jpg', 4.6, NULL, NULL, NULL),
(12671, 'Sim-card holder outside iPhone 5 (black)', 'sim-card-holder-outside-iphone-5-black', 704, 'Держатель нано сим карты для iPhone 5, чёрный', 'product.jpg', 2, NULL, NULL, NULL),
(12672, 'Sim-card holder outside iPhone 5 (white)', 'sim-card-holder-outside-iphone-5-white', 704, 'Держатель нано сим карты для iPhone 5, белый', 'product.jpg', 2, NULL, NULL, NULL),
(12673, 'Flat Cable iPhone 5 for light and proximity sensor with front camera', 'flat-cable-iphone-5-for-light-and-proximity-sensor-with-front-camera', 704, 'Шлейф на iPhone 5 с передней камерой и датчиками приближения и освещённости', 'product.jpg', 14, NULL, NULL, NULL),
(12674, 'Speaker iPhone 5', 'speaker-iphone-5', 704, 'Динамик разговорный для iPhone 5', 'product.jpg', 2.5, NULL, NULL, NULL),
(12675, 'Home button outside for iPhone 5 (black)', 'home-button-outside-for-iphone-5-black', 704, 'Кнопка home внешняя для iPhone 5 чёрного цвета', 'product.jpg', 2.5, NULL, NULL, NULL),
(12676, 'Home button outside for iPhone 5 (white)', 'home-button-outside-for-iphone-5-white', 704, 'Кнопка home внешняя для iPhone 5 белого цвета', 'product.jpg', 2.5, NULL, NULL, NULL),
(12677, 'Flat Cable Home inside iPhone 5', 'flat-cable-home-inside-iphone-5', 704, 'Шлейф с мембраной кнопки возврата в главное меню на iPhone 5', 'product.jpg', 3, NULL, NULL, NULL),
(12678, 'Battery connector iPhone 5', 'battery-connector-iphone-5', 704, 'Разъём аккумулятора на iPhone 5', 'product.jpg', 2.2, NULL, NULL, NULL),
(12679, 'Flat Cable Wi-Fi iPhone 5', 'flat-cable-wi-fi-iphone-5', 704, 'Шлейф Wi-Fi iPhone 5', 'product.jpg', 4.7, NULL, NULL, NULL),
(12680, 'Housing iPhone 5 (black)', 'housing-iphone-5-black', 704, 'Корпус на iPhone 5 чёрный', 'product.jpg', 155, NULL, NULL, NULL),
(12681, 'Housing iPhone 5 (white)', 'housing-iphone-5-white', 704, 'Корпус на iPhone 5 белый', 'product.jpg', 150, NULL, NULL, NULL),
(12682, 'Replacement Home Button Bracket for iPhone 5', 'replacement-home-button-bracket-for-iphone-5', 704, '<p>\r\n	Металлическая основа для шлейфа с кнопкой Home</p>\r\n', 'product.jpg', 4.9, NULL, NULL, NULL),
(12683, 'Rubber pad Home button outside for iPhone 5 (black)', 'rubber-pad-home-button-outside-for-iphone-5-black', 704, 'Резиновая прокладка под накладку на кнопку Home', 'product.jpg', 4, NULL, NULL, NULL),
(12911, 'LCD iPhone 5 + Touchscreen (black)', 'lcd-iphone-5-touchscreen-black', 704, 'Дисплей на iPhone 5 с сенсорным стеклом, чёрный', 'product.jpg', 175, NULL, NULL, NULL),
(12912, 'LCD iPhone 5 + Touchscreen (white)', 'lcd-iphone-5-touchscreen-white', 704, 'Дисплей на iPhone 5 с сенсорным стеклом, белый', 'product.jpg', 175, NULL, NULL, NULL),
(12929, 'Набор винтов для iPhone 5', 'nabor-vintov-dlya-iphone-5', 704, '', 'product.jpg', 3.8, NULL, NULL, NULL),
(13038, 'LCD iPhone 5 + Touchscreen full (black)+camera+Home key', 'lcd-iphone-5-touchscreen-full-black-camera-home-key', 704, '<p>\r\n	Дисплей на iPhone 5 с сенсорным стеклом, камерой и центральной кнопкой Home, чёрный</p>\r\n', 'product.jpg', 190, NULL, NULL, NULL),
(13039, 'LCD iPhone 5 + Touchscreen full (white)+camera+Home key', 'lcd-iphone-5-touchscreen-full-white-camera-home-key', 704, '<p>\r\n	Дисплей на iPhone 5 с сенсорным стеклом, камерой и центральной кнопкой Home, белый</p>\r\n', 'product.jpg', 190, NULL, NULL, NULL),
(13093, 'Аккумулятор iPhone 5', 'akkumulyator-iphone-5', 704, '', 'product.jpg', 19, NULL, NULL, NULL),
(13398, 'Housing iPhone 5 (white) copy', 'housing-iphone-5-white-copy', 704, '<p>\r\n	Корпус на iPhone 5 белый улучшенная копия</p>\r\n', 'product.jpg', 110, NULL, NULL, NULL),
(13399, 'Housing iPhone 5 (black) copy', 'housing-iphone-5-black-copy', 704, '<p>\r\n	Корпус на iPhone 5 чёрный улучшенная копия</p>\r\n', 'product.jpg', 110, NULL, NULL, NULL),
(13400, 'Housing iPhone 5 (pink) copy', 'housing-iphone-5-pink-copy', 704, '<p>\r\n	Корпус на iPhone 5 розовый улучшенная копия</p>\r\n', 'product.jpg', 110, NULL, NULL, NULL),
(13401, 'Housing iPhone 5 (gold) copy', 'housing-iphone-5-gold-copy', 704, '<p>\r\n	Корпус на iPhone 5 золотистый улучшенная копия</p>\r\n', 'product.jpg', 110, NULL, NULL, NULL),
(9383, 'Power IC iPhone 3GS 338S0768-AE БЕЗ ГАРАНТИИ!!!', 'power-ic-iphone-3gs-338s0768-ae-bez-garantii', 705, 'Микросхема управления питанием ', 'product.jpg', 45, NULL, NULL, NULL),
(9775, 'Power IC iPhone 3G БЕЗ ГАРАНТИИ !!!', 'power-ic-iphone-3g-bez-garantii', 705, 'Микросхема управления питанием ', 'product.jpg', 24, NULL, NULL, NULL),
(9776, 'Power IC iPhone 4 338S-0822- A3 БЕЗ ГАРАНТИИ !!!', 'power-ic-iphone-4-338s-0822--a3-bez-garantii', 705, '09428HCF', 'product.jpg', 45, NULL, NULL, NULL),
(9969, 'Charger IC iPhone 3G 40882/N0470/LTBH', 'charger-ic-iphone-3g-40882-n0470-ltbh', 705, 'Микросхема для Iphone 3G (зарядки)', 'product.jpg', 12, NULL, NULL, NULL),
(10290, 'USB Power Manager IC iPhone 3G (DEC 4088 EDE-2)', 'usb-power-manager-ic-iphone-3g-dec-4088-ede-2', 705, '', 'product.jpg', 7.9, NULL, NULL, NULL),
(10294, 'Sound IC iPhone 3GS/4G', 'sound-ic-iphone-3gs-4g', 705, '', 'product.jpg', 16, NULL, NULL, NULL),
(10395, 'Микросхема Wi-Fi iPhone 4 (модуль)', 'mikroshema-wi-fi-iphone-4-modul', 705, '', 'product.jpg', 33, NULL, NULL, NULL),
(10396, 'Micbias IC CD 3282 A1 iPhone 4', 'micbias-ic-cd-3282-a1-iphone-4', 705, 'микросхема звука во время разговора ', 'product.jpg', 27, NULL, NULL, NULL),
(10477, 'PF-SKY 77529-24 iPhone 4', 'pf-sky-77529-24-iphone-4', 705, '4679779', 'product.jpg', 18, NULL, NULL, NULL),
(10478, 'CPU+Flash iPhone 4', 'cpu-flash-iphone-4', 705, 'Флеш память', 'product.jpg', 48, NULL, NULL, NULL),
(10731, 'TSC 2004_WCSP 25', 'tsc-2004_wcsp-25', 705, '', 'product.jpg', 7.5, NULL, NULL, NULL),
(10732, 'SMP 3i 6820', 'smp-3i-6820', 705, '', 'product.jpg', 15, NULL, NULL, NULL),
(11609, 'SKY 77541-32', 'sky-77541-32', 705, '', 'product.jpg', 18, NULL, NULL, NULL),
(12155, 'Power IC iPhone 4S 338S0973-A3  БЕЗ ГАРАНТИИ', 'power-ic-iphone-4s-338s0973-a3-bez-garantii', 705, '<p>\r\n	1209EHHQ</p>\r\n', 'product.jpg', 58, NULL, NULL, NULL),
(13207, 'Audio IC iPhone 5', 'audio-ic-iphone-5', 705, '', 'product.jpg', 25, NULL, NULL, NULL),
(13208, 'IC WiFi iPhone 4S 339S0154', 'ic-wifi-iphone-4s-339s0154', 705, '<p>\r\n	нагрев 200 градусов</p>\r\n', 'product.jpg', 18, NULL, NULL, NULL),
(13210, 'Power IC 343S0542-A2 / iPad 2', 'power-ic-343s0542-a2-ipad-2', 705, '', 'product.jpg', 13.5, NULL, NULL, NULL),
(13404, 'IC WiFi iPhone 4S ', 'ic-wifi-iphone-4s', 705, '<p>\r\n	нагрев 300 градусов</p>\r\n', 'product.jpg', 20, NULL, NULL, NULL),
(13406, 'Power IC iPhone 5 338S1131', 'power-ic-iphone-5-338s1131', 705, '', 'product.jpg', 28, NULL, NULL, NULL),
(13407, 'IC USB/LCD iPhone 5 1608A1', 'ic-usb-lcd-iphone-5-1608a1', 705, '', 'product.jpg', 16, NULL, NULL, NULL),
(8990, 'Screen Guard iPad Crystal Clear', 'screen-guard-ipad-crystal-clear', 840, '', 'product.jpg', 5, NULL, NULL, NULL),
(8991, 'Screen Guard iPad Anti Glare', 'screen-guard-ipad-anti-glare', 840, '(матовая)', 'product.jpg', 8, NULL, NULL, NULL),
(8992, 'Screen Guard iPad Mirror', 'screen-guard-ipad-mirror', 840, '(зеркальная)', 'product.jpg', 7, NULL, NULL, NULL),
(9089, 'Capdase iMAG Screen Guard iPad ', 'capdase-imag-screen-guard-ipad', 840, 'Superb Transparency & Anti-Glare protection', 'product.jpg', 16, NULL, NULL, NULL),
(9818, 'Screen Guard iPad Green  Crystal Clear', 'screen-guard-ipad-green-crystal-clear', 840, '', 'product.jpg', 7, NULL, NULL, NULL),
(10018, 'Screen Guard iPad 2/3/4 Anti Glare', 'screen-guard-ipad-2-3-4-anti-glare', 840, '(матовая)', 'product.jpg', 9, NULL, NULL, NULL),
(10019, 'Screen Guard iPad 2/3/4 Crystal Clear', 'screen-guard-ipad-2-3-4-crystal-clear', 840, '', 'product.jpg', 8.5, NULL, NULL, NULL),
(10427, 'Back Guard iPad 2 Carbon (grey)', 'back-guard-ipad-2-carbon-grey', 840, '<p>\r\n	Карбоновая защитная пленка.</p>\r\n', 'product.jpg', 8.9, NULL, NULL, NULL),
(10555, 'Mallper Screen Protective Film iPad 2 (black)', 'mallper-screen-protective-film-ipad-2-black', 840, '', 'product.jpg', 12.7, NULL, NULL, NULL),
(10866, 'Screen Guard Professional  iPad 2/3 (2 in 1)BULLKin ', 'screen-guard-professional-ipad-2-3-2-in-1-bullkin', 840, 'лицевая и задняя защитные плёнки (белая,серая,чёрная карбон)', 'product.jpg', 9, NULL, NULL, NULL),
(10891, 'Screen Ward iPad 2 Back Side anti-glare', 'screen-ward-ipad-2-back-side-anti-glare', 840, 'anti-ultraviolet/air-bubble-proof', 'product.jpg', 7.5, NULL, NULL, NULL),
(11063, 'Back Guard iPad 2 Carbon (black)', 'back-guard-ipad-2-carbon-black', 840, '<p>\r\n	Карбоновая защитная пленка.</p>\r\n', 'product.jpg', 8.9, NULL, NULL, NULL),
(11064, 'Back Guard iPad 2 Carbon (white)', 'back-guard-ipad-2-carbon-white', 840, '<p>\r\n	Карбоновая защитная пленка.</p>\r\n', 'product.jpg', 8.9, NULL, NULL, NULL),
(11069, 'Mallper Screen Protective Film iPad 2 (white)', 'mallper-screen-protective-film-ipad-2-white', 840, '', 'product.jpg', 12.7, NULL, NULL, NULL),
(11532, 'HOCO Screen Professional for iPad 2/3/4', 'hoco-screen-professional-for-ipad-2-3-4', 840, '', 'product.jpg', 12.4, NULL, NULL, NULL),
(12342, 'Screen Ward iPad 2 Back Side ', 'screen-ward-ipad-2-back-side', 840, '', 'product.jpg', 9, NULL, NULL, NULL),
(12629, 'Screen Guard iPad 2 / New Waterproof', 'screen-guard-ipad-2-new-waterproof', 840, '<p>\r\n	водонепроницаемая</p>\r\n', 'product.jpg', 9.5, NULL, NULL, NULL),
(12803, 'Screen Guard  Professional iPad 2/3 Front BULLKin ', 'screen-guard-professional-ipad-2-3-front-bullkin', 840, '<p>\r\n	лицевая защитная плёнка</p>\r\n', 'product.jpg', 5.7, NULL, NULL, NULL),
(12901, 'ISME Screen Guard iPad mini Anti Glare', 'isme-screen-guard-ipad-mini-anti-glare', 840, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 6.5, NULL, NULL, NULL),
(12902, 'ISME Screen Guard iPad mini Clear', 'isme-screen-guard-ipad-mini-clear', 840, '', 'product.jpg', 6, NULL, NULL, NULL),
(12943, 'Screen Guard iPad mini Anti Glare', 'screen-guard-ipad-mini-anti-glare', 840, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(12944, 'Screen Guard iPad mini Clear', 'screen-guard-ipad-mini-clear', 840, '', 'product.jpg', 5, NULL, NULL, NULL),
(12945, 'Screen Guard  iPad mini Clear BULLKin ', 'screen-guard-ipad-mini-clear-bullkin', 840, '', 'product.jpg', 5.7, NULL, NULL, NULL),
(12946, 'Screen Guard  iPad mini Anti Glare BULLKin ', 'screen-guard-ipad-mini-anti-glare-bullkin', 840, '(матовая)', 'product.jpg', 5.7, NULL, NULL, NULL),
(13119, 'Back Screen Guard iPad mini Clear', 'back-screen-guard-ipad-mini-clear', 840, 'плотная защитная плёнка на заднюю крышку прозрачная', 'product.jpg', 5, NULL, NULL, NULL),
(13314, 'Super Ultra Screen Protector iPad mini Clear', 'super-ultra-screen-protector-ipad-mini-clear', 840, '<p>\r\n	ультратонкая защитная плёнка на айпад мини прозрачная</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(13315, 'Super Ultra Screen Protector iPad mini Anti Glare', 'super-ultra-screen-protector-ipad-mini-anti-glare', 840, '<p>\r\n	ультратонкая защитная плёнка на айпад мини матовая</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(7139, 'Screen Guard iPhone 2G', 'screen-guard-iphone-2g', 841, '', 'product.jpg', 1.7, NULL, NULL, NULL),
(7607, 'Screen Guard iPhone 2G Mirror ', 'screen-guard-iphone-2g-mirror', 841, '(зеркальная)', 'product.jpg', 1, NULL, NULL, NULL),
(7609, 'Screen Guard iPhone 3G/3GS Mirror ', 'screen-guard-iphone-3g-3gs-mirror', 841, '(зеркальная)', 'product.jpg', 2, NULL, NULL, NULL),
(7610, 'Screen Guard iPhone 3G/3GS Anti Glare', 'screen-guard-iphone-3g-3gs-anti-glare', 841, '(матовая)', 'product.jpg', 2, NULL, NULL, NULL),
(7655, 'Screen Guard iPhone 3G/3GS ', 'screen-guard-iphone-3g-3gs', 841, '(глянцевая)', 'product.jpg', 2, NULL, NULL, NULL),
(9028, 'Screen Guard + Skin iPhone 3G/3GS', 'screen-guard-skin-iphone-3g-3gs', 841, '', 'product.jpg', 2.7, NULL, NULL, NULL),
(9148, 'Screen Guard iPhone 4/4S', 'screen-guard-iphone-4-4s', 841, '', 'product.jpg', 1.9, NULL, NULL, NULL),
(9149, 'Screen Guard iPhone 4/4S Anti Glare', 'screen-guard-iphone-4-4s-anti-glare', 841, '(матовая)', 'product.jpg', 2.7, NULL, NULL, NULL),
(9415, 'Skin iPhone 4 Carbon Black', 'skin-iphone-4-carbon-black', 841, '', 'product.jpg', 4, NULL, NULL, NULL),
(9641, 'Mallper Insulation Sticker for iPhone 4G (black/white/red)', 'mallper-insulation-sticker-for-iphone-4g-black-white-red', 841, 'защитная плёнка на боковую часть корпуса iPhone 4G  ', 'product.jpg', 6.7, NULL, NULL, NULL),
(9643, 'Screen Guard iPhone 4/4S Anti Glare Capdase - ARIS Screen Protector', 'screen-guard-iphone-4-4s-anti-glare-capdase---aris-screen-protector', 841, 'Crystal Clear with Anti-Reflection Protection', 'product.jpg', 6.5, NULL, NULL, NULL);
INSERT INTO `products` (`id`, `title`, `alias`, `parent`, `content`, `image`, `price`, `m_title`, `m_desc`, `m_keys`) VALUES
(9644, 'Screen Guard iPhone 4/4S Anti Glare Capdase - iXiMAG Screen Protector', 'screen-guard-iphone-4-4s-anti-glare-capdase---iximag-screen-protector', 841, 'Superb Transparency & Anti-Glare.Finger-Print & Grease Resistant.', 'product.jpg', 6.5, NULL, NULL, NULL),
(9645, 'Screen Guard iPhone 4/4S Mirror Capdase-MIRA Screen Protector', 'screen-guard-iphone-4-4s-mirror-capdase-mira-screen-protector', 841, '2 in1 excellent protection: Crystal Clear & Silver Glass Mirror', 'product.jpg', 10, NULL, NULL, NULL),
(9784, 'Screen Guard iPhone 4/4S Front/Back BULLKin  ', 'screen-guard-iphone-4-4s-front-back-bullkin', 841, '', 'product.jpg', 3.3, NULL, NULL, NULL),
(9785, 'Screen Guard iPhone 4/4S Clear BULLKin  ', 'screen-guard-iphone-4-4s-clear-bullkin', 841, '', 'product.jpg', 2.9, NULL, NULL, NULL),
(9786, 'Mallper Screen Protective Film iPhone 4G ', 'mallper-screen-protective-film-iphone-4g', 841, 'Compatible with capacitive touch screen', 'product.jpg', 6, NULL, NULL, NULL),
(10100, 'Screen Guard iPhone 4/4S Front/Back', 'screen-guard-iphone-4-4s-front-back', 841, '', 'product.jpg', 2.8, NULL, NULL, NULL),
(10101, 'Screen Guard iPhone 4/4S Front/Back Mirror ', 'screen-guard-iphone-4-4s-front-back-mirror', 841, '(зеркальная)', 'product.jpg', 2, NULL, NULL, NULL),
(10102, 'Screen Guard iPhone 4/4S Front/Back Anti Glare ', 'screen-guard-iphone-4-4s-front-back-anti-glare', 841, '(матовая)', 'product.jpg', 2.8, NULL, NULL, NULL),
(10336, 'Screen Guard iPhone 4/4S Mirror', 'screen-guard-iphone-4-4s-mirror', 841, '<p>\r\n	(зеркальная)</p>\r\n', 'product.jpg', 1.6, NULL, NULL, NULL),
(10855, 'Screen Guard iPhone 4/4S Front/Back Diamond', 'screen-guard-iphone-4-4s-front-back-diamond', 841, '', 'product.jpg', 6.5, NULL, NULL, NULL),
(10864, 'Insulation Sticker for iPhone 4G (grey/clear/wtite)', 'insulation-sticker-for-iphone-4g-grey-clear-wtite', 841, 'защитная плёнка на боковую часть корпуса iPhone 4G', 'product.jpg', 5.2, NULL, NULL, NULL),
(12010, 'Skin iPhone 4/4S Wood', 'skin-iphone-4-4s-wood', 841, '', 'product.jpg', 12.5, NULL, NULL, NULL),
(12011, 'Skin iPhone 4/4S 3D', 'skin-iphone-4-4s-3d', 841, '', 'product.jpg', 9.8, NULL, NULL, NULL),
(12236, 'Skin iPhone 4/4S 3D BULLKin', 'skin-iphone-4-4s-3d-bullkin', 841, '', 'product.jpg', 8.8, NULL, NULL, NULL),
(12237, 'Screen Guard iPhone 4/4S Front/Back HOCO', 'screen-guard-iphone-4-4s-front-back-hoco', 841, '', 'product.jpg', 6.6, NULL, NULL, NULL),
(12351, 'Skin iPhone 4/4S 3D JunLieg', 'skin-iphone-4-4s-3d-junlieg', 841, '', 'product.jpg', 8, NULL, NULL, NULL),
(12585, 'Screen Guard iPhone 4/4S Front/Back Anti Glare BULLKin ', 'screen-guard-iphone-4-4s-front-back-anti-glare-bullkin', 841, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 3.3, NULL, NULL, NULL),
(12625, 'Screen Guard iPhone 4/4S Waterproof', 'screen-guard-iphone-4-4s-waterproof', 841, '<p>\r\n	водонепроницаемая</p>\r\n', 'product.jpg', 5.5, NULL, NULL, NULL),
(12656, 'Screen Guard iPhone 5 Front/Back BULLKin ', 'screen-guard-iphone-5-front-back-bullkin', 841, '<p>\r\n	задняя из трёх частей</p>\r\n', 'product.jpg', 4.5, NULL, NULL, NULL),
(12657, 'Screen Guard iPhone 5 Anti Glare BULLKin ', 'screen-guard-iphone-5-anti-glare-bullkin', 841, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 4, NULL, NULL, NULL),
(12771, 'Screen Guard iPhone 5 Front/Back Anti Glare BULLKin ', 'screen-guard-iphone-5-front-back-anti-glare-bullkin', 841, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 4.5, NULL, NULL, NULL),
(12772, 'Screen Guard iPhone 5 Clear BULLKin ', 'screen-guard-iphone-5-clear-bullkin', 841, '', 'product.jpg', 3.3, NULL, NULL, NULL),
(12775, 'Screen Guard iPhone 5 Front/Back Clear', 'screen-guard-iphone-5-front-back-clear', 841, '', 'product.jpg', 4, NULL, NULL, NULL),
(12776, 'Screen Guard iPhone 5 Front/Back Anti Glare', 'screen-guard-iphone-5-front-back-anti-glare', 841, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 4, NULL, NULL, NULL),
(12777, 'Screen Guard iPhone 5 Front/Back Mirror', 'screen-guard-iphone-5-front-back-mirror', 841, '<p>\r\n	(зеркальная)</p>\r\n', 'product.jpg', 4.5, NULL, NULL, NULL),
(12778, 'Screen Guard iPhone 5 Clear', 'screen-guard-iphone-5-clear', 841, '', 'product.jpg', 3, NULL, NULL, NULL),
(12779, 'Screen Guard iPhone 5 Anti Glare ', 'screen-guard-iphone-5-anti-glare', 841, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 3.2, NULL, NULL, NULL),
(13044, 'Screen Guard iPhone 5 Front/Back Diamond BULLKin ', 'screen-guard-iphone-5-front-back-diamond-bullkin', 841, '', 'product.jpg', 5.5, NULL, NULL, NULL),
(12942, 'Screen Guard iPhone 5 Front/Back Clear HOCO', 'screen-guard-iphone-5-front-back-clear-hoco', 841, '', 'product.jpg', 5.3, NULL, NULL, NULL),
(12896, 'Skin iPhone 4 Carbon White', 'skin-iphone-4-carbon-white', 841, '', 'product.jpg', 4, NULL, NULL, NULL),
(12897, 'Skin iPhone 4S Carbon Black', 'skin-iphone-4s-carbon-black', 841, '', 'product.jpg', 4, NULL, NULL, NULL),
(12898, 'Skin iPhone 4S Carbon White', 'skin-iphone-4s-carbon-white', 841, '', 'product.jpg', 4, NULL, NULL, NULL),
(13045, 'Screen Guard iPhone 5 Front/Back Japan AF BULLKin ', 'screen-guard-iphone-5-front-back-japan-af-bullkin', 841, '', 'product.jpg', 6.5, NULL, NULL, NULL),
(13480, 'Screen Guard iPhone 5 Anti Glare BULLKin ', 'screen-guard-iphone-5-anti-glare-bullkin-2', 841, '', 'product.jpg', 0, NULL, NULL, NULL),
(9146, 'Screen Guard iPod Touch 2G/3G', 'screen-guard-ipod-touch-2g-3g', 842, '', 'product.jpg', 1.5, NULL, NULL, NULL),
(9147, 'Screen Guard iPod Touch 2G/3G Anti Glare ', 'screen-guard-ipod-touch-2g-3g-anti-glare', 842, '(матовая)', 'product.jpg', 1.3, NULL, NULL, NULL),
(9536, 'Screen Guard iPod Touch 4G ', 'screen-guard-ipod-touch-4g', 842, '', 'product.jpg', 1.7, NULL, NULL, NULL),
(9537, 'Screen Guard iPod Touch 4G Anti Glare ', 'screen-guard-ipod-touch-4g-anti-glare', 842, '(матовая)', 'product.jpg', 1.9, NULL, NULL, NULL),
(9538, 'Screen Guard iPod Nano 6G', 'screen-guard-ipod-nano-6g', 842, '', 'product.jpg', 1.1, NULL, NULL, NULL),
(9539, 'Screen Guard iPod Nano 6G Anti Glare ', 'screen-guard-ipod-nano-6g-anti-glare', 842, '(матовая)', 'product.jpg', 1.2, NULL, NULL, NULL),
(9540, 'Screen Guard iPod Nano 5G', 'screen-guard-ipod-nano-5g', 842, '', 'product.jpg', 0.9, NULL, NULL, NULL),
(13338, 'Screen Guard iPod Touch 5G Anti Glare', 'screen-guard-ipod-touch-5g-anti-glare', 842, '<p>\r\n	(матовая)</p>\r\n', 'product.jpg', 3, NULL, NULL, NULL),
(13339, 'Screen Guard iPod Touch 5G ', 'screen-guard-ipod-touch-5g', 842, '', 'product.jpg', 2.9, NULL, NULL, NULL),
(7027, 'Screen Guard MacBook Air 13.3\"', 'screen-guard-macbook-air-13-3', 843, '', 'product.jpg', 4.9, NULL, NULL, NULL),
(9955, 'Screen Guard MacBook Air 11.6\"', 'screen-guard-macbook-air-11-6', 843, '', 'product.jpg', 4, NULL, NULL, NULL),
(10376, 'Skin for Apple MacBook Air 11\" carbon (white, black)', 'skin-for-apple-macbook-air-11-carbon-white-black', 843, '', 'product.jpg', 7, NULL, NULL, NULL),
(10619, 'X-doria Keyboard Protector for MacBook Air/Pro 13.3\"', 'x-doria-keyboard-protector-for-macbook-air-pro-13-3', 843, 'защитная плёнка на клавиатуру', 'product.jpg', 19, NULL, NULL, NULL),
(10620, 'X-doria Keyboard Protector for MacBook Air 11.6\"', 'x-doria-keyboard-protector-for-macbook-air-11-6', 843, 'защитная плёнка на клавиатуру', 'product.jpg', 19, NULL, NULL, NULL),
(10626, 'X-doria Screen Protector for MacBook 13.3\"', 'x-doria-screen-protector-for-macbook-13-3', 843, 'защитная плёнка на экран ', 'product.jpg', 19, NULL, NULL, NULL),
(10627, 'X-doria Screen Protector for MacBook 11,6\"', 'x-doria-screen-protector-for-macbook-11-6', 843, 'защитная плёнка на экран', 'product.jpg', 19, NULL, NULL, NULL),
(10862, 'Keypad protector TPU for Air 11,6\"', 'keypad-protector-tpu-for-air-11-6', 843, '', 'product.jpg', 8, NULL, NULL, NULL),
(10863, 'Keypad protector TPU for Air 13,3\"', 'keypad-protector-tpu-for-air-13-3', 843, '', 'product.jpg', 8, NULL, NULL, NULL),
(8110, 'Набор для открывания корпусов iPhone 2G/3G/3GS', 'nabor-dlya-otkryvaniya-korpusov-iphone-2g-3g-3gs', 853, '', 'product.jpg', 5, NULL, NULL, NULL),
(9013, 'Трафарет для iPhone 3G', 'trafaret-dlya-iphone-3g', 853, '', 'product.jpg', 6.1, NULL, NULL, NULL),
(9015, 'Трафарет CPU iPhone', 'trafaret-cpu-iphone', 853, '', 'product.jpg', 5.95, NULL, NULL, NULL),
(9465, 'Трафарет для iPhone 3GS', 'trafaret-dlya-iphone-3gs', 853, '', 'product.jpg', 6.1, NULL, NULL, NULL),
(9711, 'Набор для открывания корпусов iPhone 4', 'nabor-dlya-otkryvaniya-korpusov-iphone-4', 853, 'отвертка / присоска / пластиковые инструменты', 'product.jpg', 6.5, NULL, NULL, NULL),
(9904, 'Клей для iPhone (для LCD)', 'kley-dlya-iphone-dlya-lcd', 853, '', 'product.jpg', 6.9, NULL, NULL, NULL),
(10182, 'Отвёртка Apple (крестовая)', 'otvertka-apple-krestovaya', 853, '', 'product.jpg', 5.5, NULL, NULL, NULL),
(10332, 'Трафарет для iPhone 4', 'trafaret-dlya-iphone-4', 853, '2G/3G/3GS', 'product.jpg', 8, NULL, NULL, NULL),
(10829, 'Клей двухкомпонентный для iPhone', 'kley-dvuhkomponentnyy-dlya-iphone', 853, '', 'product.jpg', 7, NULL, NULL, NULL),
(12084, 'Отвёртка Apple (звездочка)', 'otvertka-apple-zvezdochka', 853, '', 'product.jpg', 5.5, NULL, NULL, NULL),
(12804, 'Присоска для вскрытия iPhone/iPod/iPad', 'prisoska-dlya-vskrytiya-iphone-ipod-ipad', 853, '', 'product.jpg', 3, NULL, NULL, NULL),
(13450, 'Пластиковая основа для хранения болтов на iPhone 4G', 'plastikovaya-osnova-dlya-hraneniya-boltov-na-iphone-4g', 853, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(13451, 'Пластиковая основа для хранения болтов на iPhone 5', 'plastikovaya-osnova-dlya-hraneniya-boltov-na-iphone-5', 853, '', 'product.jpg', 5, NULL, NULL, NULL),
(13530, 'Трафарет для iPhone 5', 'trafaret-dlya-iphone-5', 853, '', 'product.jpg', 8, NULL, NULL, NULL),
(8446, 'Cable USB iPod Shuffle ', 'cable-usb-ipod-shuffle', 879, '', 'product.jpg', 9, NULL, NULL, NULL),
(8838, 'Capdase Leather Sleeve case iPod Nano 5G Lofti (red)', 'capdase-leather-sleeve-case-ipod-nano-5g-lofti-red', 879, '', 'product.jpg', 15, NULL, NULL, NULL),
(8842, 'Capdase Leather Sleeve case iPod Nano 5G Lofti (black)', 'capdase-leather-sleeve-case-ipod-nano-5g-lofti-black', 879, '', 'product.jpg', 19, NULL, NULL, NULL),
(9095, 'Sleeve case Soft jacket 2 iPod Nano 5G  Capdase (закрытый) (white)', 'sleeve-case-soft-jacket-2-ipod-nano-5g-capdase-zakrytyy-white', 879, '', 'product.jpg', 10, NULL, NULL, NULL),
(9096, 'Sleeve case Soft jacket iPod Nano 5G Capdase (открытый)', 'sleeve-case-soft-jacket-ipod-nano-5g-capdase-otkrytyy', 879, '', 'product.jpg', 16, NULL, NULL, NULL),
(9185, 'Socks for iPod (комплект)', 'socks-for-ipod-komplekt', 879, '', 'product.jpg', 6.9, NULL, NULL, NULL),
(11054, 'Capdase Soft Jacket 2 Xpose - iPod Touch (4th generation) Silicone Case (grey)', 'capdase-soft-jacket-2-xpose---ipod-touch-4th-generation-silicone-case-grey', 879, '', 'product.jpg', 19.5, NULL, NULL, NULL),
(11055, 'Capdase Soft Jacket 2 Xpose - iPod Touch (4th generation) Silicone Case (white)', 'capdase-soft-jacket-2-xpose---ipod-touch-4th-generation-silicone-case-white', 879, '', 'product.jpg', 19.5, NULL, NULL, NULL),
(11684, 'Capdase Sport Armband for iPod shuffle 2G', 'capdase-sport-armband-for-ipod-shuffle-2g', 879, '<p>\r\n	Syncha Sync and Charge Adaptor Set</p>\r\n', 'product.jpg', 7.8, NULL, NULL, NULL),
(12606, 'Capdase Soft Jacket 2 Xpose - iPod Touch (4th generation) Silicone Case (clear)', 'capdase-soft-jacket-2-xpose---ipod-touch-4th-generation-silicone-case-clear', 879, '', 'product.jpg', 19, NULL, NULL, NULL),
(10504, 'Palmguard Air 13 with Trackpad Protector Silver for MacBook Air 13\"', 'palmguard-air-13-with-trackpad-protector-silver-for-macbook-air-13', 880, 'Накладка на тачпад.', 'product.jpg', 17, NULL, NULL, NULL),
(10505, 'Palmguard Pro 13 with Trackpad Protector Silver for MacBook Pro 13\"', 'palmguard-pro-13-with-trackpad-protector-silver-for-macbook-pro-13', 880, 'Накладка на тачпад.', 'product.jpg', 17, NULL, NULL, NULL),
(10506, 'Palmguard Pro 15 with Trackpad Protector Silver for MacBook Pro 15\"', 'palmguard-pro-15-with-trackpad-protector-silver-for-macbook-pro-15', 880, 'Накладка на тачпад.', 'product.jpg', 17, NULL, NULL, NULL),
(10507, 'Palmguard Air 11.6 with Trackpad Protector Silver for MacBook Air 11.6\"', 'palmguard-air-11-6-with-trackpad-protector-silver-for-macbook-air-11-6', 880, 'Накладка на тачпад.', 'product.jpg', 16, NULL, NULL, NULL),
(10617, 'Power Adapter MagSafe 85W (блок питания)', 'power-adapter-magsafe-85w-blok-pitaniya', 880, 'блок питания ', 'product.jpg', 95, NULL, NULL, NULL),
(10618, 'Power Adapter MagSafe 60W (блок питания)', 'power-adapter-magsafe-60w-blok-pitaniya', 880, 'блок питания ', 'product.jpg', 75, NULL, NULL, NULL),
(10624, 'Case iTaste Studio for Apple MacBook Air 11.6 (black)', 'case-itaste-studio-for-apple-macbook-air-11-6-black', 880, '<p>\r\n	Чехол - карман для MacBook Air 11.6</p>\r\n', 'product.jpg', 37, NULL, NULL, NULL),
(10625, 'Case iTaste Studio for Apple MacBook Air 13.3', 'case-itaste-studio-for-apple-macbook-air-13-3', 880, '<p>\r\n	Чехол - карман для MacBook Air 13.3</p>\r\n', 'product.jpg', 37, NULL, NULL, NULL),
(9090, 'Sleeve Case iPad (резиновый) (black-orange)', 'sleeve-case-ipad-rezinovyy-black-orange', 881, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(9091, 'Protect back cover для iPad  ', 'protect-back-cover-dlya-ipad', 881, 'карбон-полимерный чехол (прозрачный)', 'product.jpg', 3, NULL, NULL, NULL),
(9092, 'Кожаный чехол папка-трансформер iPad сase (black)', 'kozhanyy-chehol-papka-transformer-ipad-sase-black', 881, '', 'product.jpg', 15, NULL, NULL, NULL),
(9093, 'Кожаный чехол-папка для iPad (black)', 'kozhanyy-chehol-papka-dlya-ipad-black', 881, '', 'product.jpg', 3.3, NULL, NULL, NULL),
(9189, 'Sleeve Case iPad original (замшевый чехол-папка) (black) ', 'sleeve-case-ipad-original-zamshevyy-chehol-papka-black', 881, 'designed by Apple in California', 'product.jpg', 20, NULL, NULL, NULL),
(9190, 'Кожаный чехол-папка для iPad (вертикальный) (black)', 'kozhanyy-chehol-papka-dlya-ipad-vertikal-nyy-black', 881, '', 'product.jpg', 3.2, NULL, NULL, NULL),
(9191, 'Кожаный чехол-папка для iPad (горизонтальный) (black)', 'kozhanyy-chehol-papka-dlya-ipad-gorizontal-nyy-black', 881, '', 'product.jpg', 3.4, NULL, NULL, NULL),
(9240, 'Stylus iPad big (black)', 'stylus-ipad-big-black', 881, '', 'product.jpg', 2.9, NULL, NULL, NULL),
(9266, 'Capdase Screen protector included Soft Jacket 2 Xpose iPad (white)', 'capdase-screen-protector-included-soft-jacket-2-xpose-ipad-white', 881, '<p>\r\n	ультратонкий чехол с открытым экраном</p>\r\n', 'product.jpg', 15, NULL, NULL, NULL),
(9267, 'Tuneshell for iPad (пластиковый чехол) (blue)', 'tuneshell-for-ipad-plastikovyy-chehol-blue', 881, 'чехол являет собой твердую оболочку и плотно прилегает к задней панели оставляя все порты и переключатели открытыми', 'product.jpg', 7.5, NULL, NULL, NULL),
(9426, 'Stylus iPad small (white)', 'stylus-ipad-small-white', 881, '', 'product.jpg', 1.8, NULL, NULL, NULL),
(9452, 'Camera Connection Kit for iPad', 'camera-connection-kit-for-ipad', 881, 'Переходник для подключения карты памяти, камеры и USB устройств.', 'product.jpg', 5.5, NULL, NULL, NULL),
(9700, 'Mallper USB Power Supply in Car Charger iPhone/iPad', 'mallper-usb-power-supply-in-car-charger-iphone-ipad', 881, 'автомобильное зарядное устройство для iPad (2.1 A)', 'product.jpg', 11, NULL, NULL, NULL),
(10898, 'Capdase Screen protector included Soft Jacket 2 Xpose iPad (black)', 'capdase-screen-protector-included-soft-jacket-2-xpose-ipad-black', 881, '<p>\r\n	ультратонкий чехол с открытым экраном</p>\r\n', 'product.jpg', 15, NULL, NULL, NULL),
(10899, 'Кожаный чехол-папка для iPad (brown)', 'kozhanyy-chehol-papka-dlya-ipad-brown', 881, '', 'product.jpg', 3.3, NULL, NULL, NULL),
(10900, 'Кожаный чехол-папка для iPad (red)', 'kozhanyy-chehol-papka-dlya-ipad-red', 881, '', 'product.jpg', 3.3, NULL, NULL, NULL),
(10901, 'Кожаный чехол-папка для iPad (pink)', 'kozhanyy-chehol-papka-dlya-ipad-pink', 881, '', 'product.jpg', 3.3, NULL, NULL, NULL),
(10902, 'Stylus iPad small (black)', 'stylus-ipad-small-black', 881, '', 'product.jpg', 1.8, NULL, NULL, NULL),
(10916, 'Sleeve Case iPad (резиновый) (black-pink)', 'sleeve-case-ipad-rezinovyy-black-pink', 881, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(10917, 'Sleeve Case iPad (резиновый) (black-blue)', 'sleeve-case-ipad-rezinovyy-black-blue', 881, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(10919, 'Tuneshell for iPad (пластиковый чехол) (pink)', 'tuneshell-for-ipad-plastikovyy-chehol-pink', 881, '<p>\r\n	чехол являет собой твердую оболочку и плотно прилегает к задней панели оставляя все порты и переключатели открытыми</p>\r\n', 'product.jpg', 7.5, NULL, NULL, NULL),
(10920, 'Tuneshell for iPad (пластиковый чехол) (purple)', 'tuneshell-for-ipad-plastikovyy-chehol-purple', 881, '<p>\r\n	чехол являет собой твердую оболочку и плотно прилегает к задней панели оставляя все порты и переключатели открытыми</p>\r\n', 'product.jpg', 7.5, NULL, NULL, NULL),
(10253, 'Apple iPad 2 Smart Cover Leather Tan (black)', 'apple-ipad-2-smart-cover-leather-tan-black', 882, 'чехол специально создан для iPad 2 со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран', 'product.jpg', 9, NULL, NULL, NULL),
(10254, 'Back Cover for iPad 2 (green)', 'back-cover-for-ipad-2-green', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(10381, 'High Sensitive Stylus Pen (black, silver, white)', 'high-sensitive-stylus-pen-black-silver-white', 882, 'Стилус универсальный для емкостного экрана (цвета в ассортименте) и имеет мягкий наконечник', 'product.jpg', 2, NULL, NULL, NULL),
(10557, 'Mallper Mabaye series Cover iPad 2 ', 'mallper-mabaye-series-cover-ipad-2', 882, 'красивый дизайн с экологически чистых материалов абсолютно удобный для пользователей', 'product.jpg', 13, NULL, NULL, NULL),
(10867, 'Capdase Protective Case Flip Jacket for iPad 2 (black)', 'capdase-protective-case-flip-jacket-for-ipad-2-black', 882, 'кожаный чехол который трансформируется в подставку и фиксирует iPad 2 в трех положениях', 'product.jpg', 30, NULL, NULL, NULL),
(10877, 'LOCA Companion Case for iPad 2 /NEW iPad (black)', 'loca-companion-case-for-ipad-2-new-ipad-black', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'product.jpg', 10, NULL, NULL, NULL),
(10921, 'Smart Cover Polyurethane iPad 2 (pink) (шторка)', 'smart-cover-polyurethane-ipad-2-pink-shtorka', 882, 'Smart Cover изготовлен из кожи и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'product.jpg', 13, NULL, NULL, NULL),
(10922, 'Smart Cover Polyurethane iPad 2 (green) (шторка)', 'smart-cover-polyurethane-ipad-2-green-shtorka', 882, 'Smart Cover изготовлен из кожи и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'product.jpg', 9, NULL, NULL, NULL),
(10923, 'Smart Cover Polyurethane iPad 2 (grеy) (шторка)', 'smart-cover-polyurethane-ipad-2-grey-shtorka', 882, 'Smart Cover изготовлен из кожи и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'product.jpg', 14, NULL, NULL, NULL),
(10925, 'Back Cover for iPad 2 (blue)', 'back-cover-for-ipad-2-blue', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(10926, 'Back Cover for iPad 2 (pink)', 'back-cover-for-ipad-2-pink', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(10929, 'LOCA Companion Case for iPad 2 /NEW iPad  (clear)', 'loca-companion-case-for-ipad-2-new-ipad-clear', 882, 'чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели ', 'product.jpg', 14, NULL, NULL, NULL),
(11414, 'LOCA Companion Case for iPad 2 /NEW iPad  (pink)', 'loca-companion-case-for-ipad-2-new-ipad-pink', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'product.jpg', 14, NULL, NULL, NULL),
(11606, 'Capdase Protective Case Flip Jacket for iPad 2 (red)', 'capdase-protective-case-flip-jacket-for-ipad-2-red', 882, 'кожаный чехол который трансформируется в подставку и фиксирует iPad 2 в трех положениях', 'product.jpg', 30, NULL, NULL, NULL),
(11631, 'Back Cover for iPad 2 (foggy)', 'back-cover-for-ipad-2-foggy', 882, 'чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели', 'product.jpg', 5, NULL, NULL, NULL),
(11632, 'Back Cover for iPad 2 (clear)', 'back-cover-for-ipad-2-clear', 882, '<p>\r\n	чехол изготовлен с высокопрочного полиуретана и являет собой твердую оболочку которая плотно прилегает к задней панели</p>\r\n', 'product.jpg', 5, NULL, NULL, NULL),
(11651, 'iTaste Studio Simple Bag for iPad 2 (black)', 'itaste-studio-simple-bag-for-ipad-2-black', 882, '<p>\r\n	Кожаный чехол - карман для iPad 2</p>\r\n', 'product.jpg', 25, NULL, NULL, NULL),
(11652, 'Miaget Hermes case iPad 2 (white)', 'miaget-hermes-case-ipad-2-white', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'product.jpg', 23, NULL, NULL, NULL),
(11653, 'Miaget Hermes case iPad 2 (black)', 'miaget-hermes-case-ipad-2-black', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'product.jpg', 23, NULL, NULL, NULL),
(11654, 'Miaget Hermes case iPad 2 (beige)', 'miaget-hermes-case-ipad-2-beige', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'product.jpg', 23, NULL, NULL, NULL),
(11655, 'Miaget Hermes case iPad 2 (pink)', 'miaget-hermes-case-ipad-2-pink', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'product.jpg', 23, NULL, NULL, NULL),
(11656, 'Miaget Hermes case iPad 2 (red)', 'miaget-hermes-case-ipad-2-red', 882, 'красивая и элегантная сумка-конверт для iPad 2/iPad NEW', 'product.jpg', 23, NULL, NULL, NULL),
(11673, 'Croco Crocodile design leather Case for iPad 2 (black)', 'croco-crocodile-design-leather-case-for-ipad-2-black', 882, 'чехол из кожы рептилий внутри с каркасом из пластика', 'product.jpg', 14, NULL, NULL, NULL),
(11674, 'Croco Crocodile design leather Case for iPad 2  (pink)', 'croco-crocodile-design-leather-case-for-ipad-2-pink', 882, 'чехол из кожы рептилий внутри с каркасом из пластика', 'product.jpg', 14, NULL, NULL, NULL),
(11678, 'Flip Case for iPad 2 Rhombic (black)', 'flip-case-for-ipad-2-rhombic-black', 882, '', 'product.jpg', 14, NULL, NULL, NULL),
(11679, 'Flip Case for iPad 2 Rhombic (white)', 'flip-case-for-ipad-2-rhombic-white', 882, '', 'product.jpg', 14, NULL, NULL, NULL),
(11680, 'Flip Case for iPad 2 Rhombic (yellow)', 'flip-case-for-ipad-2-rhombic-yellow', 882, '', 'product.jpg', 14, NULL, NULL, NULL),
(11681, 'Flip Case for iPad 2 Rhombic (blue)', 'flip-case-for-ipad-2-rhombic-blue', 882, '', 'product.jpg', 14, NULL, NULL, NULL),
(11683, 'Flip Case for iPad 2 Rhombic (pink)', 'flip-case-for-ipad-2-rhombic-pink', 882, '', 'product.jpg', 14, NULL, NULL, NULL),
(12061, 'ROCK Texture case for New iPad (black)', 'rock-texture-case-for-new-ipad-black', 883, '', 'product.jpg', 27, NULL, NULL, NULL),
(12067, 'ROCK Texture case for New iPad (sand)', 'rock-texture-case-for-new-ipad-sand', 883, '', 'product.jpg', 27, NULL, NULL, NULL),
(12075, 'Leather case for NEW iPad/iPad 2 (black)', 'leather-case-for-new-ipad-ipad-2-black', 883, '<p>\r\n	чехол</p>\r\n', 'product.jpg', 17, NULL, NULL, NULL),
(12135, 'Leather Smart Cover for New iPad (black)', 'leather-smart-cover-for-new-ipad-black', 883, '<p>\r\n	кожаная шторка</p>\r\n', 'product.jpg', 20, NULL, NULL, NULL),
(12136, 'Polyurethane Smart Cover For New iPad (black)', 'polyurethane-smart-cover-for-new-ipad-black', 883, '', 'product.jpg', 16, NULL, NULL, NULL),
(12339, 'Smart Case for New iPad (black)', 'smart-case-for-new-ipad-black', 883, '', 'product.jpg', 21, NULL, NULL, NULL),
(12340, 'Smart Case for New iPad (white)', 'smart-case-for-new-ipad-white', 883, '', 'product.jpg', 21, NULL, NULL, NULL),
(12341, 'ROCK Eternal case for New iPad (grey)', 'rock-eternal-case-for-new-ipad-grey', 883, '', 'product.jpg', 28, NULL, NULL, NULL),
(12361, 'Leather Smart Cover for New iPad (beige)', 'leather-smart-cover-for-new-ipad-beige', 883, '', 'product.jpg', 15.5, NULL, NULL, NULL),
(12390, 'ROCK Texture case for New iPad (green)', 'rock-texture-case-for-new-ipad-green', 883, '', 'product.jpg', 27, NULL, NULL, NULL),
(12391, 'ROCK Texture case for New iPad (bronze)', 'rock-texture-case-for-new-ipad-bronze', 883, '', 'product.jpg', 27, NULL, NULL, NULL),
(12439, 'Yoobao Executive leather Case for New iPad (black)', 'yoobao-executive-leather-case-for-new-ipad-black', 883, '', 'product.jpg', 33, NULL, NULL, NULL),
(12440, 'Yoobao Executive leather Case for New iPad (purple)', 'yoobao-executive-leather-case-for-new-ipad-purple', 883, '', 'product.jpg', 32, NULL, NULL, NULL),
(12441, 'Yoobao Executive leather Case for New iPad (pink)', 'yoobao-executive-leather-case-for-new-ipad-pink', 883, '', 'product.jpg', 31, NULL, NULL, NULL),
(12443, 'Trexta Slim Folio Case for New iPad (brown)', 'trexta-slim-folio-case-for-new-ipad-brown', 883, '', 'product.jpg', 33, NULL, NULL, NULL),
(12445, 'Trexta Slim Folio Case for New iPad (light pink)', 'trexta-slim-folio-case-for-new-ipad-light-pink', 883, '', 'product.jpg', 33, NULL, NULL, NULL),
(12446, 'Aigo Advanced leather Case for New iPad (black)', 'aigo-advanced-leather-case-for-new-ipad-black', 883, '', 'product.jpg', 32, NULL, NULL, NULL),
(12447, 'Aigo Advanced leather Case for New iPad (brown)', 'aigo-advanced-leather-case-for-new-ipad-brown', 883, '', 'product.jpg', 32, NULL, NULL, NULL),
(12448, 'Aigo Advanced leather Case for New iPad (red)', 'aigo-advanced-leather-case-for-new-ipad-red', 883, '', 'product.jpg', 32, NULL, NULL, NULL),
(12451, 'Speck Magfolio Case for New iPad (black)', 'speck-magfolio-case-for-new-ipad-black', 883, '', 'product.jpg', 19, NULL, NULL, NULL),
(12452, 'Speck Magfolio Case for New iPad (red)', 'speck-magfolio-case-for-new-ipad-red', 883, '', 'product.jpg', 19, NULL, NULL, NULL),
(12453, 'Speck Magfolio Case for New iPad (multi-color)', 'speck-magfolio-case-for-new-ipad-multi-color', 883, '', 'product.jpg', 19, NULL, NULL, NULL),
(12454, 'BELK Case PU Leather for New iPad (grey)', 'belk-case-pu-leather-for-new-ipad-grey', 883, '', 'product.jpg', 15, NULL, NULL, NULL),
(12460, 'BELK Case Italian Style for New iPad (black)', 'belk-case-italian-style-for-new-ipad-black', 883, '', 'product.jpg', 15, NULL, NULL, NULL),
(12461, 'BELK Case Italian Style for New iPad (white)', 'belk-case-italian-style-for-new-ipad-white', 883, '', 'product.jpg', 15, NULL, NULL, NULL),
(12463, 'BELK Case Italian Style for New iPad (pink)', 'belk-case-italian-style-for-new-ipad-pink', 883, '', 'product.jpg', 15, NULL, NULL, NULL),
(12464, 'BELK Case Italian Style for New iPad (blue)', 'belk-case-italian-style-for-new-ipad-blue', 883, '', 'product.jpg', 15, NULL, NULL, NULL),
(12465, 'BELK Case Italian Style for New iPad (orange)', 'belk-case-italian-style-for-new-ipad-orange', 883, '', 'product.jpg', 15, NULL, NULL, NULL),
(12596, 'ROCK Defense case for NEW iPad (grey)', 'rock-defense-case-for-new-ipad-grey', 883, '', 'product.jpg', 28, NULL, NULL, NULL),
(12597, 'ROCK Defense case for NEW iPad (green)', 'rock-defense-case-for-new-ipad-green', 883, '', 'product.jpg', 27, NULL, NULL, NULL),
(12604, 'BOROFONE case for New iPad (black)', 'borofone-case-for-new-ipad-black', 883, '', 'product.jpg', 29, NULL, NULL, NULL),
(12605, 'BOROFONE case for New iPad (grey)', 'borofone-case-for-new-ipad-grey', 883, '', 'product.jpg', 29, NULL, NULL, NULL),
(12684, 'Smart Case for New iPad original (black)', 'smart-case-for-new-ipad-original-black', 883, '', 'product.jpg', 59, NULL, NULL, NULL),
(12685, 'Smart Case for New iPad original (grey)', 'smart-case-for-new-ipad-original-grey', 883, '', 'product.jpg', 59, NULL, NULL, NULL),
(12888, 'Griffin wall charger for iPad/iPhone/iPod (dual USB)', 'griffin-wall-charger-for-ipad-iphone-ipod-dual-usb', 883, 'Сетевое зарядное устройство 2 USB 10watt /5volts/2.1amps', 'product.jpg', 15, NULL, NULL, NULL),
(12960, 'ROCK Eternal case for New iPad (black)', 'rock-eternal-case-for-new-ipad-black', 883, '', 'product.jpg', 28, NULL, NULL, NULL),
(12961, 'ROCK Eternal case for New iPad (green)', 'rock-eternal-case-for-new-ipad-green', 883, '', 'product.jpg', 28, NULL, NULL, NULL),
(12963, 'ROCK Defense case for NEW iPad (orange)', 'rock-defense-case-for-new-ipad-orange', 883, '', 'product.jpg', 28, NULL, NULL, NULL),
(12903, 'ROCK Eternal case for iPad mini (green)', 'rock-eternal-case-for-ipad-mini-green', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 22, NULL, NULL, NULL),
(12904, 'Smart Cover Polyurethane for iPad mini (black)', 'smart-cover-polyurethane-for-ipad-mini-black', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'product.jpg', 17, NULL, NULL, NULL),
(12905, 'Smart Cover Polyurethane for iPad mini (grey)', 'smart-cover-polyurethane-for-ipad-mini-grey', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'product.jpg', 15, NULL, NULL, NULL),
(12906, 'ROCK Veins case for iPad mini (cream)', 'rock-veins-case-for-ipad-mini-cream', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 22, NULL, NULL, NULL),
(12907, 'ROCK Flexible case for iPad mini (dark grey)', 'rock-flexible-case-for-ipad-mini-dark-grey', 884, 'чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 19.5, NULL, NULL, NULL),
(12908, 'USAMS Leather Stand Cover for iPad mini (black)', 'usams-leather-stand-cover-for-ipad-mini-black', 884, 'Выполненный из мягкой кожи чехол USAMS отлично защитит iPad mini и оставляет доступ ко всем портам и функциональным клавишам', 'product.jpg', 21, NULL, NULL, NULL),
(12909, 'USAMS Leather Stand Cover for iPad mini (white)', 'usams-leather-stand-cover-for-ipad-mini-white', 884, 'Выполненный из мягкой кожи чехол USAMS отлично защитит iPad mini и оставляет доступ ко всем портам и функциональным клавишам', 'product.jpg', 21, NULL, NULL, NULL),
(12910, 'USAMS Leather Stand Cover for iPad mini (pink)', 'usams-leather-stand-cover-for-ipad-mini-pink', 884, 'Выполненный из мягкой кожи чехол USAMS отлично защитит iPad mini и оставляет доступ ко всем портам и функциональным клавишам', 'product.jpg', 20, NULL, NULL, NULL),
(12916, 'ROCK Veins case for iPad mini (dark grey)', 'rock-veins-case-for-ipad-mini-dark-grey', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 22, NULL, NULL, NULL),
(12955, 'ROCK Eternal case for iPad mini (black)', 'rock-eternal-case-for-ipad-mini-black', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 22, NULL, NULL, NULL),
(12956, 'ROCK Eternal case for iPad mini (grey)', 'rock-eternal-case-for-ipad-mini-grey', 884, '<p>\r\n	кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях</p>\r\n', 'product.jpg', 22, NULL, NULL, NULL),
(12957, 'ROCK Eternal case for iPad mini (orange)', 'rock-eternal-case-for-ipad-mini-orange', 884, 'кожаный чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 22, NULL, NULL, NULL),
(12958, 'ROCK Flexible case for iPad mini (pink)', 'rock-flexible-case-for-ipad-mini-pink', 884, 'чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 19.5, NULL, NULL, NULL),
(12959, 'ROCK Flexible case for iPad mini (green)', 'rock-flexible-case-for-ipad-mini-green', 884, 'чехол-книжка который трансформируется в подставку и фиксирует iPad mini в трех положениях', 'product.jpg', 19.5, NULL, NULL, NULL),
(12964, 'Smart Cover Polyurethane for iPad mini (pink)', 'smart-cover-polyurethane-for-ipad-mini-pink', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'product.jpg', 17, NULL, NULL, NULL),
(12965, 'Smart Cover Polyurethane for iPad mini (white)', 'smart-cover-polyurethane-for-ipad-mini-white', 884, 'Smart Cover со встроенными магнитами которые легко защёлкиваются и чехол плотно ложиться на экран и имеет мягкую подкладку с микрофибры, которая помогает содержать экран в чистоте', 'product.jpg', 17, NULL, NULL, NULL),
(12966, 'Back Cover iPad mini (grey)', 'back-cover-ipad-mini-grey', 884, '<p>\r\n	дымчатый чехол - крышка пластиковый на корпус</p>\r\n', 'product.jpg', 8, NULL, NULL, NULL),
(12967, 'Back Cover iPad mini (clear)', 'back-cover-ipad-mini-clear', 884, '<p>\r\n	прозрачный чехол - крышка пластиковая на корпус</p>\r\n', 'product.jpg', 8, NULL, NULL, NULL),
(13046, 'BOROFONE case for iPad mini (black)', 'borofone-case-for-ipad-mini-black', 884, '', 'product.jpg', 22, NULL, NULL, NULL),
(13131, 'Baseus Grace leather Case iPad mini (blue)', 'baseus-grace-leather-case-ipad-mini-blue', 884, '', 'product.jpg', 17, NULL, NULL, NULL),
(13132, 'Baseus Grace leather Case iPad mini (grey)', 'baseus-grace-leather-case-ipad-mini-grey', 884, '', 'product.jpg', 17, NULL, NULL, NULL),
(8444, 'Hands free iPhone 3G/3GS/iPod Shuffle', 'hands-free-iphone-3g-3gs-ipod-shuffle', 885, 'наушники\r\n', 'product.jpg', 11.5, NULL, NULL, NULL),
(8652, 'Sleeve case Capdase Callid iPhone 3G/3GS (black)', 'sleeve-case-capdase-callid-iphone-3g-3gs-black', 885, '<p>\r\n	чехол кожаный закрытый с прорезью</p>\r\n', 'product.jpg', 14, NULL, NULL, NULL),
(8655, 'Sleeve case iPhone 3G/3GS (силиконовые red/pink/purple)', 'sleeve-case-iphone-3g-3gs-silikonovye-red-pink-purple', 885, '', 'product.jpg', 1, NULL, NULL, NULL),
(8835, 'Sleeve case Capdase Snak iPhone 3G', 'sleeve-case-capdase-snak-iphone-3g', 885, '', 'product.jpg', 14, NULL, NULL, NULL),
(10255, 'Protective Case for iPhone 3G (black) Ultra Thin', 'protective-case-for-iphone-3g-black-ultra-thin', 885, '', 'product.jpg', 3, NULL, NULL, NULL),
(10959, 'Sleeve case Capdase Callid iPhone 3G/3GS (white)', 'sleeve-case-capdase-callid-iphone-3g-3gs-white', 885, '', 'product.jpg', 14, NULL, NULL, NULL),
(10960, 'Sleeve case Capdase Callid iPhone 3G/3GS (red)', 'sleeve-case-capdase-callid-iphone-3g-3gs-red', 885, '', 'product.jpg', 13, NULL, NULL, NULL),
(9194, 'Sleeve сase iPhone 4 (black)', 'sleeve-sase-iphone-4-black', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'product.jpg', 2, NULL, NULL, NULL),
(9439, 'Capdase Soft Jacket 2 Xpose iPhone 4 (black) (силиконовый)', 'capdase-soft-jacket-2-xpose-iphone-4-black-silikonovyy', 886, 'чехол +мягкий чехол+подставка+защитная плёнка', 'product.jpg', 9, NULL, NULL, NULL),
(9441, 'Capdase Alumor Metal Case iPhone 4 (black-pink)', 'capdase-alumor-metal-case-iphone-4-black-pink', 886, '', 'product.jpg', 11, NULL, NULL, NULL),
(9442, 'Bumper case iPhone 4 high copy (black)', 'bumper-case-iphone-4-high-copy-black', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(9443, 'Bumper case iPhone 4 (purple)', 'bumper-case-iphone-4-purple', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(9444, 'Belkin Sleeve case iPhone 4 (white) (силиконовый)', 'belkin-sleeve-case-iphone-4-white-silikonovyy', 886, 'чехол силиконовый', 'product.jpg', 6.5, NULL, NULL, NULL),
(9445, 'Crystal hard back case iPhone 4 (black)', 'crystal-hard-back-case-iphone-4-black', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(9503, 'Dual SIM Card for iPhone 4 (black) Back Cover 2 in 1', 'dual-sim-card-for-iphone-4-black-back-cover-2-in-1', 886, 'переходник с задней крышкой на 2 сим карты ', 'product.jpg', 16, NULL, NULL, NULL),
(9518, 'Crystal hard back case iPhone 4 clear (white)', 'crystal-hard-back-case-iphone-4-clear-white', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(9522, 'Dual SIM Card for iPhone 4 (black) Back Cover 3 in 1', 'dual-sim-card-for-iphone-4-black-back-cover-3-in-1', 886, 'переходник с задней крышкой на 3 сим карты', 'product.jpg', 16, NULL, NULL, NULL),
(9565, 'Belkin Shield Eclipse for iPhone 4 (black-white) (силиконовый)', 'belkin-shield-eclipse-for-iphone-4-black-white-silikonovyy', 886, 'чехол силиконовый', 'product.jpg', 6, NULL, NULL, NULL),
(9571, 'Capdase Leather Case Forme Capparel iPhone 4/4S (black) (кожаный)', 'capdase-leather-case-forme-capparel-iphone-4-4s-black-kozhanyy', 886, 'чехол', 'product.jpg', 19, NULL, NULL, NULL),
(9647, 'Moshi Hard Case For iPhone 4 (black)', 'moshi-hard-case-for-iphone-4-black', 886, 'чехол', 'product.jpg', 5, NULL, NULL, NULL),
(9699, 'ILUV Sentinel Metallic Case for iPhone 4 (bronze)', 'iluv-sentinel-metallic-case-for-iphone-4-bronze', 886, 'пластиковый чехол', 'product.jpg', 3, NULL, NULL, NULL),
(9960, 'Capdase Smart Pocket Value Set Callid Bold+Soft Jacket Xpose For iPhone 4 (black)', 'capdase-smart-pocket-value-set-callid-bold-soft-jacket-xpose-for-iphone-4-black', 886, '', 'product.jpg', 29, NULL, NULL, NULL),
(10017, 'Compact Dual USB Charger for iPod/iPhone Griffin', 'compact-dual-usb-charger-for-ipod-iphone-griffin', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(10398, 'Capdase Smart Pocket Callid Dot  iPhone 4/4S (white)', 'capdase-smart-pocket-callid-dot-iphone-4-4s-white', 886, '', 'product.jpg', 19, NULL, NULL, NULL),
(10455, 'Epoxy Sticker iPhone 4', 'epoxy-sticker-iphone-4', 886, 'наклейки', 'product.jpg', 2, NULL, NULL, NULL),
(10554, 'Steven Paul Jobs case iPhone 4/4S', 'steven-paul-jobs-case-iphone-4-4s', 886, '', 'product.jpg', 3, NULL, NULL, NULL),
(10872, 'Crystal case iGlaze iPhone 4 (white)', 'crystal-case-iglaze-iphone-4-white', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(10873, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (black-clear)', 'capdase-soft-jacket-fuze-ds-iphone-4-4s-black-clear', 886, '<p>\r\n	чехол +мягкий чехол+подставка+защитная плёнка</p>\r\n', 'product.jpg', 10, NULL, NULL, NULL),
(10874, 'Crystal case Tenacity iPhone 4/4S (pink)', 'crystal-case-tenacity-iphone-4-4s-pink', 886, '', 'product.jpg', 6, NULL, NULL, NULL),
(10875, 'товар крутой', 'tovar-krutoy', 886, '<h2 style=\"font-style:italic\"><em><strong>hello ,Dolly</strong><strong>!!</strong></em></h2>\r\n', 'product.jpg', 8, NULL, NULL, NULL),
(10967, 'Belkin Shield Eclipse for iPhone 4 (red-white) (силиконовый)', 'belkin-shield-eclipse-for-iphone-4-red-white-silikonovyy', 886, '<p>\r\n	чехол силиконовый</p>\r\n', 'product.jpg', 6, NULL, NULL, NULL),
(10968, 'Belkin Shield Eclipse for iPhone 4 (grey-white) (силиконовый)', 'belkin-shield-eclipse-for-iphone-4-grey-white-silikonovyy', 886, 'чехол силиконовый', 'product.jpg', 6, NULL, NULL, NULL),
(10970, 'Belkin Sleeve case iPhone 4 (smoky) (силиконовый)', 'belkin-sleeve-case-iphone-4-smoky-silikonovyy', 886, '<p>\r\n	чехол силиконовый</p>\r\n', 'product.jpg', 6.5, NULL, NULL, NULL),
(10971, 'Bumper case iPhone 4 (clear)', 'bumper-case-iphone-4-clear', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(10972, 'Bumper case iPhone 4 (blue)', 'bumper-case-iphone-4-blue', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(10974, 'Bumper case iPhone 4 (red)', 'bumper-case-iphone-4-red', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(10985, 'Bumper case iPhone 4 high copy (white)', 'bumper-case-iphone-4-high-copy-white', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(10986, 'Bumper case iPhone 4 high copy (orange)', 'bumper-case-iphone-4-high-copy-orange', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(10987, 'Bumper case iPhone 4 high copy (pink)', 'bumper-case-iphone-4-high-copy-pink', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(10988, 'Bumper case iPhone 4 high copy (blue)', 'bumper-case-iphone-4-high-copy-blue', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(10992, 'Capdase Smart Pocket Callid iPhone 4/4S (white)', 'capdase-smart-pocket-callid-iphone-4-4s-white', 886, '<p>\r\n	кожаный чехол с прорезью</p>\r\n', 'product.jpg', 19, NULL, NULL, NULL),
(10995, 'Capdase Smart Pocket Value Set Callid Bold+Soft Jacket Xpose For iPhone 4 (red)', 'capdase-smart-pocket-value-set-callid-bold-soft-jacket-xpose-for-iphone-4-red', 886, '', 'product.jpg', 29, NULL, NULL, NULL),
(10998, 'Capdase Soft Jacket 2 Xpose iPhone 4 (white) (силиконовый)', 'capdase-soft-jacket-2-xpose-iphone-4-white-silikonovyy', 886, '<p>\r\n	чехол +мягкий чехол+подставка+защитная плёнка</p>\r\n', 'product.jpg', 9, NULL, NULL, NULL),
(10999, 'Crystal hard back case iPhone 4 (blue)', 'crystal-hard-back-case-iphone-4-blue', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11001, 'Crystal hard back case iPhone 4 (pink)', 'crystal-hard-back-case-iphone-4-pink', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11002, 'Crystal hard back case iPhone 4 (red)', 'crystal-hard-back-case-iphone-4-red', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11003, 'Crystal hard back case iPhone 4 (light blue)', 'crystal-hard-back-case-iphone-4-light-blue', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11005, 'Crystal hard back case iPhone 4 (silver)', 'crystal-hard-back-case-iphone-4-silver', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11006, 'Crystal hard back case iPhone 4 (white)', 'crystal-hard-back-case-iphone-4-white', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11007, 'Crystal hard back case iPhone 4 clear (black)', 'crystal-hard-back-case-iphone-4-clear-black', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11008, 'ILUV Sentinel Metallic Case for iPhone 4 (silver)', 'iluv-sentinel-metallic-case-for-iphone-4-silver', 886, '<p>\r\n	пластиковый чехол</p>\r\n', 'product.jpg', 3, NULL, NULL, NULL),
(11009, 'ILUV Sentinel Metallic Case for iPhone 4 (grey)', 'iluv-sentinel-metallic-case-for-iphone-4-grey', 886, '<p>\r\n	пластиковый чехол</p>\r\n', 'product.jpg', 3, NULL, NULL, NULL),
(11010, 'ILUV Sentinel Metallic Case for iPhone 4 (gold)', 'iluv-sentinel-metallic-case-for-iphone-4-gold', 886, '<p>\r\n	пластиковый чехол</p>\r\n', 'product.jpg', 3, NULL, NULL, NULL),
(11011, 'Moshi Hard Case For iPhone 4 (white)', 'moshi-hard-case-for-iphone-4-white', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11013, 'Moshi Hard Case For iPhone 4 (red)', 'moshi-hard-case-for-iphone-4-red', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11014, 'Moshi Hard Case For iPhone 4 (blue)', 'moshi-hard-case-for-iphone-4-blue', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11017, 'Capdase Alumor Metal Case iPhone 4 (black-blue)', 'capdase-alumor-metal-case-iphone-4-black-blue', 886, '', 'product.jpg', 11, NULL, NULL, NULL),
(11018, 'Capdase Alumor Metal Case iPhone 4 (black)', 'capdase-alumor-metal-case-iphone-4-black', 886, '', 'product.jpg', 11, NULL, NULL, NULL),
(11019, 'Capdase Alumor Metal Case iPhone 4 (mirror-black)', 'capdase-alumor-metal-case-iphone-4-mirror-black', 886, '', 'product.jpg', 11, NULL, NULL, NULL),
(11020, 'Bumper hard plastic case ', 'bumper-hard-plastic-case', 886, '', 'product.jpg', 8, NULL, NULL, NULL),
(11023, 'Bumper hard plastic case Vser iPhone 4/4S (blue-white)', 'bumper-hard-plastic-case-vser-iphone-4-4s-blue-white', 886, '', 'product.jpg', 8, NULL, NULL, NULL),
(11024, 'Bumper hard plastic case Vser iPhone 4/4S (green-white)', 'bumper-hard-plastic-case-vser-iphone-4-4s-green-white', 886, '', 'product.jpg', 8, NULL, NULL, NULL),
(11025, 'Bumper hard plastic case Vser iPhone 4/4S (white-clear)', 'bumper-hard-plastic-case-vser-iphone-4-4s-white-clear', 886, '', 'product.jpg', 8, NULL, NULL, NULL),
(11030, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (blue-clear)', 'capdase-soft-jacket-fuze-ds-iphone-4-4s-blue-clear', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(11031, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (green-clear)', 'capdase-soft-jacket-fuze-ds-iphone-4-4s-green-clear', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(11033, 'Capdase Soft Jacket Fuze DS iPhone 4/4S (yellow-clear)', 'capdase-soft-jacket-fuze-ds-iphone-4-4s-yellow-clear', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(11035, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (orange)', 'crystal-case-e-l-grande-iphone-4-4s-0-3mm-orange', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11036, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (grey)', 'crystal-case-e-l-grande-iphone-4-4s-0-3mm-grey', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11037, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (white)', 'crystal-case-e-l-grande-iphone-4-4s-0-3mm-white', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11038, 'Crystal case E.L.Grande iPhone 4/4S 0,3mm (pink)', 'crystal-case-e-l-grande-iphone-4-4s-0-3mm-pink', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(11039, 'Crystal case Tenacity iPhone 4/4S (white)', 'crystal-case-tenacity-iphone-4-4s-white', 886, '', 'product.jpg', 6, NULL, NULL, NULL),
(11040, 'Crystal case Tenacity iPhone 4/4S (lime)', 'crystal-case-tenacity-iphone-4-4s-lime', 886, '', 'product.jpg', 6, NULL, NULL, NULL),
(11041, 'Crystal case iGlaze iPhone 4 (smoky)', 'crystal-case-iglaze-iphone-4-smoky', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(11042, 'Crystal case iGlaze iPhone 4 (black)', 'crystal-case-iglaze-iphone-4-black', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(11043, 'Crystal case \"iGlaze\" iPhone 4 (pink)', 'crystal-case-iglaze-iphone-4-pink', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(11044, 'Crystal case iGlaze iPhone 4 (purple)', 'crystal-case-iglaze-iphone-4-purple', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(11045, 'Crystal case iGlaze iPhone 4 (green)', 'crystal-case-iglaze-iphone-4-green', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(11046, 'Crystal case iGlaze iPhone 4 (yellow)', 'crystal-case-iglaze-iphone-4-yellow', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(11047, 'Crystal case iGlaze iPhone 4 (blue)', 'crystal-case-iglaze-iphone-4-blue', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(11048, 'Sleeve сase iPhone 4 (white)', 'sleeve-sase-iphone-4-white', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'product.jpg', 2, NULL, NULL, NULL),
(11049, 'Sleeve сase iPhone 4 (pink)', 'sleeve-sase-iphone-4-pink', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'product.jpg', 2, NULL, NULL, NULL),
(11050, 'Sleeve сase iPhone 4 (violet)', 'sleeve-sase-iphone-4-violet', 886, '<p>\r\n	силиконовый чехол</p>\r\n', 'product.jpg', 2, NULL, NULL, NULL),
(11052, 'Capdase Smart Pocket Callid Dot  iPhone 4/4S (blue)', 'capdase-smart-pocket-callid-dot-iphone-4-4s-blue', 886, '', 'product.jpg', 19, NULL, NULL, NULL),
(11276, 'Crystal case Tenacity iPhone 4/4S (grey)', 'crystal-case-tenacity-iphone-4-4s-grey', 886, '', 'product.jpg', 6, NULL, NULL, NULL),
(11523, 'Capdase Alumor Metal Case iPhone 4 (mirror-purple)', 'capdase-alumor-metal-case-iphone-4-mirror-purple', 886, '', 'product.jpg', 11, NULL, NULL, NULL),
(11538, 'Moshi Concerti for iPhone 4/4S (black)', 'moshi-concerti-for-iphone-4-4s-black', 886, '', 'product.jpg', 29, NULL, NULL, NULL),
(11607, 'Capdase Leather Case Forme Capparel iPhone 4/4S (white) (кожаный)', 'capdase-leather-case-forme-capparel-iphone-4-4s-white-kozhanyy', 886, 'чехол', 'product.jpg', 19, NULL, NULL, NULL),
(11633, 'HOCO Open Face Case iPhone 4/4S (black) ', 'hoco-open-face-case-iphone-4-4s-black', 886, '<p>\r\n	задняя накладка + пленка</p>\r\n', 'product.jpg', 12, NULL, NULL, NULL),
(11634, 'HOCO Open Face Case iPhone 4/4S (black-red) ', 'hoco-open-face-case-iphone-4-4s-black-red', 886, 'задняя накладка + пленка', 'product.jpg', 12, NULL, NULL, NULL),
(11635, 'HOCO Open Face Case iPhone 4/4S (white) ', 'hoco-open-face-case-iphone-4-4s-white', 886, 'задняя накладка + пленка', 'product.jpg', 12, NULL, NULL, NULL),
(11636, 'HOCO Open Face Case iPhone 4/4S (red) ', 'hoco-open-face-case-iphone-4-4s-red', 886, '<p>\r\n	задняя накладка + пленка</p>\r\n', 'product.jpg', 12, NULL, NULL, NULL),
(11637, 'HOCO Open Face Case iPhone 4/4S (pink) ', 'hoco-open-face-case-iphone-4-4s-pink', 886, '<p>\r\n	задняя накладка + пленка</p>\r\n', 'product.jpg', 12, NULL, NULL, NULL),
(11638, 'HOCO Duke Advanced Leather Case for iPhone 4/4S (white)', 'hoco-duke-advanced-leather-case-for-iphone-4-4s-white', 886, '', 'product.jpg', 18, NULL, NULL, NULL),
(11639, 'HOCO Duke Advanced Leather Case for iPhone 4/4S (pink)', 'hoco-duke-advanced-leather-case-for-iphone-4-4s-pink', 886, '', 'product.jpg', 18, NULL, NULL, NULL),
(11640, 'HOCO Leather case Earl fashion for IPhone 4/4S (black)', 'hoco-leather-case-earl-fashion-for-iphone-4-4s-black', 886, 'кожа', 'product.jpg', 19, NULL, NULL, NULL),
(11641, 'HOCO Leather case Earl fashion for IPhone 4/4S (pink)', 'hoco-leather-case-earl-fashion-for-iphone-4-4s-pink', 886, 'кожа', 'product.jpg', 19, NULL, NULL, NULL),
(11642, 'HOCO Leather case Earl fashion for IPhone 4/4S (red)', 'hoco-leather-case-earl-fashion-for-iphone-4-4s-red', 886, 'кожа', 'product.jpg', 19, NULL, NULL, NULL),
(11643, 'HOCO Leather case Earl fashion for IPhone 4/4S (white)', 'hoco-leather-case-earl-fashion-for-iphone-4-4s-white', 886, 'кожа', 'product.jpg', 19, NULL, NULL, NULL),
(11644, 'HOCO Leather case Marquess Classic for IPhone 4/4S (black)', 'hoco-leather-case-marquess-classic-for-iphone-4-4s-black', 886, 'кожаный чехол с прорезью', 'product.jpg', 20, NULL, NULL, NULL),
(11645, 'HOCO Leather case Marquess Classic for IPhone 4/4S (pink)', 'hoco-leather-case-marquess-classic-for-iphone-4-4s-pink', 886, 'кожаный чехол с прорезью', 'product.jpg', 20, NULL, NULL, NULL),
(11647, 'DiscoveryBuy leather case for iPhone 4/4S (black)', 'discoverybuy-leather-case-for-iphone-4-4s-black', 886, '', 'product.jpg', 17, NULL, NULL, NULL),
(11648, 'DiscoveryBuy leather back cover for iPhone 4/4S (white)', 'discoverybuy-leather-back-cover-for-iphone-4-4s-white', 886, '', 'product.jpg', 17, NULL, NULL, NULL),
(11649, 'DiscoveryBuy leather back cover for iPhone 4/4S (pink)', 'discoverybuy-leather-back-cover-for-iphone-4-4s-pink', 886, '', 'product.jpg', 17, NULL, NULL, NULL);
INSERT INTO `products` (`id`, `title`, `alias`, `parent`, `content`, `image`, `price`, `m_title`, `m_desc`, `m_keys`) VALUES
(11686, 'Capdase Soft Jacket 2 Xpose iPhone 4 (black-diamond) (силиконовый)', 'capdase-soft-jacket-2-xpose-iphone-4-black-diamond-silikonovyy', 886, '<p>\r\n	чехол +мягкий чехол+подставка+защитная плёнка</p>\r\n', 'product.jpg', 9, NULL, NULL, NULL),
(12068, 'Moshi Concerti for iPhone 4/4S (red)', 'moshi-concerti-for-iphone-4-4s-red', 886, '', 'product.jpg', 29, NULL, NULL, NULL),
(12069, 'Moshi iGlaze Kameleon for iPhone 4/4S (black)', 'moshi-iglaze-kameleon-for-iphone-4-4s-black', 886, 'leather shell case (кожа)', 'product.jpg', 23, NULL, NULL, NULL),
(12070, 'Moshi iGlaze Kameleon for iPhone 4/4S (white)', 'moshi-iglaze-kameleon-for-iphone-4-4s-white', 886, 'leather shell case (кожа)', 'product.jpg', 23, NULL, NULL, NULL),
(12071, 'Moshi iGlaze snap on case for iPhone 4/4S (silver)', 'moshi-iglaze-snap-on-case-for-iphone-4-4s-silver', 886, '', 'product.jpg', 23, NULL, NULL, NULL),
(12072, 'Moshi iGlaze snap on case for iPhone 4/4S (red)', 'moshi-iglaze-snap-on-case-for-iphone-4-4s-red', 886, '', 'product.jpg', 23, NULL, NULL, NULL),
(12073, 'Moshi iGlaze snap on case for iPhone 4/4S (black)', 'moshi-iglaze-snap-on-case-for-iphone-4-4s-black', 886, '', 'product.jpg', 23, NULL, NULL, NULL),
(12085, 'HOCO Open Face Case iPhone 4/4S (white-red)', 'hoco-open-face-case-iphone-4-4s-white-red', 886, '', 'product.jpg', 12, NULL, NULL, NULL),
(12086, 'HOCO Open Face Case iPhone 4/4S (purple) ', 'hoco-open-face-case-iphone-4-4s-purple', 886, '', 'product.jpg', 12, NULL, NULL, NULL),
(12129, 'Moshi iGlaze snap on case for iPhone 4/4S (red) copy', 'moshi-iglaze-snap-on-case-for-iphone-4-4s-red-copy', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(12131, 'Rhombic Case for iPhone 4/4S Chanel (black)', 'rhombic-case-for-iphone-4-4s-chanel-black', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(12133, 'Rhombic Case for iPhone 4/4S Chanel (pink)', 'rhombic-case-for-iphone-4-4s-chanel-pink', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(12205, 'Button Stickers for iPhone/iPod/iPad', 'button-stickers-for-iphone-ipod-ipad', 886, 'наклейки на кнопку Home', 'product.jpg', 1.8, NULL, NULL, NULL),
(12353, 'Capdase Upper Polka iPhone 4/4S (white)', 'capdase-upper-polka-iphone-4-4s-white', 886, 'чехол из кожзаменителя  тип чехла флип-топ', 'product.jpg', 18, NULL, NULL, NULL),
(12355, 'Borofone Explorer Leather Case for iPhone 4/4S (grey)', 'borofone-explorer-leather-case-for-iphone-4-4s-grey', 886, '', 'product.jpg', 15, NULL, NULL, NULL),
(12365, 'Moshi iGlaze snap on case for iPhone 4/4S (black) copy', 'moshi-iglaze-snap-on-case-for-iphone-4-4s-black-copy', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(12406, 'HOCO Duke Advanced Leather Case for iPhone 4/4S (black)', 'hoco-duke-advanced-leather-case-for-iphone-4-4s-black', 886, '', 'product.jpg', 18, NULL, NULL, NULL),
(12482, 'SUPER Case for iPhone 4/4S (black)', 'super-case-for-iphone-4-4s-black', 886, '', 'product.jpg', 12, NULL, NULL, NULL),
(12483, 'SUPER Case for iPhone 4/4S (white)', 'super-case-for-iphone-4-4s-white', 886, '', 'product.jpg', 12, NULL, NULL, NULL),
(12484, 'SUPER Case for iPhone 4/4S (red)', 'super-case-for-iphone-4-4s-red', 886, '', 'product.jpg', 12, NULL, NULL, NULL),
(12485, 'SUPER Case for iPhone 4/4S (grey)', 'super-case-for-iphone-4-4s-grey', 886, '', 'product.jpg', 12, NULL, NULL, NULL),
(13143, 'Чехол MissCase для iPhone 4/4S (purple)', 'chehol-misscase-dlya-iphone-4-4s-purple', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'product.jpg', 5, NULL, NULL, NULL),
(13144, 'Чехол MissCase для iPhone 4/4S (green)', 'chehol-misscase-dlya-iphone-4-4s-green', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'product.jpg', 5, NULL, NULL, NULL),
(13176, 'Чехол-накладка c шипами на iPhone 4/4S (чёрный /шипы серебристые)', 'chehol-nakladka-c-shipami-na-iphone-4-4s-chernyy-shipy-serebristye', 886, '', 'product.jpg', 4, NULL, NULL, NULL),
(13177, 'Чехол радужный для iPhone 4/4S (белый)', 'chehol-raduzhnyy-dlya-iphone-4-4s-belyy', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(13188, 'Чехол MissCase для iPhone 4/4S (pink)', 'chehol-misscase-dlya-iphone-4-4s-pink', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'product.jpg', 5, NULL, NULL, NULL),
(13190, 'Чехол MissCase для iPhone 4/4S (blue)', 'chehol-misscase-dlya-iphone-4-4s-blue', 886, 'MissCase на iPhone 5 в виде узоров, oчень популярные и красивые декоративные чехлы выполненные в виде кружева, нежного, легкого и очень женственного', 'product.jpg', 5, NULL, NULL, NULL),
(13358, 'Ferrari Leather Hard case iPhone 4/4S (black)', 'ferrari-leather-hard-case-iphone-4-4s-black', 886, '', 'product.jpg', 19, NULL, NULL, NULL),
(13359, 'Griffin Elan Form case iPhone 4 (black)', 'griffin-elan-form-case-iphone-4-black', 886, '', 'product.jpg', 8, NULL, NULL, NULL),
(13376, 'Moshi Hard Case For iPhone 4 (pink)', 'moshi-hard-case-for-iphone-4-pink', 886, '', 'product.jpg', 5, NULL, NULL, NULL),
(13571, 'Чехол на iPhone 4/4S прозрачный с чёрным бампером ', 'chehol-na-iphone-4-4s-prozrachnyy-s-chernym-bamperom', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(13572, 'Чехол на iPhone 4/4S прозрачный с белым бампером ', 'chehol-na-iphone-4-4s-prozrachnyy-s-belym-bamperom', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(13573, 'Чехол на iPhone 4/4S прозрачный с салатовым бампером ', 'chehol-na-iphone-4-4s-prozrachnyy-s-salatovym-bamperom', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(13574, 'Чехол на iPhone 4/4S прозрачный с оранжевым бампером ', 'chehol-na-iphone-4-4s-prozrachnyy-s-oranzhevym-bamperom', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(13575, 'Чехол на iPhone 4/4S прозрачный с розовым бампером ', 'chehol-na-iphone-4-4s-prozrachnyy-s-rozovym-bamperom', 886, '', 'product.jpg', 7, NULL, NULL, NULL),
(13595, 'Чехол-накладка на iPhone 4/4S чёрный с разноцветными камнями (в квадратик)', 'chehol-nakladka-na-iphone-4-4s-chernyy-s-raznocvetnymi-kamnyami-v-kvadratik', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(13596, 'Чехол-накладка на iPhone 4/4S белый с разноцветными камнями (в квадратик)', 'chehol-nakladka-na-iphone-4-4s-belyy-s-raznocvetnymi-kamnyami-v-kvadratik', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(13597, 'Чехол-накладка на iPhone 4/4S чёрный с разноцветными камнями (дуга)', 'chehol-nakladka-na-iphone-4-4s-chernyy-s-raznocvetnymi-kamnyami-duga', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(13598, 'Чехол-накладка на iPhone 4/4S чёрный с разноцветными камнями (абстракция)', 'chehol-nakladka-na-iphone-4-4s-chernyy-s-raznocvetnymi-kamnyami-abstrakciya', 886, '', 'product.jpg', 13, NULL, NULL, NULL),
(9390, 'Перчатки для iPhone/iPad (black, white, brown, grey)', 'perchatki-dlya-iphone-ipad-black-white-brown-grey', 887, 'Мягкие и теплые перчатки позволят вам пользоваться вашим iPhone, iPad или любым другим сенсорным мультимедийным устройством, сохраняя ваши руки в тепле.', 'product.jpg', 2, NULL, NULL, NULL),
(12661, 'HOCO Duke Leather Case iPhone 5 (pink)', 'hoco-duke-leather-case-iphone-5-pink', 887, 'кожаный чехол-книжка HOCO, присутствуют все вырезы под камеру, нижний динамик, кнопки регулировки громкости, откидная крышка чехла фиксируется на специальный зажим, внутри чехол обшит замшей', 'product.jpg', 20, NULL, NULL, NULL),
(12662, 'HOCO Duke Leather Case iPhone 5 (black)', 'hoco-duke-leather-case-iphone-5-black', 887, 'кожаный чехол-книжка HOCO, присутствуют все вырезы под камеру, нижний динамик, кнопки регулировки громкости, откидная крышка чехла фиксируется на специальный зажим, внутри чехол обшит замшей', 'product.jpg', 20, NULL, NULL, NULL),
(12663, 'HOCO Duke Leather Case iPhone 5 (white)', 'hoco-duke-leather-case-iphone-5-white', 887, 'кожаный чехол-книжка HOCO, присутствуют все вырезы под камеру, нижний динамик, кнопки регулировки громкости, откидная крышка чехла фиксируется на специальный зажим, внутри чехол обшит замшей', 'product.jpg', 20, NULL, NULL, NULL),
(12664, 'ROCK Case Eternal iPhone 5 (black)', 'rock-case-eternal-iphone-5-black', 887, '', 'product.jpg', 17, NULL, NULL, NULL),
(12665, 'ROCK Case Eternal iPhone 5 (green)', 'rock-case-eternal-iphone-5-green', 887, '', 'product.jpg', 17, NULL, NULL, NULL),
(12810, 'Bumper case iPhone 5 (black)', 'bumper-case-iphone-5-black', 887, 'Бампер на iPhone 5 чёрный', 'product.jpg', 11, NULL, NULL, NULL),
(12811, 'Bumper case iPhone 5 (white)', 'bumper-case-iphone-5-white', 887, 'Бампер на iPhone 5 белый', 'product.jpg', 12, NULL, NULL, NULL),
(12812, 'Bumper case iPhone 5 (pink)', 'bumper-case-iphone-5-pink', 887, 'Бампер на iPhone 5 розовый', 'product.jpg', 11, NULL, NULL, NULL),
(12885, 'Moshi hard shell case iPhone 5 (black)', 'moshi-hard-shell-case-iphone-5-black', 887, 'Чехол - накладка для iPhone 5', 'product.jpg', 8, NULL, NULL, NULL),
(12886, 'Moshi hard shell case iPhone 5 (white)', 'moshi-hard-shell-case-iphone-5-white', 887, 'Чехол - накладка для iPhone 5', 'product.jpg', 8, NULL, NULL, NULL),
(12887, 'Moshi hard shell case iPhone 5 (pink)', 'moshi-hard-shell-case-iphone-5-pink', 887, 'Чехол - накладка для iPhone 5', 'product.jpg', 8, NULL, NULL, NULL),
(13170, 'Чехол c шипами для iPhone 5 (тигровый)', 'chehol-c-shipami-dlya-iphone-5-tigrovyy', 887, 'пластиковый с наклеянной кожей', 'product.jpg', 8, NULL, NULL, NULL),
(12920, 'HandsFree iPhone 5 EarPod original', 'handsfree-iphone-5-earpod-original', 887, 'наушники оригинальные', 'product.jpg', 28, NULL, NULL, NULL),
(12948, 'ROCK Case Eternal iPhone 5 (orange)', 'rock-case-eternal-iphone-5-orange', 887, '', 'product.jpg', 17, NULL, NULL, NULL),
(12949, 'HOCO Lizard Leather Case iPhone 5 (black)', 'hoco-lizard-leather-case-iphone-5-black', 887, 'кожаный чехол - книжки , серии Royal, линейка Lizard выполнены из телячьей кожи, в стиле кожи ящерицы путем искусственного рифления, внутренняя отделка чехлов замшей, края и технологические отверстия чехла дополнительно обработаны спайкой, используется кл', 'product.jpg', 21, NULL, NULL, NULL),
(12950, 'HOCO Lizard Leather Case iPhone 5 (white)', 'hoco-lizard-leather-case-iphone-5-white', 887, 'кожаный чехол - книжки , серии Royal, линейка Lizard выполнены из телячьей кожи, в стиле кожи ящерицы путем искусственного рифления, внутренняя отделка чехлов замшей, края и технологические отверстия чехла дополнительно обработаны спайкой, используется кл', 'product.jpg', 21, NULL, NULL, NULL),
(12951, 'HOCO Lizard Leather Case iPhone 5 (pink)', 'hoco-lizard-leather-case-iphone-5-pink', 887, 'кожаный чехол - книжки , серии Royal, линейка Lizard выполнены из телячьей кожи, в стиле кожи ящерицы путем искусственного рифления, внутренняя отделка чехлов замшей, края и технологические отверстия чехла дополнительно обработаны спайкой, используется кл', 'product.jpg', 21, NULL, NULL, NULL),
(12952, 'HOCO Protection Case iPhone 5 (black)', 'hoco-protection-case-iphone-5-black', 887, 'кожаная чехол-накладка Нoco на заднюю панель', 'product.jpg', 17, NULL, NULL, NULL),
(12953, 'HOCO Protection Case iPhone 5 (white)', 'hoco-protection-case-iphone-5-white', 887, 'кожаная чехол-накладка Нoco на заднюю панель', 'product.jpg', 17, NULL, NULL, NULL),
(12954, 'HOCO Protection Case iPhone 5 (pink)', 'hoco-protection-case-iphone-5-pink', 887, 'кожаная чехол-накладка Нoco на заднюю панель', 'product.jpg', 17, NULL, NULL, NULL),
(13047, 'Case for iPhone 5 0,3mm (clear)', 'case-for-iphone-5-0-3mm-clear', 887, 'Ультратонкий пластиковый чехол на iPhone 5 прозрачный', 'product.jpg', 9, NULL, NULL, NULL),
(13048, 'Case for iPhone 5 0,3mm (black)', 'case-for-iphone-5-0-3mm-black', 887, 'Ультратонкий пластиковый чехол на iPhone 5 чёрный', 'product.jpg', 9, NULL, NULL, NULL),
(13149, 'Чехол Marc Jacobs kisses для iPhone 5 (black)', 'chehol-marc-jacobs-kisses-dlya-iphone-5-black', 887, 'Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений', 'product.jpg', 10, NULL, NULL, NULL),
(13151, 'Чехол Marc Jacobs kisses для iPhone 5 (silver)', 'chehol-marc-jacobs-kisses-dlya-iphone-5-silver', 887, '<p>\r\n	Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений</p>\r\n', 'product.jpg', 10, NULL, NULL, NULL),
(13153, 'Чехол Marc Jacobs резиновый с буквами для iPhone 5 (black)', 'chehol-marc-jacobs-rezinovyy-s-bukvami-dlya-iphone-5-black', 887, 'Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений', 'product.jpg', 12, NULL, NULL, NULL),
(13155, 'Чехол Marc Jacobs резиновый с буквами для iPhone 5 (yellow)', 'chehol-marc-jacobs-rezinovyy-s-bukvami-dlya-iphone-5-yellow', 887, 'Case Marc by Marc Jacobs - чехол для iPhone 5 с изысканным рисунком от одного из законодателей современной моды Марка Джейкобса. Чехол подчеркнёт Вашу индивидуальность и выделит Ваш гаджет из толпы других. При этом он надежно защитит iPhone от повреждений', 'product.jpg', 12, NULL, NULL, NULL),
(13159, 'Чехол с черепами для iPhone 5 (чёрный /черепа серебристые)', 'chehol-s-cherepami-dlya-iphone-5-chernyy-cherepa-serebristye', 887, 'пластиковый с наклеянной кожей', 'product.jpg', 15, NULL, NULL, NULL),
(13161, 'Чехол с шипами крестом для iPhone 5 (черный/шипы золотистые)', 'chehol-s-shipami-krestom-dlya-iphone-5-chernyy-shipy-zolotistye', 887, 'пластиковый с наклеянной кожей', 'product.jpg', 8, NULL, NULL, NULL),
(13162, 'Чехол с шипами крестом для iPhone 5 (розовый/шипы серебристые)', 'chehol-s-shipami-krestom-dlya-iphone-5-rozovyy-shipy-serebristye', 887, 'пластиковый с наклеянной кожей', 'product.jpg', 8, NULL, NULL, NULL),
(13163, 'Чехол с шипами крестом для iPhone 5 (белый/шипы серебристые)', 'chehol-s-shipami-krestom-dlya-iphone-5-belyy-shipy-serebristye', 887, 'пластиковый с наклеянной кожей', 'product.jpg', 8, NULL, NULL, NULL),
(13164, 'Чехол с шипами крестом для iPhone 5 (английский флаг/шипы серебристые)', 'chehol-s-shipami-krestom-dlya-iphone-5-angliyskiy-flag-shipy-serebristye', 887, 'пластиковый с наклеянной кожей', 'product.jpg', 8, NULL, NULL, NULL),
(13167, 'Чехол для iPhone 5 радужный (чёрный)', 'chehol-dlya-iphone-5-raduzhnyy-chernyy', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13171, 'Чехол для iPhone 5 радужный  (розовый)', 'chehol-dlya-iphone-5-raduzhnyy-rozovyy', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13172, 'Case for iPhone 5 0,3mm (pink)', 'case-for-iphone-5-0-3mm-pink', 887, 'Ультратонкий пластиковый чехол на iPhone 5 розовый', 'product.jpg', 9, NULL, NULL, NULL),
(13173, 'Case for iPhone 5 0,3mm (blue)', 'case-for-iphone-5-0-3mm-blue', 887, 'Ультратонкий пластиковый чехол на iPhone 5 голубой', 'product.jpg', 9, NULL, NULL, NULL),
(13174, 'Case for iPhone 5 0,3mm (green)', 'case-for-iphone-5-0-3mm-green', 887, 'Ультратонкий пластиковый чехол на iPhone 5 зелёный', 'product.jpg', 9, NULL, NULL, NULL),
(13187, 'HandsFree iPhone 5 EarPod', 'handsfree-iphone-5-earpod', 887, 'наушники', 'product.jpg', 13.7, NULL, NULL, NULL),
(13299, 'Чехол Swarovski для iPhone 5 (розовый)', 'chehol-swarovski-dlya-iphone-5-rozovyy', 887, '<p>\r\n	чехол-накладка пластиковый</p>\r\n', 'product.jpg', 19, NULL, NULL, NULL),
(13300, 'Чехол Swarovski для iPhone 5 (голубой)', 'chehol-swarovski-dlya-iphone-5-goluboy', 887, 'чехол-накладка пластиковый', 'product.jpg', 19, NULL, NULL, NULL),
(13301, 'Чехол Swarovski для iPhone 5 (бело-серебристый)', 'chehol-swarovski-dlya-iphone-5-belo-serebristyy', 887, '<p>\r\n	чехол-накладка пластиковый</p>\r\n', 'product.jpg', 19, NULL, NULL, NULL),
(13351, 'Чехол с шипами для iPhone 5 (белый)', 'chehol-s-shipami-dlya-iphone-5-belyy', 887, '<p>\r\n	пластиковый с наклеянной кожей</p>\r\n', 'product.jpg', 8, NULL, NULL, NULL),
(13353, 'Protective Case for iPhone 5 (grey-clear)', 'protective-case-for-iphone-5-grey-clear', 887, 'Жёсткий чехол-накладка прозрачно-серый', 'product.jpg', 10, NULL, NULL, NULL),
(13354, 'Protective Case for iPhone 5 (pink-clear)', 'protective-case-for-iphone-5-pink-clear', 887, 'Жёсткий чехол-накладка прозрачно-розовый', 'product.jpg', 10, NULL, NULL, NULL),
(13355, 'Protective Case for iPhone 5 (black-clear)', 'protective-case-for-iphone-5-black-clear', 887, 'Жёсткий чехол-накладка прозрачно-чёрный', 'product.jpg', 10, NULL, NULL, NULL),
(13356, 'Protective Case for iPhone 5 (white-clear)', 'protective-case-for-iphone-5-white-clear', 887, 'Жёсткий чехол-накладка прозрачно-белый', 'product.jpg', 10, NULL, NULL, NULL),
(13428, 'Чехол дополнительный аккумулятор для iPhone 5 \"Ferrari\" (чёрный)', 'chehol-dopolnitel-nyy-akkumulyator-dlya-iphone-5-ferrari-chernyy', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'product.jpg', 28, NULL, NULL, NULL),
(13429, 'Чехол дополнительный аккумулятор для iPhone 5 (серебристо-белый)', 'chehol-dopolnitel-nyy-akkumulyator-dlya-iphone-5-serebristo-belyy', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'product.jpg', 26, NULL, NULL, NULL),
(13430, 'Чехол дополнительный аккумулятор для iPhone 5 (чёрный)', 'chehol-dopolnitel-nyy-akkumulyator-dlya-iphone-5-chernyy', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'product.jpg', 26, NULL, NULL, NULL),
(13431, 'Чехол дополнительный аккумулятор для iPhone 5 \"Ferrari\" (серебристо-белый)', 'chehol-dopolnitel-nyy-akkumulyator-dlya-iphone-5-ferrari-serebristo-belyy', 887, 'Очень тонкий чехол BackUp с аккумулятором для iPhone 5,Ёмкость батареи: 2500 mAh,Время в режиме ожидания: до 280 часов, Время в режиме разговора: до 6 часов в 3G, до 10 часов в 2G.', 'product.jpg', 28, NULL, NULL, NULL),
(13491, 'Mophie Juice Pack Air iPhone 5 (чёрный)', 'mophie-juice-pack-air-iphone-5-chernyy', 887, '<p>\r\n	Чехол с дополнительным аккумулятором для iPhone 5 -это надежная защита и долгая работа вашего смартфона, есть индикатор заряда батареи, Материал: Поликарбонат</p>\r\n', 'product.jpg', 34, NULL, NULL, NULL),
(13492, 'Mophie Juice Pack Air iPhone 5 (белый)', 'mophie-juice-pack-air-iphone-5-belyy', 887, '<p>\r\n	Чехол с дополнительным аккумулятором для iPhone 5 -это надежная защита и долгая работа вашего смартфона, есть индикатор заряда батареи, Материал: Поликарбонат</p>\r\n', 'product.jpg', 34, NULL, NULL, NULL),
(13566, 'Чехол Swarovski для iPhone 5 (сыпучие камушки)', 'chehol-swarovski-dlya-iphone-5-sypuchie-kamushki', 887, '', 'product.jpg', 15, NULL, NULL, NULL),
(13570, 'Protective Case for iPhone 5 (red-clear)', 'protective-case-for-iphone-5-red-clear', 887, 'Жёсткий чехол-накладка прозрачно-красный', 'product.jpg', 10, NULL, NULL, NULL),
(13576, 'Чехол на iPhone 5 прозрачный с белым бампером ', 'chehol-na-iphone-5-prozrachnyy-s-belym-bamperom', 887, '', 'product.jpg', 8, NULL, NULL, NULL),
(13577, 'Чехол на iPhone 5 прозрачный с чёрным бампером ', 'chehol-na-iphone-5-prozrachnyy-s-chernym-bamperom', 887, '', 'product.jpg', 8, NULL, NULL, NULL),
(13578, 'Чехол на iPhone 5 прозрачный с голубым бампером ', 'chehol-na-iphone-5-prozrachnyy-s-golubym-bamperom', 887, '', 'product.jpg', 8, NULL, NULL, NULL),
(13579, 'Чехол на iPhone 5 прозрачный с салатовым бампером ', 'chehol-na-iphone-5-prozrachnyy-s-salatovym-bamperom', 887, '', 'product.jpg', 8, NULL, NULL, NULL),
(13580, 'Чехол на iPhone 5 прозрачный с розовым бампером ', 'chehol-na-iphone-5-prozrachnyy-s-rozovym-bamperom', 887, '', 'product.jpg', 8, NULL, NULL, NULL),
(13581, 'Чехол на iPhone 5 (жёлтый с двумя белыми полосами)', 'chehol-na-iphone-5-zheltyy-s-dvumya-belymi-polosami', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13582, 'Чехол на iPhone 5 (салатовый с двумя белыми полосами)', 'chehol-na-iphone-5-salatovyy-s-dvumya-belymi-polosami', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13583, 'Чехол на iPhone 5 с белой полосой синий', 'chehol-na-iphone-5-s-beloy-polosoy-siniy', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13584, 'Чехол на iPhone 5 с белой полосой розовый ', 'chehol-na-iphone-5-s-beloy-polosoy-rozovyy', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13585, 'Чехол на iPhone 5 с белой полосой бирюзовый ', 'chehol-na-iphone-5-s-beloy-polosoy-biryuzovyy', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13586, 'Чехол на iPhone 5 с белой полосой чёрный', 'chehol-na-iphone-5-s-beloy-polosoy-chernyy', 887, '', 'product.jpg', 9, NULL, NULL, NULL),
(13600, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (в полоску)', 'chehol-nakladka-na-iphone-5-chernyy-s-raznocvetnymi-kamnyami-v-polosku', 887, '', 'product.jpg', 13, NULL, NULL, NULL),
(13601, 'Чехол-накладка на iPhone 5 белый с разноцветными камнями (в полоску)', 'chehol-nakladka-na-iphone-5-belyy-s-raznocvetnymi-kamnyami-v-polosku', 887, '', 'product.jpg', 13, NULL, NULL, NULL),
(13602, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (дуга)', 'chehol-nakladka-na-iphone-5-chernyy-s-raznocvetnymi-kamnyami-duga', 887, '', 'product.jpg', 13, NULL, NULL, NULL),
(13603, 'Чехол-накладка на iPhone 5 белый с разноцветными камнями (дуга)', 'chehol-nakladka-na-iphone-5-belyy-s-raznocvetnymi-kamnyami-duga', 887, '', 'product.jpg', 13, NULL, NULL, NULL),
(13604, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (сердце)', 'chehol-nakladka-na-iphone-5-chernyy-s-raznocvetnymi-kamnyami-serdce', 887, '', 'product.jpg', 13, NULL, NULL, NULL),
(13605, 'Чехол-накладка на iPhone 5 белый с разноцветными камнями (сердце)', 'chehol-nakladka-na-iphone-5-belyy-s-raznocvetnymi-kamnyami-serdce', 887, '', 'product.jpg', 13, NULL, NULL, NULL),
(13606, 'Чехол-накладка на iPhone 5 чёрный с разноцветными камнями (купальник)', 'chehol-nakladka-na-iphone-5-chernyy-s-raznocvetnymi-kamnyami-kupal-nik', 887, '', 'product.jpg', 13, NULL, NULL, NULL),
(13607, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами (полоса горизонтальная)', 'chehol-na-iphone-5-swarovski-belyy-s-raznocvetnymi-kristallami-polosa-gorizontal-naya', 887, '', 'product.jpg', 25, NULL, NULL, NULL),
(13608, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами (полоса диагональ)', 'chehol-na-iphone-5-swarovski-belyy-s-raznocvetnymi-kristallami-polosa-diagonal', 887, '', 'product.jpg', 25, NULL, NULL, NULL),
(13609, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами (полоса зигзаг)', 'chehol-na-iphone-5-swarovski-belyy-s-raznocvetnymi-kristallami-polosa-zigzag', 887, '', 'product.jpg', 25, NULL, NULL, NULL),
(13610, 'Чехол на iPhone 5 Swarovski белый с разноцветными кристаллами и часами', 'chehol-na-iphone-5-swarovski-belyy-s-raznocvetnymi-kristallami-i-chasami', 887, '', 'product.jpg', 28, NULL, NULL, NULL),
(13611, 'Чехол на iPhone 5 Swarovski чёрный с разноцветными кристаллами и часами', 'chehol-na-iphone-5-swarovski-chernyy-s-raznocvetnymi-kristallami-i-chasami', 887, '', 'product.jpg', 28, NULL, NULL, NULL),
(8393, 'Cable USB iPhone/iPod', 'cable-usb-iphone-ipod', 888, '', 'product.jpg', 9, NULL, NULL, NULL),
(8552, 'Car kit iPhone 2G/3G + FM transmitter', 'car-kit-iphone-2g-3g-fm-transmitter', 888, 'Автомобильная зарядка с держателем для iPod\\iPhone с av передатчиком', 'product.jpg', 14, NULL, NULL, NULL),
(8660, 'Capdase Charger Dual USB Car & cable kit ', 'capdase-charger-dual-usb-car-cable-kit', 888, 'Комплект зарядных устройств на iPhone с кабелем.', 'product.jpg', 38, NULL, NULL, NULL),
(8661, 'Car kit Monster, iCar Changer inc.FM modulator', 'car-kit-monster-icar-changer-inc-fm-modulator', 888, 'Автомобильная зарядка с держателем для iPod\\iPhone с av передатчиком', 'product.jpg', 18, NULL, NULL, NULL),
(9078, 'Charger any micro USB Auto Belkin ', 'charger-any-micro-usb-auto-belkin', 888, 'Micro-USB для прикуривателя  (Быстрозарядный USB-порт)', 'product.jpg', 10.7, NULL, NULL, NULL),
(9080, 'AV Composite cable iPhone & iPod Capdase ', 'av-composite-cable-iphone-ipod-capdase', 888, 'кабель для подключения к audio & video (3 кабеля)', 'product.jpg', 33, NULL, NULL, NULL),
(9178, 'Charger Dual USB Car Capdase (white, black)', 'charger-dual-usb-car-capdase-white-black', 888, 'Автомобильная зарядка на iPhone', 'product.jpg', 17, NULL, NULL, NULL),
(9186, 'Universal Dock For iPad big', 'universal-dock-for-ipad-big', 888, 'Подставка для iPad.', 'product.jpg', 7, NULL, NULL, NULL),
(9187, 'Universal Dock For iPad small ', 'universal-dock-for-ipad-small', 888, 'Подставка для iPhone\\iPad.', 'product.jpg', 5.5, NULL, NULL, NULL),
(9195, 'AC Adapter+euroadapter iPad original', 'ac-adapter-euroadapter-ipad-original', 888, '<p><img alt=\"\" src=\"/userfiles/upload/images/bmw.jpg\" style=\"height:88px; width:161px\" /><img alt=\"\" src=\"/userfiles/upload/images/111/aston_martin_mini.jpg\" style=\"float:right; height:100px; width:160px\" />Lorem ipsum dot. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec</p>\r\n', '698ccde910d9aeca0875952064ecdb091525b17d.jpg', 26, 'купить AC Adapter+euroadapter iPad original', 'description товара AC Adapter+euroadapter iPad original', 'AC Adapter,euroadapter, iPad original ,товар-бомба'),
(9196, 'Euroadapter iPhone/iPad', 'euroadapter-iphone-ipad', 888, '', 'product.jpg', 6.3, NULL, NULL, NULL),
(9448, 'Micro Sim Cutter For iPhone 4/iPad', 'micro-sim-cutter-for-iphone-4-ipad', 888, 'обрезалка для симок', 'product.jpg', 14, NULL, NULL, NULL),
(9449, 'Micro Sim Card Adapter (to SIM) Classic', 'micro-sim-card-adapter-to-sim-classic', 888, 'переходник на Micro sim', 'product.jpg', 1.5, NULL, NULL, NULL),
(9640, 'AV Component cable iPhone & iPod Capdase ', 'av-component-cable-iphone-ipod-capdase', 888, 'кабель для подключения к audio & video(5 кабелей)', 'product.jpg', 34, NULL, NULL, NULL),
(9698, 'Charger any micro USB Auto Belkin  ( без упаковки )', 'charger-any-micro-usb-auto-belkin-bez-upakovki', 888, 'Micro-USB для прикуривателя  (Быстрозарядный USB-порт)', 'product.jpg', 9.7, NULL, NULL, NULL),
(10250, 'VGA Adapter for iPad /iPad 2/iPhone 4/iPod touch 4', 'vga-adapter-for-ipad-ipad-2-iphone-4-ipod-touch-4', 888, 'адаптер для подключения iPad 2/iPad/iPhone 4/iPod touch 4G к телевизору, проэктору или VGA дисплею', 'product.jpg', 35, NULL, NULL, NULL),
(10633, 'Micro Sim Card Adapter ', 'micro-sim-card-adapter', 888, 'переходник на Micro sim', 'product.jpg', 1.5, NULL, NULL, NULL),
(10871, 'Griffin PowerJolt Dual Micro Car Charger for iPad/iPhone/iPod ', 'griffin-powerjolt-dual-micro-car-charger-for-ipad-iphone-ipod', 888, 'автомобильное зарядное устройство оснащенное сразу двумя портами USB', 'product.jpg', 19, NULL, NULL, NULL),
(10894, 'HDMI Adapter for iPad /iPad 2 ', 'hdmi-adapter-for-ipad-ipad-2', 888, '<p>\r\n	HDMI кабель для подключения к телевизору.</p>\r\n', 'product.jpg', 29, NULL, NULL, NULL),
(12047, 'Stylus iPhone (short) black', 'stylus-iphone-short-black', 888, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(12048, 'Stylus iPhone (short) silver', 'stylus-iphone-short-silver', 888, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(12049, 'Stylus iPhone (short) red', 'stylus-iphone-short-red', 888, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(12050, 'Stylus iPhone (short) pink', 'stylus-iphone-short-pink', 888, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(12051, 'Stylus iPhone (middle) black', 'stylus-iphone-middle-black', 888, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(12052, 'Stylus iPhone (middle) pink', 'stylus-iphone-middle-pink', 888, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(12053, 'Stylus iPhone (middle) white', 'stylus-iphone-middle-white', 888, '', 'product.jpg', 3.5, NULL, NULL, NULL),
(12204, 'Monster Beats by Dr. Dre iBeats With ControlTalk In-Ear Headphones (black) ', 'monster-beats-by-dr-dre-ibeats-with-controltalk-in-ear-headphones-black', 888, 'вакуумные наушники-вкладыши для iPhone', 'product.jpg', 35, NULL, NULL, NULL),
(12508, 'Monster Beats by Dr. Dre iBeats With ControlTalk In-Ear Headphones (white) ', 'monster-beats-by-dr-dre-ibeats-with-controltalk-in-ear-headphones-white', 888, 'вакуумные наушники-вкладыши для iPhone', 'product.jpg', 35, NULL, NULL, NULL),
(12658, 'Nano Sim Cutter iPhone 5 (noname)', 'nano-sim-cutter-iphone-5-noname', 888, 'обрезалка для симок', 'product.jpg', 16, NULL, NULL, NULL),
(12659, 'Nano Sim Cutter iPhone 5 ROCK + adapters', 'nano-sim-cutter-iphone-5-rock-adapters', 888, 'обрезалка для симок', 'product.jpg', 16, NULL, NULL, NULL),
(12660, 'Nano Sim + Micro Sim Adapters iPhone 4/4S/5', 'nano-sim-micro-sim-adapters-iphone-4-4s-5', 888, 'переходник с nano и micro SIM', 'product.jpg', 8, NULL, NULL, NULL),
(12917, 'USB Cable Lightning iPhone 5/ iPad mini ', 'usb-cable-lightning-iphone-5-ipad-mini', 888, 'Кабель для iPhone5/iPad mini', 'product.jpg', 9.8, NULL, NULL, NULL),
(12918, 'USB Cable Lightning iPhone 5/ iPad mini original', 'usb-cable-lightning-iphone-5-ipad-mini-original', 888, 'Кабель для iPhone5/iPad mini', 'product.jpg', 19, NULL, NULL, NULL),
(12919, 'Lightning to Micro USB Adapter', 'lightning-to-micro-usb-adapter', 888, 'переходник с микро USB на Lightning', 'product.jpg', 13.5, NULL, NULL, NULL),
(12921, 'Connection Kit Lightning iPhone 5/ iPad mini 3-in-1', 'connection-kit-lightning-iphone-5-ipad-mini-3-in-1', 888, 'переходник для фотокамер, Micro SD/ SD', 'product.jpg', 15, NULL, NULL, NULL),
(12923, 'Lightning to 30-pin Adapter ', 'lightning-to-30-pin-adapter', 888, 'переходник из нового коннектора Lightning в традиционный 30-пиновый разъем', 'product.jpg', 11, NULL, NULL, NULL),
(13327, 'Портативное зарядное устройство Lepow-stone  (серебристое) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-serebristoe-2-usb-kabel', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'product.jpg', 40, NULL, NULL, NULL),
(13328, 'Портативное зарядное устройство Lepow-stone  (белое) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-beloe-2-usb-kabel', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'product.jpg', 40, NULL, NULL, NULL),
(13329, 'Портативное зарядное устройство Lepow-stone  (салатовое) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-salatovoe-2-usb-kabel', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'product.jpg', 40, NULL, NULL, NULL),
(13330, 'Портативное зарядное устройство Lepow-stone  (голубое) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-goluboe-2-usb-kabel', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'product.jpg', 40, NULL, NULL, NULL),
(13331, 'Портативное зарядное устройство Lepow-stone  (розовое) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-rozovoe-2-usb-kabel', 888, '<p>\r\n	Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA</p>\r\n', 'product.jpg', 40, NULL, NULL, NULL),
(13332, 'Портативное зарядное устройство Lepow-stone  (чёрное) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-chernoe-2-usb-kabel', 888, 'Портативный источник питания Lepow Stone 6000 имеет объем 6000mAh, 2 USB порта для зарядки ваших гаджетов,Тип батареи: Lithium-ion Polymer, Output Voltage: DC 5V,Output Current: 500mA(Ordinary mode),1200mA(Fast-charge mode),Input Current: 1000mA', 'product.jpg', 40, NULL, NULL, NULL),
(13352, 'Nano Sim + Micro Sim Cutter iPhone/iPad', 'nano-sim-micro-sim-cutter-iphone-ipad', 888, 'Устройство для обрезки сим карт под нано сим и микросим карту.', 'product.jpg', 19, NULL, NULL, NULL),
(13405, 'Griffin PowerJolt Dual Micro Car Charger for iPhone 5/iPad 4/iPad mini', 'griffin-powerjolt-dual-micro-car-charger-for-iphone-5-ipad-4-ipad-mini', 888, '', 'product.jpg', 25, NULL, NULL, NULL),
(13489, 'Портативное зарядное устройство Lepow-stone  (золотистое) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-zolotistoe-2-usb-kabel', 888, '', 'product.jpg', 40, NULL, NULL, NULL),
(13490, 'Портативное зарядное устройство Lepow-stone  (тёмно-розовый) 2 USB + кабель', 'portativnoe-zaryadnoe-ustroystvo-lepow-stone-temno-rozovyy-2-usb-kabel', 888, '', 'product.jpg', 40, NULL, NULL, NULL),
(13453, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black) \"Aventador D1\"', 'chehol-na-iphone-5-lamborghini-leather-flip-case-black-aventador-d1', 895, 'Чехол флип-кейс Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи; Чехол очень тонкий и легкий, все порты и разъёмы остаются открытыми. Чехол не увеличит вес и объем вашего смартфона. ', 'product.jpg', 35, NULL, NULL, NULL),
(13454, 'Чехол на iPhone 5 Lamborghini Genuine Leather Slim Wallet Cover (black)', 'chehol-na-iphone-5-lamborghini-genuine-leather-slim-wallet-cover-black', 895, 'Стильный кожаный чехол-крышка с логотипом Lamborghini и отделением для пластиковых карт', 'product.jpg', 32, NULL, NULL, NULL),
(13455, 'Чехол на iPhone 5 Lamborghini Policarbonate and TPV 2in1 Back Cover (grey) \"Super leggera stylish D1\"', 'chehol-na-iphone-5-lamborghini-policarbonate-and-tpv-2in1-back-cover-grey-super-leggera-stylish-d1', 895, 'Стильный пластиковый чехол-крышка с логотипом Lamborghini и флагом Италии. Цвет Серый .Идеально прилегает к устройству.Отверстия для камеры и вспышки.Свободный доступ к сенсорному экрану, элементам управления и необходимым разъемам.', 'product.jpg', 23, NULL, NULL, NULL),
(13456, 'Чехол на iPhone 5 Lamborghini Policarbonate and TPV 2in1 Back Cover (white) \"Super leggera stylish D1\"', 'chehol-na-iphone-5-lamborghini-policarbonate-and-tpv-2in1-back-cover-white-super-leggera-stylish-d1', 895, 'Стильный пластиковый чехол-крышка с логотипом Lamborghini и флагом Италии. Цвет белый .Идеально прилегает к устройству.Отверстия для камеры и вспышки.Свободный доступ к сенсорному экрану, элементам управления и необходимым разъемам.', 'product.jpg', 23, NULL, NULL, NULL),
(13457, 'Чехол на iPhone 5 Lamborghini Policarbonate and TPV 2in1 Back Cover (orange) \"Super leggera stylish D1\"', 'chehol-na-iphone-5-lamborghini-policarbonate-and-tpv-2in1-back-cover-orange-super-leggera-stylish-d1', 895, 'Стильный пластиковый чехол-крышка с логотипом Lamborghini и флагом Италии. Цвет Оранжевый .Идеально прилегает к устройству.Отверстия для камеры и вспышки.Свободный доступ к сенсорному экрану, элементам управления и необходимым разъемам.', 'product.jpg', 23, NULL, NULL, NULL),
(13458, 'Чехол на iPhone 5 Lamborghini Policarbonate Back Cover (black) \"Murcielago stylish D1\"', 'chehol-na-iphone-5-lamborghini-policarbonate-back-cover-black-murcielago-stylish-d1', 895, '', 'product.jpg', 25, NULL, NULL, NULL),
(13459, 'Чехол на iPhone 5 Lamborghini Policarbonate Back Cover (white) \"Murcielago stylish D1\"', 'chehol-na-iphone-5-lamborghini-policarbonate-back-cover-white-murcielago-stylish-d1', 895, '', 'product.jpg', 25, NULL, NULL, NULL),
(13460, 'Чехол на iPhone 5 Lamborghini Policarbonate Back Cover (black) \"Gallardo Stylish D1\"', 'chehol-na-iphone-5-lamborghini-policarbonate-back-cover-black-gallardo-stylish-d1', 895, '', 'product.jpg', 25, NULL, NULL, NULL),
(13461, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black-green) \"Gallardo D2\"', 'chehol-na-iphone-5-lamborghini-leather-flip-case-black-green-gallardo-d2', 895, 'Чехол флип-кейс Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи; Чехол очень тонкий и легкий, все порты и разъёмы остаются открытыми. Чехол не увеличит вес и объем вашего смартфона. ', 'product.jpg', 35, NULL, NULL, NULL),
(13463, 'Чехол на iPhone 5 Lamborghini Genuine Leather Flip Case & Carbon Fiber (black)  \"Avendator-D2\"', 'chehol-na-iphone-5-lamborghini-genuine-leather-flip-case-carbon-fiber-black-avendator-d2', 895, 'Чёрный чехол-флип выполнен из натуральной высококачественной кожи с карбоновой вставкой серии Avendator-D2 для iPhone 5', 'product.jpg', 35, NULL, NULL, NULL),
(13464, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover (black) \"Aventador\"', 'chehol-na-iphone-5-lamborghini-genuine-leather-back-cover-black-aventador', 895, '', 'product.jpg', 30, NULL, NULL, NULL),
(13465, 'Чехол на iPhone 5 Lamborghini Leather Back Cover (black) \"Performante D1\"', 'chehol-na-iphone-5-lamborghini-leather-back-cover-black-performante-d1', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'product.jpg', 27, NULL, NULL, NULL),
(13466, 'Чехол на iPhone 5 Lamborghini Leather Back Cover (white) \"Performante D1\"', 'chehol-na-iphone-5-lamborghini-leather-back-cover-white-performante-d1', 895, 'Кожаный чехол накладка белого цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'product.jpg', 27, NULL, NULL, NULL),
(13467, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black) \"Performante-D1\"', 'chehol-na-iphone-5-lamborghini-leather-flip-case-black-performante-d1', 895, 'Чехол флип-кейс Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи; Чехол очень тонкий и легкий, все порты и разъёмы остаются открытыми. Чехол не увеличит вес и объем вашего смартфона. ', 'product.jpg', 35, NULL, NULL, NULL),
(13468, 'Чехол на iPhone 5 Lamborghini Ultra-Slim Leather Flip Case (black)', 'chehol-na-iphone-5-lamborghini-ultra-slim-leather-flip-case-black', 895, 'Чёрный ультра-тонкий чехол книжка для iPhone 5 из натуральной высококачественной кожи', 'product.jpg', 35, NULL, NULL, NULL),
(13469, 'Чехол на iPhone 5 Lamborghini Ultra-Slim Leather Flip Case (white)', 'chehol-na-iphone-5-lamborghini-ultra-slim-leather-flip-case-white', 895, 'Белый ультра-тонкий чехол книжка для iPhone 5 из натуральной высококачественной кожи', 'product.jpg', 35, NULL, NULL, NULL),
(13470, 'Чехол на iPhone 5 Lamborghini Leather Flip Case (black) \"Gallardo D1\"', 'chehol-na-iphone-5-lamborghini-leather-flip-case-black-gallardo-d1', 895, 'Чёрный чехол флип-кейс на магните Lamborghini выполнен итальянскими мастерами по лицензии Lamborghini из натуральной высококачественной кожи', 'product.jpg', 35, NULL, NULL, NULL),
(13471, 'Чехол на iPhone 5 Lamborghini Leather Back Cover + Vertical Wallet Cover iPhone \"Gallardo D1\"', 'chehol-na-iphone-5-lamborghini-leather-back-cover-vertical-wallet-cover-iphone-gallardo-d1', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini с отделом для пластиковых карт', 'product.jpg', 32, NULL, NULL, NULL),
(13472, 'Чехол на iPhone 5 Lamborghini Leather Back Cover + Vertical Wallet Cover (white) \"Gallardo D1\"', 'chehol-na-iphone-5-lamborghini-leather-back-cover-vertical-wallet-cover-white-gallardo-d1', 895, 'Кожаный чехол накладка белого цвета Lamborghini с отделом для пластиковых карт', 'product.jpg', 32, NULL, NULL, NULL),
(13473, 'Чехол на iPhone 5 Lamborghini Leather Back Cover + Vertical Wallet Cover (purple) \"Gallardo D1\"', 'chehol-na-iphone-5-lamborghini-leather-back-cover-vertical-wallet-cover-purple-gallardo-d1', 895, 'Кожаный чехол накладка фиолетового цвета Lamborghini с отделом для пластиковых карт', 'product.jpg', 32, NULL, NULL, NULL),
(13474, 'Чехол на iPhone 5 Lamborghini Leather Back Cover (black) \"Genuine\"', 'chehol-na-iphone-5-lamborghini-leather-back-cover-black-genuine', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'product.jpg', 30, NULL, NULL, NULL),
(13475, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover (black) \"Gallardo D1\"', 'chehol-na-iphone-5-lamborghini-genuine-leather-back-cover-black-gallardo-d1', 895, 'Кожаный чехол накладка чёрного цвета Lamborghini – это символ успешности и богатства. Это по-настоящему статусный, роскошный аксессуар, который защитит и украсит Ваш смартфон.', 'product.jpg', 30, NULL, NULL, NULL),
(13476, 'Чехол на iPhone 5 Lamborghini Leather Sleeve Case (black) \"Gallardo D1\"', 'chehol-na-iphone-5-lamborghini-leather-sleeve-case-black-gallardo-d1', 895, 'Кожаный чехол карман чёрного цвета Lamborghini ', 'product.jpg', 34, NULL, NULL, NULL),
(13477, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover & Carbon Fiber (black) \"Aventador\"', 'chehol-na-iphone-5-lamborghini-genuine-leather-back-cover-carbon-fiber-black-aventador', 895, '', 'product.jpg', 31, NULL, NULL, NULL),
(13478, 'Чехол на iPhone 5 Lamborghini Genuine Leather Back Cover & Carbon Fiber (white) \"Aventador\"', 'chehol-na-iphone-5-lamborghini-genuine-leather-back-cover-carbon-fiber-white-aventador', 895, '', 'product.jpg', 31, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `is_admin` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `remember` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `name`, `is_admin`, `remember`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 'admin@catalog.loc', 'Менеджер', 1, 'b620b84d847b4dae08f8faa3199e788b'),
(2, 'andrey', '202cb962ac59075b964b07152d234b70', 'andrey@mail.ru', 'Андрей', 0, ''),
(15, 'andrey1', '202cb962ac59075b964b07152d234b70', 'andrey1@mail.ru', 'андрей1', 0, NULL),
(19, 'каптча', '202cb962ac59075b964b07152d234b70', 'captcha@mail.ru', 'каптча', 0, NULL),
(18, 'ruslan', '202cb962ac59075b964b07152d234b70', 'ruslan@mail.ru', 'ruslan', 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Индексы таблицы `forgot`
--
ALTER TABLE `forgot`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`),
  ADD KEY `parent` (`parent`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `remember` (`remember`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=896;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT для таблицы `forgot`
--
ALTER TABLE `forgot`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `options`
--
ALTER TABLE `options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13612;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
