USE [master]
GO
/****** Object:  Database [TrangTinTuc]    Script Date: 26/03/2023 2:04:07 AM ******/
CREATE DATABASE [TrangTinTuc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TrangTinTuc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TrangTinTuc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TrangTinTuc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TrangTinTuc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TrangTinTuc] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TrangTinTuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TrangTinTuc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TrangTinTuc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TrangTinTuc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TrangTinTuc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TrangTinTuc] SET ARITHABORT OFF 
GO
ALTER DATABASE [TrangTinTuc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TrangTinTuc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TrangTinTuc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TrangTinTuc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TrangTinTuc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TrangTinTuc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TrangTinTuc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TrangTinTuc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TrangTinTuc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TrangTinTuc] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TrangTinTuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TrangTinTuc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TrangTinTuc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TrangTinTuc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TrangTinTuc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TrangTinTuc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TrangTinTuc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TrangTinTuc] SET RECOVERY FULL 
GO
ALTER DATABASE [TrangTinTuc] SET  MULTI_USER 
GO
ALTER DATABASE [TrangTinTuc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TrangTinTuc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TrangTinTuc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TrangTinTuc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TrangTinTuc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TrangTinTuc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TrangTinTuc', N'ON'
GO
ALTER DATABASE [TrangTinTuc] SET QUERY_STORE = OFF
GO
USE [TrangTinTuc]
GO
/****** Object:  User [nguyentoanh]    Script Date: 26/03/2023 2:04:08 AM ******/
CREATE USER [nguyentoanh] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 26/03/2023 2:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_ID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 26/03/2023 2:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[news_ID] [int] IDENTITY(1,1) NOT NULL,
	[category_ID] [int] NOT NULL,
	[author_ID] [int] NOT NULL,
	[title] [nvarchar](500) NOT NULL,
	[body] [nvarchar](max) NOT NULL,
	[picture] [varchar](200) NULL,
	[date] [datetime] NOT NULL,
	[views] [int] NULL,
 CONSTRAINT [PK_tblNews] PRIMARY KEY CLUSTERED 
(
	[news_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26/03/2023 2:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[power] [int] NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](150) NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[user_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([category_ID], [title]) VALUES (1, N'Thời Sự')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (3, N'Thế Giới')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (4, N'Kinh Doanh')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (7, N'Thể Thao')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (8, N'Pháp Luật')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (9, N'Giáo Dục')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (10, N'Sức Khỏe')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (12, N'Du Lịch')
INSERT [dbo].[Category] ([category_ID], [title]) VALUES (18, N'Xe Cộ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (1, 7, 2, N'Neymar giúp Brazil vào chung kết Copa America', N'Brazil thắng Peru 1-0 ở bán kết Copa America 2021, nhờ bàn duy nhất của Lucas Paqueta sau pha kiến tạo của Neymar.Cũng giống trận gặp Chile ở tứ kết, Brazil vượt qua Peru với tỷ số tối thiểu. Neymar và Lucas Paqueta lại ghi dấu giày vào bàn thắng duy nhất, giúp đội chủ nhà giành vé vào chung kết, gặp đội thắng trong cặp bán kết còn lại giữa Argentina và Colombia.

Không giống trận thắng Peru 4-0 ở vòng bảng, Brazil gặp nhiều khó khăn trong lần tái đấu đối thủ ở bán kết. Trong hiệp một, đội chủ nhà bỏ lỡ nhiều cơ hội, trong đó đáng kể nhất là pha đệm bóng cận thành hỏng ăn của Neymar cũng như hai tình huống Richarlison rê qua thủ môn nhưng không thể ghi bàn.Số đông cầu thủ lùi sâu của Peru không đồng nghĩa với chất lượng phòng ngự. Họ thủng lưới ở phút 35, sau khi ba cầu thủ đội khách không thể ngăn cản Neymar, để siêu sao Brazil rê qua rồi chuyền vào cấm địa cho Paqueta lập công trong thế trống trải.

Brazil dẫn 1-0 sau hiệp một, hiệp đấu họ dứt điểm trúng hướng cầu môn bảy lần. Nhưng sang hiệp hai, Peru vùng lên và kiểm soát thế trận. Đội khách liên tục đe dọa khung thành Ederson bằng những pha dứt điểm căng. Sau khi Lapadula thử tài thủ môn Brazil bằng cú sút chân trái trong vòng cấm, đến lượt Raziel Garcia liên tiếp sút xa buộc Ederson phải đẩy bóng cứu thua.rong hiệp hai, Brazil lên bóng rời rạc và chỉ một lần dứt điểm trúng hướng cầu môn. Hàng công chủ nhà gần như bị chia cắt hoàn toàn. Điểm nhấn mà Brazil tạo ra trong 45 phút cuối là những tình huống ngã trong vòng cấm của Neymar cũng như Richarlison, nhưng không có tiếng còi nào được cất lên.

Chiến thắng 1-0 là đủ để Brazil vào chung kết. Các học trò Tite dường như chưa chơi với 100% khả năng ở trận gặp Peru. Brazil chắc chắn sẽ thể hiện bộ mặt nghiêm túc hơn, khi đối đầu với Argentina hoặc Colombia ở chung kết.', NULL, CAST(N'2021-10-25T05:00:00.000' AS DateTime), 8)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (2, 7, 3, N'Găng tay của Donnarumma khác biệt thế nào', N'Thủ môn Gianluigi Donnarumma, với sự hỗ trợ từ đôi găng tay đầy gai, đã chơi ấn tượng để giúp Italy vào bán kết Euro 2021.Theo Marca, Donnarumma sử dụng găng tay mang tên Predator Pro Hibryd do Adidas sản xuất. Đôi găng có giá 142 USD (khoảng 3,2 triệu đồng) với 288 gai cao su ở mặt sau. Tại Euro 2021, bên cạnh Donnarumma, hai đồng nghiệp David De Gea và Kasper Schmeichel cũng sử dụng công cụ lao động này.', NULL, CAST(N'2021-10-15T06:00:00.000' AS DateTime), 3)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (5, 1, 3, N'Chuyên gia đề xuất giải pháp TP HCM dập dịch khi cách ly xã hội', N'TP HCM cần yêu cầu người dân thực hiện nghiêm quy định cách ly xã hội, thay đổi chiến lược xét nghiệm; tăng tốc truy vết, chuẩn bị cho tình huống xấu hơn.

Từ 0h ngày 9/7, TP HCM sẽ cách ly xã hội theo Chỉ thị 16 trong 15 ngày, để chống Covid-19. Các chuyên gia dịch tễ cho rằng, thành phố cần tận dụng triệt để thời gian này, để giải quyết nhiều bài toán khó đặt ra cùng lúc, nhằm cắt đứt các chuỗi lây nhiễm.

Tiến sĩ Nguyễn Thu Anh, Giám đốc Viện Nghiên cứu Y khoa Woolcock, Đại học Sydney (Australia), nêu 8 đề xuất với TP HCM trong nửa tháng cách ly xã hội.

Thứ nhất, TP HCM cần thực hiện nghiêm toàn bộ nội dung Chỉ thị 16. "Một trong những nguyên nhân sau hơn một tháng giãn cách xã hội, thành phố vẫn chưa dập dịch triệt để là bởi thực hiện không nghiêm quy định giãn cách", bà Thu Anh phân tích.

Tinh thần của chỉ thị 16 là "gia đình cách ly với gia đình, thôn bản cách ly với thôn bản, xã cách ly với xã, huyện cách ly với huyện". Các phân xưởng, nhà máy sản xuất đảm bảo khoảng cách an toàn, người lao động đeo khẩu trang, thực hiện khử trùng, diệt khuẩn. Người dân nên ở nhà, chỉ ra ngoài nếu thật sự cần thiết như mua thực phẩm, thuốc men, cấp cứu; hoặc làm việc tại nhà máy, cơ sở sản xuất, cơ sở kinh doanh dịch vụ, hàng hóa thiết yếu (những nơi không bị đóng cửa, dừng hoạt động).

Mọi người phải giữ khoảng cách tối thiểu 2 m khi giao tiếp; không tập trung quá 2 người ngoài phạm vi công sở, trường học, bệnh viện; dừng di chuyển từ vùng dịch đến địa phương khác; cơ bản dừng hoạt động vận chuyển hành khách công cộng.

Ngoài các quy định nêu trên, bà Thu Anh đề xuất thêm người dân được khuyến khích mua đủ nhu yếu phẩm dùng trong hai tuần để giảm mật độ đi lại; tăng cường ứng dụng công nghệ để giao hàng. Cơ sở bán hàng lưu động đến từng khu dân được cần được khuyến khích, để người dân hạn chế đi lại. Gia đình có một thành viên chỉ được đi chợ hoặc siêu thị một lần mỗi tuần; gia đình hai thành viên hai lần mỗi tuần. Các khu dân cư dùng chung hạ tầng như bếp nấu ăn, nhà tắm, nhà vệ sinh, khu xử lý rác... phải chia lịch cụ thể để không tập trung đông người.

Nhà chức trách cần ứng dụng công nghệ để đếm số người ra vào tại mỗi địa điểm (như thẻ, token key, mã QR...). Thành phố cần có chế tài cụ thể với những người vi phạm các quy định của Chỉ thị 16.', NULL, CAST(N'2021-10-26T07:00:00.000' AS DateTime), 7)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (6, 3, 17, N'Biden: Haiti ''rất đáng lo ngại'' sau vụ ám sát Tổng thống', N'Tổng thống Mỹ lên án vụ ám sát Tổng thống Haiti là "hành động tàn ác", nói tình hình chung Haiti "rất đáng lo ngại".

"Chúng tôi rất sốc và đau buồn khi nghe tin khủng khiếp về vụ ám sát Tổng thống Haiti Jovenel Moise và vụ tấn công Đệ nhất phu nhân Martine Moise", Tổng thống Mỹ Joe Biden phát biểu hôm 7/7.

"Chúng tôi lên án hành độc tàn ác này, tôi xin gửi lời chúc chân thành tới Đệ nhất phu nhân Moise, mong bà sớm bình phục. Nước Mỹ xin gửi lời chia buồn tới người dân Haiti, chúng tôi sẵn sàng hỗ trợ trong khi chúng ta tiếp tục nỗ lực vì sự an toàn và an ninh cho Haiti".', NULL, CAST(N'2021-10-29T09:53:00.000' AS DateTime), 4)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (9, 9, 4, N'Cán bộ xã 4 lần đi thi tốt nghiệp THPT', N'Ông Rơ Châm Dạy, 42 tuổi, đã 3 lần rớt tốt nghiệp THPT nên năm nay tiếp tục dự thi, quyết tâm lấy tấm bằng.

Chiều 7/7, bước ra khỏi điểm thi trường THCS thị trấn Phú Hòa, huyện Chư Păh, sau khi kết thúc môn Toán, ông Rơ Châm Dạy tỏ ra không vui. Người đàn ông người Jara ngồi nán lại trên ghế đá trước sân trường, thở dài. "Hy vọng được 5 điểm. Còn bài thi Văn sáng nay tôi làm khá tốt nên không lo lắm", ông nói.

Ông Dạy từng là công an viên, Phó chủ tịch UBND xã Ia Sao. Từ năm 2016 đến nay, ông làm cán bộ Tư pháp - Hộ tịch, UBND xã Ia Yok, huyện Ia Grai. Lúc trước ông học hệ 9+3, nên không có bằng cấp ba. Ông đăng ký học bổ túc hệ THPT nhằm chuẩn hóa bằng cấp. Tuy nhiên, kỳ thi năm 2005, 2006, 2015 ông vẫn rớt tốt nghiệp THPT do không chịu khó ôn luyện.

Thế nên suốt một năm qua, ngoài giờ làm việc ở cơ quan, tối đến ông học bài và làm bài tập. Cứ thứ bảy, chủ nhật ông lại mang sách vở đến Trung tâm Giáo dục thường xuyên huyện Ia Grai học. "Năm nay tôi quyết lấy bằng được tấm bằng cấp ba vì đã củng cố kiến thức tương đối tốt", thí sinh 42 tuổi nói.', NULL, CAST(N'2021-10-30T10:06:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (10, 10, 4, N'TP HCM đặt mục tiêu lấy 1,3 triệu mẫu xét nghiệm mỗi ngày', N'2.000 đội lấy mẫu của TP HCM có thể lấy 1,3 triệu mẫu xét nghiệm nCoV mỗi ngày, tập trung lấy mẫu có trọng tâm trọng điểm, đặc biệt là địa bàn có nguy cơ cao.

Chủ tịch UBND Nguyễn Thành Phong cho biết thông tin trên tại cuộc họp chuẩn bị triển khai chỉ thị 16 trên toàn thành phố, ngày 7/7. Năng lực xét nghiệm của thành phố hiện đạt 400.000 mẫu gộp một ngày. Từ ngày 26/5 đến nay, thành phố xét nghiệm hơn 1,7 triệu mẫu nhằm phát hiện sớm các trường hợp nhiễm.

TP HCM lập Trung tâm Điều phối xét nghiệm Covid-19 để khắc phục các hạn chế về xét nghiệm, phối hợp tổ chức lấy mẫu, nhập dữ liệu vào hệ thống phần mềm, vận chuyển và điều phối mẫu đến các phòng xét nghiệm, khắc phục sự tương thích giữa nhưngc phần mềm trả kết quả của các phòng xét nghiệm...', NULL, CAST(N'2021-11-02T10:07:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (11, 7, 18, N'Hoãn SEA Games 2021', N'Hội đồng thể thao Đông Nam Á nhất trí hoãn SEA Games 31 - dự kiến tổ chức cuối năm nay - vì diễn biến Covid-19 phức tạp trong khu vực.

Quyết định được thông qua trong phiên họp trực tuyến của Hội đồng Thể thao Đông Nam Á với Uỷ ban Olympic các quốc gia thành viên.

Trước đó, trong phiên họp trực tuyến hôm 9/6, Uỷ ban Olympic Việt Nam đã đưa ra phương án hoãn SEA Games 31, và lùi sự kiện sang tháng 7/2022.Covid-19 bùng phát trở lại ở Việt Nam, với hàng nghìn ca lây nhiễm cộng đồng từ 27/4. Thực tế đó cộng với việc dịch bệnh vẫn diễn biến phức tạp ở nhiều quốc gia Đông Nam Á khiến việc tập luyện của các VĐV bị ảnh hưởng, trong khi công tác vận động tiếp thị thương mại cũng khó đạt kết quả mong muốn.

Việc đảm bảo y tế cho khoảng 20.000 VĐV, HLV, quan chức, trọng tài, nhân viên hậu cần của các đoàn thể thao, chưa tính đến người hâm mộ, cũng là thách thức lớn. Trong tình hình đó, việc tổ chức SEA Games 2021 theo lịch trình dự kiến trong năm nay trở nên bất khả thi.

Đây là lần thứ hai kể từ khi SEA Games ra đời năm 1959, Đại hội không diễn ra trong năm lẻ. Năm 1963, giải cũng bị huỷ vì hoàn cảnh chính trị ở Cambodia. SEA Games năm 2023 sẽ diễn ra tại Campuchia vào tháng Năm.

SEA Games 31 ban đầu dự kiến diễn ra từ 21/11/2021 đến 2/12/2021 ở 12 tỉnh thành gồm Hà Nội, Bắc Giang, Bắc Ninh, Hà Nam, Hải Dương, Hoà Bình, Vĩnh Phúc, Phú Thọ, Hải Phòng, Nam Định, Ninh Bình và Quảng Ninh. Đại hội gồm 40 môn thi, phần lớn là các môn Olympic.

Tại SEA Games 30 ở Philippines năm 2019, Việt Nam đứng thứ hai toàn đoàn với 98 HC vàng, sau chủ nhà Philippines. Đó là lần đầu Việt Nam không phải là chủ nhà nhưng đứng trên Thái Lan trên bảng tổng sắp huy chương.', NULL, CAST(N'2021-10-01T21:46:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (13, 1, 2, N'Xe đạp tự lái trang bị công nghệ AI', N'Các kỹ sư ở Huawei cho ra đời mẫu xe đạp tự động trang bị công nghệ AI, cảm biến độ chính xác cao và camera nhận dạng hình ảnh.', NULL, CAST(N'2021-10-13T09:21:00.000' AS DateTime), 1)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (14, 9, 4, N'Thí sinh hoàn thành kỳ thi tốt nghiệp đợt 1', N'Gần một triệu thí sinh cả nước trải qua hai ngày thi tốt nghiệp THPT căng thẳng trong bối cảnh Covid-19 lan ra 55 tỉnh, thành với hơn 20.000 ca nhiễm. Chiều 6/7, thí sinh đến điểm thi trường THPT Nguyễn Thượng Hiền (quận Tân bình, TP HCM) làm thủ tục dự thi, đính chính sai sót nếu có và nghe phổ biến quy chế thi. Ảnh: Hữu Khoa

Năm nay do tác động của Covid-19, kỳ thi tốt nghiệp THPT chia thành hai đợt. Đợt 1 ngày 7-8/7, dành cho khoảng một triệu thí sinh, đợt 2 sẽ được tổ chức sau khi dịch bệnh đã ổn định.', NULL, CAST(N'2021-11-04T21:48:00.000' AS DateTime), 57)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (15, 12, 14, N'54 điểm đến không cần xin visa với hộ chiếu Việt Nam', N'Theo bảng xếp hạng toàn cầu mới nhất, hộ chiếu Việt Nam có thể nhập cảnh 54 quốc gia và vùng lãnh thổ không cần xin visa trước.

Trong bảng xếp hạng Henley Passport Index mới nhất công bố vào đầu tháng 7, hộ chiếu Việt Nam đứng thứ 94 trên tổng số 199 khắp thế giới. Theo đó, công dân Việt Nam được miễn thị thực (visa), chỉ cần xin visa khi đến (visa on arrival) hoặc visa điện tử (eTA) với tỉ lệ thành công gần như 100% tại 54 quốc gia và vùng lãnh thổ. Cụ thể, các điểm đến miễn thị thực với Việt Nam gồm: quần đảo Cook, Micronesia, Niue, Barbados, Haiti, Saint Vincent & Grenadines, Singapore, Brunei, Campuchia, Indonesia, Lào, Malaysia, Myanmar, Philippines, Thái Lan, Kazakhstan, Kyrgyzstan, Chile, Ecuador, Panama, Dominica.

Các điểm đến chấp nhận visa on arrival: quần đảo Marshall, quần đảo Palau, Samoa, Tuvalu, Iran, Kuwait, St Lucia, Maldives, Nepal, Tajikistan, đông Timor, Bolivia, quần đảo Cape Verde, quần đảo Comoro, Guinea-Bissau, Kenya, Madagascar, Malawi, Mauritania, Mauritius, Mozambique, Namibia, Rwanda, Senegal, Seychelles, Sierra Leone, Somalia, Tanzania, Togo, Uganda, Zambia.

Các điểm đến chấp nhận eTA: đảo Đài Loan (Trung Quốc), Sri Lanka.

Henley Passport Index là bảng xếp hạng uy tín và thường niên thuộc công ty Henley & Partners. Số liệu thống kê để hoàn thành bảng xếp hạng hộ chiếu này được dựa vào dữ liệu độc quyền được cung cấp bởi Hiệp hội Vận tải Hàng không Quốc tế (IATA). Đến nay, Henley Passport Index đã có "thâm niên" 16 năm.', NULL, CAST(N'2021-11-05T21:50:00.000' AS DateTime), 6)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (16, 10, 2, N'Pfizer cung ứng 20 triệu liều vaccine Covid-19 cho trẻ em Việt Nam', N'Sức khỏeVaccineTin tứcThứ tư, 14/7/2021, 17:21 (GMT+7)
Pfizer cung ứng 20 triệu liều vaccine Covid-19 cho trẻ em Việt Nam
Hãng dược Pfizer cam kết cung ứng 20 triệu liều vaccine Covid-19 trong quý 4 để Việt Nam tiêm cho khoảng 9 triệu trẻ em trong độ tuổi 12-18.

Cam kết được ông John Paul Pullicino, Tổng giám đốc Công ty TNHH Pfizer Việt Nam đưa ra trong cuộc làm việc trực tuyến với Bộ trưởng Y tế Nguyễn Thanh Long, sáng 14/7.

Bộ trưởng Long đánh giá "đây là tín hiệu tốt trong tình hình hiện nay".

Vaccine Covid-19 Pfizer cho thanh thiếu niên được Cơ quan Quản lý Thực phẩm và Dược phẩm Mỹ (FDA) phê duyệt hồi giữa tháng 5. Việc chủng ngừa cho nhóm này được coi là bước quan trọng để trẻ em được đến trường an toàn.

Vào tháng 3, Pfizer cho biết vaccine tạo phản ứng kháng thể mạnh mẽ, an toàn và hiệu quả ở trẻ từ 12 đến 15 tuổi trong một thử nghiệm lâm sàng. 2.260 thanh thiếu niên tham gia thử nghiệm, trong đó 18 ca mắc Covid-19 thuộc nhóm dùng giả dược. Không có trường hợp nào mắc bệnh trong số những trẻ được tiêm vaccine. Điều đó cho thấy vaccine có hiệu quả phòng bệnh lên tới 100%. Hiện, Mỹ và Canada đã tiêm vaccine Pfizer cho trẻ từ 12 tuổi.

Tại cuộc họp, đại diện Pfizer cũng cho biết sẽ cung ứng cho Việt Nam khoảng 1 triệu liều vaccine trong tháng 7; 3,4 triệu liều trong 2 tháng 8 và 9, theo hợp đồng Bộ Y tế mua 31 triệu liều. Tiếp đó, khoảng 27 triệu liều còn lại sẽ được cung ứng trong quý IV.

Như vậy, cùng với 20 triệu liều vaccine bổ sung để tiêm cho trẻ em, tổng cộng trong quý 4, Pfizer sẽ cung ứng khoảng 47 triệu liều vaccine cho Việt Nam.

Bộ Y tế đề nghị ngay quý 3 Pfizer giao đủ 31 triệu liều vaccine theo hợp đồng đã ký kết ngay để đáp ứng nhu cầu hiện nay, đồng thời giảm tải cho công tác tiêm chủng vaccine trong quý 3.

Bộ Y tế cũng đang thảo luận với Pfizer về dự kiến kế hoạch cung ứng vaccine trong năm 2022 và chuyển giao công nghệ sản xuất hoặc đặt nhà máy sản xuất vaccine tại Việt Nam.

Hôm qua Bộ Y tế phân bổ 745.000 liều vaccine Pfizer, đặc biệt lần đầu tiên cho phép tiêm mũi 2 bằng Pfizer cho những người đã tiêm mũi 1 với vaccine AstraZeneca, nếu nguồn cung thiếu và phải theo dõi sát sức khỏe người được tiêm.', NULL, CAST(N'2021-10-20T08:05:00.000' AS DateTime), 5)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (18, 1, 3, N'Nhiều nhà máy xả thải bẩn xuống sông Mã bị xử phạt', N'9 cơ sở sản xuất tăm đũa tre, bột giấy, hàng mã đặt xưởng ven bờ sông Mã xả thải bẩn gây ô nhiễm, bị xử phạt tổng cộng hơn 1,1 tỷ đồng.

Quyết định xử phạt vi phạm hành chính trong lĩnh vực bảo vệ môi trường vừa được Phó chủ tịch UBND tỉnh Thanh Hóa Lê Đức Giang ký ban hành.

Các cơ sở bị xử phạt đều đóng tại huyện Bá Thước và Quan Hóa, gồm Hợp tác xã chế biến lâm sản Quan Hóa (bị phạt 160 triệu đồng); Hợp tác xã chế biến lâm sản Sông Mã (cơ sở 1, phạt 180 triệu đồng); Hợp tác xã chế biến lâm sản Sông Mã (cơ sở 2, bị phạt 160 triệu đồng) và Hợp tác xã Xuân Dương (bị phạt 140 triệu đồng); Công ty Duyệt Cường (bị phạt 160 triệu đồng); Hợp tác xã Hà Long (bị phạt 140 triệu đồng); Công ty đầu tư và phát triển Hạnh Nguyễn (bị phạt 130 triệu đồng); Công ty thương mại vận tải Hoàng Vân (bị phạt 110 triệu đồng) và Hợp tác xã Hợp Phát (bị phạt 130 triệu đồng).

Các nhà máy này bị phát hiện nhiều vi phạm như: Lắp đặt máy bơm xả thải chưa qua xử lý ra sông Mã; không lưu chất thải rắn, xây dựng nhà xưởng trái quy định... Ngoài xử phạt hành chính, các cơ sở bị dừng hoạt động 30-90 ngày, buộc khắc phục lỗi vi phạm gây ra mới được sản xuất trở lại', NULL, CAST(N'2021-10-11T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (20, 1, 3, N'Ba nhóm F0 không triệu chứng được giám sát y tế tại nhà', N'F0 được phát hiện tại cộng đồng, nếu không có triệu chứng lâm sàng, vào cơ sở y tế xét nghiệm tải lượng virus thấp, sẽ được giám sát tại nhà trong 14 ngày.

Theo hướng dẫn của Bộ Y tế ngày 14/7, các bệnh nhân Covid-19 (F0) được chia thành ba nhóm để xem xét giám sát y tế tại nhà.

Thứ nhất, F0 không có triệu chứng đang được chăm sóc, điều trị tại cơ sở y tế, có thể cho xuất viện vào ngày thứ 10 khi có kết quả hai mẫu xét nghiệm liên tiếp (cách nhau tối thiểu 24h) bằng PCR âm tính; hoặc tải lượng virus thấp. Những người này tiếp tục theo dõi, giám sát y tế tại nhà, nơi lưu trú 14 ngày.

Thứ hai, F0 phát hiện tại cộng đồng (kết quả xét nghiệm PCR dương tính), không có triệu chứng lâm sàng, tải lượng virus thấp thì đưa vào cơ sở y tế cách ly, theo dõi. Sau 24h, làm lại xét nghiệm, nếu F0 tiếp tục có tải lượng virus thấp hoặc kết quả âm tính sẽ được xuất viện và giám sát y tế tại nhà 14 ngày.

"F0 không có triệu chứng, tải lượng virus thấp thì không có khả năng lây lan dịch bệnh ra cộng đồng, nên không cần quy định các điều kiện về cơ sở vật chất, nhà ở như với trường hợp cách ly F1 tại nhà", Thứ trưởng Y tế Nguyễn Trường Sơn giải thích thêm.Thứ ba, F0 đủ tiêu chuẩn xuất viện, trong thời gian tự theo dõi tại nhà, nếu tái dương tính thì không cần cách ly tại bệnh viện. Chính quyền địa phương không cần thực hiện các biện pháp cách ly, xử lý ổ dịch với trường hợp này. F0 tiếp tục theo dõi, nếu có triệu chứng thì liên hệ với cơ sở y tế để được chăm sóc.', NULL, CAST(N'2021-10-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (22, 3, 17, N'Tàu Trung Quốc theo dõi Mỹ - Australia tập trận', N'Australia, Mỹ và các đồng minh bắt đầu tập trận quy mô lớn từ ngày 14/7, khi một tàu trinh sát Trung Quốc đi về phía nam để theo dõi hoạt động.

Hơn 17.000 binh sĩ từ Australia và Mỹ tham gia cuộc tập trận Talisman Sabre, được tổ chức hai năm một lần tại Australia ngày 14 - 31/7.Bộ trưởng Quốc phòng Australia Peter Dutton cho biết một tàu tình báo hải quân Trung Quốc tiếp cận bờ biển phía đông đông dân cư của Australia, nói rằng đây là "lời nhắc nhở rằng quân đội Trung Quốc luôn tồn tại trong khu vực". Truyền thông Australia đưa tin Bắc Kinh đã cử các tàu tương tự đến giám sát Talisman Sabre vào năm 2019 và 2017.

"Chúng tôi đã thấy sự hiện diện của Trung Quốc khi chúng tôi tiến hành các cuộc tập trận trước đây và chúng tôi đã theo dõi điều đó trong một thời gian", Dutton hôm nay nói với các phóng viên tại Brisbane.

"Chúng tôi tất nhiên mong muốn họ tuân thủ luật pháp quốc tế và chúng tôi sẽ không mong đợi gì hơn thế khi chúng tôi đi qua các vùng biển quốc tế gần Trung Quốc", ông nói thêm.

Lực lượng Quốc phòng Australia cho biết cuộc tập trận phần lớn được tổ chức tại các căn cứ quân sự ở bang Queensland và ngoài khơi, được thiết kế để cải thiện khả năng tương tác giữa các đồng minh. Anh, Canada, Nhật Bản, Hàn Quốc và New Zealand cũng sẽ tham gia cuộc tập trận trong khi Pháp, Đức, Ấn Độ và Indonesia cử quan sát viên.', NULL, CAST(N'2021-10-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (24, 3, 2, N'Biến chủng mới khiến các nước thay đổi cách ly Covid-19', N'Khi xuất hiện nhiều biến thể nCoV dễ lây lan hơn, các nước như Trung Quốc và Australia nhận thấy việc cách ly tại khách sạn không còn phù hợp.

Hồi đầu tháng 5, hai người cách ly trong hai phòng khách sạn liền kề ở thành phố Adelaide, Australia đã mở cửa cách nhau vài giây để lấy bữa ăn. Giới chức y tế tin rằng chỉ khoảnh khắc thoáng qua đó đã đủ để virus truyền từ một người đàn ông này sang một người khác qua không khí.

Người đàn ông được cho là nhiễm nCoV tại khách sạn sau đó đến Melbourne, dẫn đến bùng phát dịch bệnh và đóng cửa thành phố lớn thứ hai Australia.', NULL, CAST(N'2021-10-13T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (25, 4, 4, N'Vì sao giá rau nhà vườn rẻ, chợ TP HCM lại cao đột biến', N'Khâu vận chuyển tắc nghẽn, chi phí nhân công tăng... khiến mỗi kg rau khi về tới TP HCM đội giá gấp 2-3 lần so với thu mua tại nhà vườn.

Khảo sát tại vườn rau ở các tỉnh miền Tây cho thấy, giá bán ra tại đây khá thấp chỉ 2.000-12.000 đồng một kg. Chị Hoa, chủ vườn rau xanh tại Long An cho biết, từ ngày TP HCM giãn cách đến nay, chị vẫn bán rau xanh ở mức 8.000 đồng một kg, riêng các loại củ có giá 12.000 đồng. "Ngày nào tôi cũng xuất khoảng 3-4 tạ rau. Mấy ngày gần đây, hợp tác xã có đề nghị tăng lượng hàng, dù chưa tới ngày thu hoạch, tôi cũng cố gắng cắt để cung ứng cho dân TP HCM", chị Hoa nói.

Báo cáo của Sở Nông nghiệp và Phát triển Nông thông An Giang cho thấy, giá rau củ tại tỉnh này khá bình ổn, chỉ tăng nhẹ khoảng 1.000 đồng, trong đó, một vài loại rau tại vựa chỉ 2.000-18.000 đồng một kg (tuỳ loại). Cụ thể, cải thìa 2.000 đồng, cải xanh và cải ngọt 8.000 đồng một kg, hành lá, dưa leo cũng chỉ 8.000 đồng, bí đao 10.000 đồng một kg, ớt 12.000 đồng một kg. Riêng gừng và khoai lần lượt 18.000-20.000 đồng một kg.', NULL, CAST(N'2021-11-03T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (26, 4, 4, N'Quản lý thị trường kiểm tra việc ''gom hàng siêu thị bán thu lời''', N'Quản lý thị trường TP HCM công khai số điện thoại để người dân, siêu thị phản ánh tình trạng gom hàng siêu thị đem ra ngoái bán thu lời.

Đường dây nóng của quản lý thị trường (028.39321014) và cơ quan thường trực Ban chỉ đạo chống buôn lậu, gian lận thương mại và hàng giả tại TP HCM (028.39322491) sẽ tiếp nhận phản ánh của người dân về hành vi thu lời bất chính trong dịch bệnh 24/24.

Số điện thoại đường dây nóng của Cục Quản lý thị trường TP HCM cũng sẽ được niêm yết tại các siêu thị, trung tâm thương mại, chợ truyền thống và một số điểm công cộng... Sau khi được tiếp nhận, các phản ánh của người dân sẽ lập tức được chuyển tới các đội trưởng đội quản lý thị trường nơi phát sinh vụ việc để xử lý.

Những ngày qua, tại TP HCM xuất hiện tình trạng một số cá nhân gom mua hàng (lương thực, thực phẩm, rau, củ quả, trứng...) số lượng lớn tại các siêu thị, cửa hàng tiện lợi rồi đem ra ngoài bán với giá cao, kiếm lời.', NULL, CAST(N'2021-10-28T09:20:00.000' AS DateTime), 11)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (28, 7, 18, N'Việt Nam được đá sân nhà tại vòng loại World Cup 2022', N'VFF được tạo điều kiện để đáp ứng yêu cầu của Liên đoàn Bóng đá châu Á, nhằm giúp đội tuyển thi đấu trên sân Mỹ Đình tại vòng loại thứ ba World Cup 2022 - khu vực châu Á.

Theo kết quả cuộc họp chiều nay 14/7 với VFF, các bộ, ngành liên quan chấp thuận cho đội khách không phải cách ly dài ngày, nhưng phải đảm bảo đã tiêm đủ hai mũi vaccine phòng Covid-19 và có kết quả xét nghiệm âm tính trước khi đến Việt Nam. VFF cũng sẽ phối hợp với TP Hà Nội để đảm bảo an toàn theo mô hình "bong bóng an toàn". Nghĩa là, thành viên hai đội tuyển cùng ban tổ chức sẽ cách ly tập trung trong một khách sạn với tiêu chí "nội bất xuất, ngoại bất nhập", chỉ được di chuyển từ nơi ở tới sân tập và sân thi đấu để tránh lây nhiễm dịch bệnh.

Mô hình này từng được Liên đoàn Bóng đá châu Á (AFC) áp dụng thành công ở vòng loại thứ hai, trong đó có UAE - nơi đội tuyển Việt Nam tập trung thi đấu các trận còn lại của bảng G cùng chủ nhà, Thái Lan, Indonesia và Malaysia.Trước đó, do quy định các chuyến bay quốc tế phải cách ly 21 ngày khi đến Việt Nam, thầy trò HLV Park Hang-seo đối mặt với khả năng phải thi đấu trên sân trung lập. Bởi AFC chỉ cho phép cách ly tối đa hai ngày trong lúc chờ kết quả xét nghiệm. VFF thậm chí đã phải tính đến phương án thi đấu ở UAE hoặc Thái Lan - những nơi không yêu cầu cách ly dài ngày với khách quốc tế.

Việc được chơi trên sân nhà sẽ giúp Việt Nam có nhiều lợi thế về khí hậu, mặt sân, tâm lý... Qua đó, gia tăng cơ hội giành điểm.

Đây là lần đầu tiên Việt Nam vào vòng loại cuối cùng một kỳ World Cup. Đội nằm ở bảng B, dự kiến đá năm trận sân nhà với Australia ngày 7/9, Nhật Bản ngày 11/11, Saudi Arabia ngày 16/11, Trung Quốc ngày 1/2 và Oman ngày 24/3. Trung đó, trận đấu với Trung Quốc diễn ra vào mùng 1 Tết Nguyên đán.

Đội tuyển sẽ hội quân vào giữa tháng 8, và bắt đầu hành trình bằng chuyến làm khách của Saudi Arabia ngày 2/9.

Trước Việt Nam, Thái Lan là đội tuyển gần nhất của Đông Nam Á vào vòng loại thứ ba một kỳ World Cup. Đội bóng xứ chùa Vàng giành hai điểm qua 10 trận', NULL, CAST(N'2021-10-29T08:11:00.000' AS DateTime), 32)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (29, 9, 2, N'3 nguồn học phát âm tiếng Anh miễn phí', N'Ba nguồn học phát âm Duolingo, FluentU, ELSA sẽ giúp bạn ghi điểm Pronunciation (Phát âm) trong IELTS Speaking.

Cùng với các tiêu chí Lexical Resource (Nguồn từ vựng), Grammatical Range and Accuracy (Tính chính xác và sự đa dạng trong ngữ pháp), Fluency and Coherence (Độ trôi chảy và mạch lạc), Pronunciation (Phát âm) là tiêu chí quan trọng thể hiện khả năng sử dụng ngôn ngữ của thí sinh trong bài thi nói - IELTS Speaking.

Theo cô Mia Nguyễn (du học sinh Mỹ đạt 8.5 IELTS) từ IELTS Fighter, để việc luyện phát âm đạt hiệu quả, thí sinh nên có người đồng hành như giáo viên có chuyên môn, người bản xứ để được hướng dẫn phát âm chuẩn cũng như chỉ ra lỗi phát âm sai để chỉnh sửa. Việc tự học phát âm tại nhà nhưng mãi không tiến bộ cũng bắt nguồn từ việc thiếu những yếu tố trên. Người học tự tìm kiếm nguồn tài liệu học nhưng không được đánh giá cụ thể, dẫn đến không nhận thức được lỗi sai và không thấy sự tiến bộ của bản thân. Tuy nhiên, bạn có thể khắc phục những vấn đề trên nhờ việc sử dụng các phần mềm học phát âm ngay trên điện thoại.', NULL, CAST(N'2021-11-03T09:12:00.000' AS DateTime), 3)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (30, 9, 17, N'Dự kiến thi tốt nghiệp THPT đợt 2 vào đầu tháng 8', N'Bộ Giáo dục và Đào tạo đưa ra mốc thi tốt nghiệp THPT đợt 2 vào ngày 6-7/8 để các địa phương thảo luận và đề xuất dựa trên tình hình Covid-19.

Ngày 14/7, các địa phương có thí sinh phải thi đợt 2 đã họp trực tuyến với Bộ Giáo dục và Đào tạo. Thứ trưởng Nguyễn Hữu Độ dự kiến mốc thời gian vào đầu tháng 8 để các Sở xin ý kiến UBND cấp tỉnh và phản hồi với Bộ để thống nhất. Đề xuất của các Sở phải dựa vào tình hình dịch bệnh tại địa phương.

Mỗi Sở Giáo dục và Đào tạo sẽ thành lập một hội đồng thi. Địa phương có số lượng thí sinh đăng ký dự thi ít có thể gửi thí sinh đến hội đồng thi của tỉnh, thành phố lân cận. Bộ sẽ xem xét hỗ trợ công tác in, sao đề thi cho các Sở có ít thí sinh đăng ký dự thi và có văn bản hướng dẫn cụ thể về việc tổ chức thi đợt 2.

Thứ trưởng Độ lưu ý những thí sinh diện F0 đã được đặc cách tốt nghiệp THPT ở đợt 1 theo quy chế thi, nhưng vẫn có nguyện vọng dự thi ở đợt 2 thì vẫn được phép. Những em này cần có đơn hủy quyền được đặc cách.', NULL, CAST(N'2021-10-14T19:20:00.000' AS DateTime), 8)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (32, 10, 18, N'Thêm 829 ca Covid-19, TP HCM hơn 2.000 ca một ngày', N'Bộ Y tế tối 14/7 ghi nhận 829 ca dương tính nCoV, gồm 823 ca trong nước và 6 ca nhập cảnh được cách ly ngay.

829 ca mới từ số 36606-37434. Trong đó 823 ca ghi nhận tại: TP HCM (592), Bình Dương (73), Đồng Tháp (42), Đồng Nai (38), Đà Nẵng (15), Sóc Trăng (12), Bình Thuận (9), Kiên Giang (9), Cần Thơ (8), Phú Yên (6), Hà Nội (4), Quảng Ngãi (4), Nghệ An (3), Trà Vinh (2), Hà Tĩnh (1), Cà Mau (1), Bắc Giang (1), Bắc Ninh (1), Lạng Sơn (1), Bình Phước (1). Trong số này, 726 ca được phát hiện ở khu cách ly hoặc khu đã được phong tỏa, 97 ca đang điều tra dịch tễ.

Như vậy, trong ngày 14/7, Việt Nam ghi nhận 2.934 ca mới gồm 10 ca cách ly ngay sau khi nhập cảnh và 2.924 ca ở 32 tỉnh thành, chủ yếu tại TP HCM (2229). Trong đó, 2.509 ca được phát hiện ở khu cách ly hoặc khu đã được phong tỏa, 415 ca đang điều tra dịch tễ (tăng 214 ca so với hôm trước).', NULL, CAST(N'2021-11-02T19:20:00.000' AS DateTime), 12)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (33, 8, 2, N'Bị tấn công, 2 người ngã xe tử vong', N'Nguyễn Đắc Tiền, 19 tuổi, và đồng phạm đuổi theo đánh vào tay lái xe máy nhóm đối thủ khiến họ ngã nhào, 2 người chết.

Ngày 14/7, Tiền và Nguyễn Đắc Tuấn, 18 tuổi, bị Công an Tây Ninh tạm giữ hình sự để điều tra dấu hiệu tội Giết người.Theo điều tra, Sơn, 18 tuổi; Hải, 28 tuổi, cùng người bạn chở nhau đến quán cà phê tại xã Tân Hà, huyện Tân Châu, để giải quyết mâu thuẫn với nhóm thanh niên. Tuy nhiên, 3 người này lại chém nhầm thiếu niên 16 tuổi, bị thương.

Tiền hay tin người quen của mình bị chém nên rủ Tuấn mang theo kiếm gỗ đến hiện trường. Thấy nhóm Sơn đang chở thiếu niên đi cấp cứu, Tiền đuổi theo. Đến ngã tư xã Tân Hà, Tuấn ngồi sau dùng kiếm đánh vào tay lái xe khiến nhóm Sơn ngã nhào. Sơn và Hải chết tại chỗ', NULL, CAST(N'2021-10-24T16:20:00.000' AS DateTime), 5)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (34, 8, 14, N'Kẻ vận chuyển hơn 26 kg ma túy bị bắt', N'Phạm Xuân Tài (42 tuổi) trú tại tỉnh Hải Dương bị cảnh sát khống chế khi điều khiển ôtô chở theo hơn 26 kg ma túy các loại.

Vụ bắt giữ Tài được Công an thành phố Vinh phối hợp với các đơn vị liên quan thực hiện đêm 12/7 tại địa huyện Thanh Chương (Nghệ An).

Sau thời gian theo dõi, trinh sát phát hiện ngày 12/7, Tài di chuyển tới khu vực biên giới Việt Lào thuộc địa phận huyện Thanh Chương để giao dịch ma túy, sau đó sẽ vận chuyển về miền Bắc.

Lúc 22h cùng ngày, Tài điều khiển ôtô chạy trên đường mòn Hồ Chí Minh đoạn qua xã Thanh Thịnh (huyện Thanh Chương), hàng chục cảnh sát và biên phòng bao vây. Xe không thể lăn bánh về trước, song kẻ buôn ma túy vẫn cố thủ phía trong, chĩa súng ngắn hòng chống trả.', NULL, CAST(N'2021-10-15T03:20:00.000' AS DateTime), 4)
INSERT [dbo].[News] ([news_ID], [category_ID], [author_ID], [title], [body], [picture], [date], [views]) VALUES (37, 12, 3, N'Bánh dày chỉ ăn trong ngày của làng Thượng Đình', N'Bánh dày Quán Gánh đặc trưng với độ dẻo, thơm, có hai loại nhân mặn và ngọt, chỉ bảo quản được trong ngày.

Trên quốc lộ 1A nối Hà Nội với các tỉnh phía nam, tại km số 16, những gian hàng đề biển "Bánh dày Quán Gánh" xuất hiện nhiều. Từ lâu, món bánh đặc sản này đã trở thành lựa chọn quen thuộc của các tài xế mỗi khi đi qua đây, hoặc của người Hà Nội mỗi dịp tổ chức lễ lộc, cưới hỏi. Làng nghề của loại bánh này là làng Thượng Đình, có phố Quán Gánh, thuộc xã Nhị Khê, huyện Thường Tín.', NULL, CAST(N'2021-10-18T18:29:00.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (1, N'admin', N'1', 0, N'Nguyen Van A', N'FPT Hoa Lac', N'abc@gmail.com', N'0123456789')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (2, N'mod1', N'1', 1, N'Nguyen Van B', N'Ha Noi ', N'xyz@gmail.com', N'0987654321')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (3, N'mod2', N'1', 1, N'Nguyen Van C', N'Vinh Phuc', N'abcd@gmail.com', N'098765656')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (4, N'mod3', N'1', 1, N'Nguyen Van C', N'Ha Noi', N'xxyyzz@gmail.com', N'038123456')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (5, N'mod4', N'1', 1, N'Ronaldo', N'Bo Dao Nha', N'ronaldo@gmail.com', N'0976999222')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (6, N'messi', N'1', 2, N'Messi', N'Argentina', N'messi@gmail.com', N'087364237')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (7, N'user1', N'1', 2, N'Nguyen a', N'Hanoi', N'sadnajd@gmail.com', N'032423534')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (8, N'mod5', N'1', 1, N'Nguyen Van D', N'Ha Noi ', N'a8jd2@gmail.com', N'0987612833')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (9, N'admin1', N'1', 0, N'Nguyen Van Toan', N'Hanoi', N'vantoan@gmail.com', N'0123841234')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (10, N'mod6', N'1', 1, N'Luong Xuan Truong ', N'Namdinh', N'xuantruong06@gmail.com', N'0123124553')
INSERT [dbo].[User] ([user_ID], [username], [password], [power], [fullname], [address], [email], [phone]) VALUES (11, N'mod7', N'1', 1, N'Nguyen Tuan Anh', N'Hanoi', N'tuananh@gmail.com', N'0123123822')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblUser__F3DBC572C5BC9AFE]    Script Date: 26/03/2023 2:04:08 AM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_tblNews_tblCategory] FOREIGN KEY([category_ID])
REFERENCES [dbo].[Category] ([category_ID])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_tblNews_tblCategory]
GO
USE [master]
GO
ALTER DATABASE [TrangTinTuc] SET  READ_WRITE 
GO
