USE [master]
GO
/****** Object:  Database [big]    Script Date: 01.04.2023 11:49:10 ******/
CREATE DATABASE [big]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'big', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\big.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'big_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\big_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [big] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [big].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [big] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [big] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [big] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [big] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [big] SET ARITHABORT OFF 
GO
ALTER DATABASE [big] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [big] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [big] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [big] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [big] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [big] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [big] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [big] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [big] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [big] SET  DISABLE_BROKER 
GO
ALTER DATABASE [big] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [big] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [big] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [big] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [big] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [big] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [big] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [big] SET RECOVERY FULL 
GO
ALTER DATABASE [big] SET  MULTI_USER 
GO
ALTER DATABASE [big] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [big] SET DB_CHAINING OFF 
GO
ALTER DATABASE [big] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [big] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [big] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [big] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'big', N'ON'
GO
ALTER DATABASE [big] SET QUERY_STORE = OFF
GO
USE [big]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 01.04.2023 11:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[id_заказа] [float] NOT NULL,
	[Дата заказа] [datetime] NULL,
	[Дата доставки] [datetime] NULL,
	[Пункт выдачи] [float] NULL,
	[id_покупателя] [float] NOT NULL,
	[Код для получения] [float] NULL,
	[Статус заказа] [float] NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[id_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Категории]    Script Date: 01.04.2023 11:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Категории](
	[id_категории] [float] NOT NULL,
	[Категория товара] [nvarchar](255) NULL,
 CONSTRAINT [PK_Категории] PRIMARY KEY CLUSTERED 
(
	[id_категории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Наименование]    Script Date: 01.04.2023 11:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Наименование](
	[id_наименования] [float] NOT NULL,
	[product] [nvarchar](255) NULL,
 CONSTRAINT [PK_Наименование] PRIMARY KEY CLUSTERED 
(
	[id_наименования] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи$]    Script Date: 01.04.2023 11:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи$](
	[id] [float] NOT NULL,
	[фио] [nvarchar](255) NULL,
	[Login] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[id_role] [float] NULL,
 CONSTRAINT [PK_Пользователи$] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пункт_выдачи]    Script Date: 01.04.2023 11:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пункт_выдачи](
	[id] [float] NOT NULL,
	[Индекс] [float] NULL,
	[Город] [nvarchar](255) NULL,
	[Улица] [nvarchar](255) NULL,
	[Дом] [float] NULL,
 CONSTRAINT [PK_Пункт_выдачи] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли$]    Script Date: 01.04.2023 11:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли$](
	[id] [float] NOT NULL,
	[role] [nvarchar](255) NULL,
 CONSTRAINT [PK_Роли$] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товары]    Script Date: 01.04.2023 11:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товары](
	[id_товара] [float] NOT NULL,
	[Артикул] [nvarchar](255) NULL,
	[id_наименования] [float] NULL,
	[Единица измерения   ] [nvarchar](255) NULL,
	[Стоимость] [float] NULL,
	[Размер максимально возможной скидки] [float] NULL,
	[Производитель] [nvarchar](255) NULL,
	[Поставщик] [nvarchar](255) NULL,
	[id_категории] [float] NULL,
	[Действующая скидка] [float] NULL,
	[Кол-во на складе] [float] NULL,
	[Описание] [nvarchar](255) NULL,
	[Изображение] [nvarchar](255) NULL,
 CONSTRAINT [PK_Товары] PRIMARY KEY CLUSTERED 
(
	[id_товара] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (1, N'Ароматы для дома')
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (2, N'Вазы')
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (3, N'Горшки и подставки')
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (4, N'Интерьерные аксессуары')
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (5, N'Картины и фоторамки')
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (6, N'Свечи')
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (7, N'Часы')
INSERT [dbo].[Категории] ([id_категории], [Категория товара]) VALUES (8, N'Шкатулки и подставки')
GO
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (1, N'Аромат')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (2, N'Ваза')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (3, N'Свеча')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (4, N'Подставка')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (5, N'Кашпо')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (6, N'Часы')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (7, N'Диффузор')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (8, N'Фоторамка')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (9, N'Подсвечник')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (10, N'Шкатулка')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (11, N'Блюдо')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (12, N'Растение')
INSERT [dbo].[Наименование] ([id_наименования], [product]) VALUES (13, N'Декор настенный')
GO
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (1, N'Агафонова  Лариса Михаиловна', N'loginDEiry2018', N'5zu7+}', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (2, N'Александров  Владимир Дамирович', N'loginDEuuo2018', N'42XmH1', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (3, N'Алексеев  Владислав Аркадьевич', N'loginDEbct2018', N'Qg3gff', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (4, N'Белов  Роман Иринеевич', N'loginDEfbs2018', N'v90Rep', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (5, N'Бобылёва  Юлия Егоровна', N'loginDEmvn2018', N'Mrr9e0', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (6, N'Борисова  Анжелика Анатольевна', N'loginDEanv2018', N'Xiq}M3', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (7, N'Брагин  Бронислав Георгьевич', N'loginDEfoj2018', N'nhGc+D', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (8, N'Брагина  Алина Валерьевна', N'loginDEhuu2018', N'X31OEf', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (9, N'Васильев  Серапион Макарович', N'loginDExix2018', N'hzxtnn', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (10, N'Волкова  Алла Лукьевна', N'loginDEple2018', N'WlW+l8', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (11, N'Воронов  Митрофан Антонович', N'loginDEvht2018', N'zMyS8Z', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (12, N'Галкина  Олимпиада Владленовна', N'loginDEqrf2018', N'mI8n58', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (13, N'Герасимов  Мстислав Дамирович', N'loginDEqon2018', N'YeFbh6', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (14, N'Горбачёв  Пантелеймон Германович', N'loginDEpsu2018', N'Vx9cQ{', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (15, N'Горбунов  Вячеслав Станиславович', N'loginDEtto2018', N'qXYDuu', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (16, N'Горшкова  Агафья Онисимовна', N'loginDEpst2018', N'0CyGnX', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (17, N'Евсеев  Игорь Донатович', N'loginDEmjb2018', N'5mm{ch', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (18, N'Ершова  Иванна Максимовна', N'loginDEzqs2018', N'qM9p7i', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (19, N'Зуев  Эдуард Пантелеймонович', N'loginDEsnh2018', N'kqhydh', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (20, N'Калашникова  Александра Владимировна', N'loginDEwoe2018', N'yOtw2F', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (21, N'Карпова  Ольга Лукьевна', N'loginDEcor2018', N'2cIrC8', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (22, N'Кириллова  Эмилия Федосеевна', N'loginDEfku2018', N'a1m+8c', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (23, N'Козлов  Геласий Христофорович', N'loginDEvlf2018', N'O5mXc2', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (24, N'Колобова  Елена Евгеньевна', N'loginDExxv2018', N'+daE|T', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (25, N'Котов  Денис Мартынович', N'loginDEgyi2018', N'|7nYPc', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (26, N'Кошелева  Кира Владиславовна', N'loginDEdal2018', N'cJWXL0', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (27, N'Кудрявцев  Матвей Игоревич', N'loginDEdof2018', N'kD|LRU', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (28, N'Кудрявцева  Таисия Игоревна', N'loginDEhhx2018', N'hmCHeQ', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (29, N'Куликов  Андрей Святославович', N'loginDEfsp2018', N'&dtlI+', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (30, N'Маслов  Мстислав Антонинович', N'loginDEeqo2018', N'l5CBqA', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (31, N'Медведьева  Таисия Тихоновна', N'loginDExyu2018', N'7Fg}9p', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (32, N'Муравьёва  Александра Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (33, N'Нестеров  Агафон Георгьевич', N'loginDExcd2018', N'SZXZNL', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (34, N'Никонов  Мэлс Лукьевич', N'loginDEuro2018', N'a1MIcO', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (35, N'Новикова  Лукия Ярославовна', N'loginDEwjv2018', N'ZfseKA', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (36, N'Носова  Наина Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (37, N'Панфилова  Марина Борисовна', N'loginDEbjs2018', N'Xap2ct', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (38, N'Савельева  Евфросиния Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 1)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (39, N'Семёнова  Октябрина Христофоровна', N'loginDEayn2018', N'Ka2Fok', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (40, N'Сергеева  Агата Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (41, N'Ситников  Николай Филатович', N'loginDEbto2018', N'b1iYMI', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (42, N'Смирнов  Сергей Яковович', N'loginDEwld2018', N'y9HStF', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (43, N'Суворов  Илья Евсеевич', N'loginDEdgp2018', N'1WfJjo', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (44, N'Суханов  Станислав Фролович', N'loginDEzde2018', N'tlO3x&', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (45, N'Тетерина  Феврония Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (46, N'Тимофеева  Ксения Валерьевна', N'loginDEyfd2018', N'8aKdb0', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (47, N'Туров  Денис Геласьевич', N'loginDEioe2018', N'yMPu&2', 3)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (48, N'Фокин  Ириней Ростиславович', N'loginDEhsj2018', N's+jrMW', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (49, N'Щербаков  Георгий Богданович', N'loginDExrf2018', N'mhpRIT', 2)
INSERT [dbo].[Пользователи$] ([id], [фио], [Login], [Password], [id_role]) VALUES (50, N'Яковлева  Ксения Онисимовна', N'loginDEhlk2018', N'g0jSed', 2)
GO
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (1, 344288, N' г. Ковров', N' ул. Чехова', 1)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (2, 614164, N' г.Ковров', N'  ул. Степная', 30)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (3, 394242, N' г. Ковров', N' ул. Коммунистическая', 43)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (4, 660540, N' г. Ковров', N' ул. Солнечная', 25)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (5, 125837, N' г. Ковров', N' ул. Шоссейная', 40)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (6, 125703, N' г. Ковров', N' ул. Партизанская', 49)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (7, 625283, N' г. Ковров', N' ул. Победы', 46)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (8, 614611, N' г. Ковров', N' ул. Молодежная', 50)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (9, 454311, N' г.Ковров', N' ул. Новая', 19)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (10, 660007, N' г.Ковров', N' ул. Октябрьская', 19)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (11, 603036, N' г. Ковров', N' ул. Садовая', 4)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (12, 450983, N' г.Ковров', N' ул. Комсомольская', 26)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (13, 394782, N' г. Ковров', N' ул. Чехова', 3)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (14, 603002, N' г. Ковров', N' ул. Дзержинского', 28)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (15, 450558, N' г. Ковров', N' ул. Набережная', 30)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (16, 394060, N' г.Ковров', N' ул. Фрунзе', 43)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (17, 410661, N' г. Ковров', N' ул. Школьная', 50)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (18, 625590, N' г. Ковров', N' ул. Коммунистическая', 20)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (19, 400562, N' г. Ковров', N' ул. Зеленая', 32)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (20, 614510, N' г. Ковров', N' ул. Маяковского', 47)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (21, 410542, N' г. Ковров', N' ул. Светлая', 46)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (22, 620839, N' г. Ковров', N' ул. Цветочная', 8)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (23, 443890, N' г. Ковров', N' ул. Коммунистическая', 1)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (24, 603379, N' г. Ковров', N' ул. Спортивная', 46)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (25, 603721, N' г. Ковров', N' ул. Гоголя', 41)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (26, 410172, N' г. Ковров', N' ул. Северная', 13)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (27, 420151, N' г. Ковров', N' ул. Вишневая', 32)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (28, 125061, N' г. Ковров', N' ул. Подгорная', 8)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (29, 630370, N' г. Ковров', N' ул. Шоссейная', 24)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (30, 614753, N' г. Ковров', N' ул. Полевая', 35)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (31, 426030, N' г. Ковров', N' ул. Маяковского', 44)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (32, 625560, N' г. Ковров', N' ул. Некрасова', 12)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (33, 630201, N' г. Ковров', N' ул. Комсомольская', 17)
INSERT [dbo].[Пункт_выдачи] ([id], [Индекс], [Город], [Улица], [Дом]) VALUES (34, 190949, N' г. Ковров', N' ул. Мичурина', 26)
GO
INSERT [dbo].[Роли$] ([id], [role]) VALUES (1, N'Администратор')
INSERT [dbo].[Роли$] ([id], [role]) VALUES (2, N'Клиент')
INSERT [dbo].[Роли$] ([id], [role]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (1, N'B025Y5', 1, N'шт.', 1890, 5, N'Home Philosophy', N'Стокманн', 4, 3, 8, N'Блюдо декоративное flower 35 см Home Philosophy', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (2, N'B037T5', 1, N'шт.', 690, 5, N'Home Philosophy', N'Стокманн', 4, 2, 14, N'Блюдо декоративное Flower 35 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (3, N'D034T5', 7, N'шт.', 800, 20, N'Miksdo', N'Hoff', 1, 2, 15, N'Диффузор Mikado intense Апельсин с корицей', N'D034T5.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (4, N'D044T5', 2, N'шт.', 1790, 5, N'Home Philosophy', N'Стокманн', 4, 3, 7, N'Декор настенный Фантазия 45х45х1 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (5, N'D826T5', 7, N'шт.', 600, 5, N'True Scents', N'Hoff', 1, 2, 13, N'Диффузор True Scents 45 мл манго', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (6, N'D832R2', 13, N'шт.', 1000, 10, N'Home Philosophy', N'Стокманн', 4, 3, 15, N'Декоративное растение 102 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (7, N'D947R5', 7, N'шт.', 500, 5, N'Aroma', N'Hoff', 1, 4, 6, N'Диффузор Aroma Harmony Lavender', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (8, N'F837T5', 13, N'шт.', 999, 5, N'Gallery', N'Hoff', 5, 2, 15, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (9, N'F903T5', 13, N'шт.', 600, 15, N'Gallery', N'Hoff', 5, 2, 3, N'Фоторамка Gallery 20х30 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (10, N'F928T5', 13, N'шт.', 1590, 25, N'Umbra', N'Стокманн', 5, 2, 13, N'Фоторамка Prisma 10х10 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (11, N'F933T5', 13, N'шт.', 1400, 20, N'Cube Color', N'Hoff', 3, 4, 23, N'Настольное кашпо с автополивом Cube Color', N'F933T5.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (12, N'F937R4', 13, N'шт.', 359, 15, N'Gallery', N'Hoff', 5, 4, 17, N'Фоторамка 10х15 см Gallery серый с патиной/золотой', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (13, N'H023R8', 13, N'шт.', 5600, 15, N'Umbra', N'Стокманн', 7, 2, 6, N'Часы настенные Ribbon 30,5 см', N'H023R8.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (14, N'H937R3', 13, N'шт.', 999, 10, N'Umbra', N'Hoff', 7, 3, 4, N'Часы настенные 6500 30,2 см', N'H937R3.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (15, N'K083T5', 1, N'шт.', 2790, 20, N'Esteban', N'Стокманн', 1, 2, 6, N'Сменный аромат Figue noire 250 мл', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (16, N'K478R4', 1, N'шт.', 3500, 30, N'Esteban', N'Стокманн', 1, 4, 4, N'Аромат для декобукета Esteban', N'K478R4.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (17, N'K937T4', 1, N'шт.', 7900, 25, N'Esteban', N'Стокманн', 1, 2, 17, N'Деко-букет Кедр 250 мл', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (18, N'P846R4', 13, N'шт.', 1400, 15, N'Valley', N'Стокманн', 3, 3, 12, N'Подставка для цветочных горшков 55x25x35 см Valley', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (19, N'P927R2', 13, N'шт.', 4000, 15, N'Valley', N'Стокманн', 3, 2, 4, N'Подставка для цветочных горшков Valley', N'P927R2.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (20, N'P936E4', 13, N'шт.', 3590, 15, N'Umbra', N'Стокманн', 3, 4, 9, N'Подставка для газет и журналов Zina', N'P936E4.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (21, N'R836R5', 13, N'шт.', 8000, 30, N'Umbra', N'Стокманн', 8, 5, 3, N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (22, N'R922T5', 13, N'шт.', 690, 10, N'Home Philosophy', N'Стокманн', 8, 2, 4, N'Шкатулка из керамики Lana 6х7 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (23, N'S039T5', 13, N'шт.', 250, 10, N'True Scents', N'Hoff', 6, 2, 18, N'Свеча True Moods Feel happy', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (24, N'S563T4', 13, N'шт.', 1000, 20, N'True Scents', N'Hoff', 6, 3, 12, N'Свеча в стакане True Scents', N'S563T4.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (25, N'S936Y5', 13, N'шт.', 299, 15, N'True Scents', N'Hoff', 1, 3, 4, N'Свеча в стакане True Scents', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (26, N'S937T5', 13, N'шт.', 2600, 10, N'Kersten', N'Стокманн', 1, 3, 23, N'Подсвечник 37 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (27, N'V432R6', 2, N'шт.', 1990, 10, N'Kersten', N'Стокманн', 2, 3, 30, N'Ваза из фаянса 28,00 x 9,50 x 9,50 см', NULL)
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (28, N'V483R7', 2, N'шт.', 100, 15, N'Весна', N'Hoff', 2, 3, 7, N'Ваза «Весна» 18 см стекло, цвет прозрачный', N'V483R7.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (29, N'V783T5', 2, N'шт.', 1300, 25, N'Home Philosophy', N'Стокманн', 2, 2, 13, N'Ваза из керамики Betty', N'V783T5.jpg')
INSERT [dbo].[Товары] ([id_товара], [Артикул], [id_наименования], [Единица измерения   ], [Стоимость], [Размер максимально возможной скидки], [Производитель], [Поставщик], [id_категории], [Действующая скидка], [Кол-во на складе], [Описание], [Изображение]) VALUES (30, N'V937E4', 2, N'шт.', 1999, 15, N'Kersten', N'Hoff', 2, 3, 21, N'Ваза 18H2535S 30,5 см', NULL)
GO
USE [master]
GO
ALTER DATABASE [big] SET  READ_WRITE 
GO
