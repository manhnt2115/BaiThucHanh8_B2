CREATE DATABASE QUANLYBANSACH
USE QUANLYBANSACH

CREATE TABLE CHUDE
(
	MACD INT PRIMARY KEY IDENTITY,
	TENCHUDE NVARCHAR(100) NOT NULL
);

CREATE TABLE NHAXUATBAN
(
	MANXB INT PRIMARY KEY IDENTITY,
	TENNXB NVARCHAR(100),
	DIACHI NVARCHAR(100),
	SDT NVARCHAR(20),
	EMAIL NVARCHAR(50)
);

CREATE TABLE TACGIA
(
	MATG INT PRIMARY KEY IDENTITY,
	TENTG NVARCHAR(100) NOT NULL,
	DIACHI NVARCHAR(100),
	TIEUSU NVARCHAR(MAX),
	DIENTHOAI NVARCHAR(20)
);

CREATE TABLE SACH
(
	MASACH INT PRIMARY KEY IDENTITY,
	TENSACH NVARCHAR(200) NOT NULL,
	GIABAN DECIMAL(18,2),
	MOTA NVARCHAR(MAX),
	ANHBIA NVARCHAR(200),
	NGAYCAPNHAT DATE,
	SOLUONGTON INT,
	MACD INT FOREIGN KEY REFERENCES CHUDE(MACD),
	MANXB INT FOREIGN KEY REFERENCES NHAXUATBAN(MANXB)
)

CREATE TABLE VIETSACH
(
	MASACH INT FOREIGN KEY REFERENCES SACH(MASACH),
	MATG INT FOREIGN KEY REFERENCES TACGIA(MATG),
	PRIMARY KEY (MASACH,MATG)
)

CREATE TABLE KHACHHANG
(
	MAKH INT PRIMARY KEY IDENTITY,
	HOTEN NVARCHAR(100),
	TAIKHOAN NVARCHAR(50),
	MATKHAU NVARCHAR(50),
	EMAIL NVARCHAR(100),
	DIACHI NVARCHAR(100),
	DIENTHOAI NVARCHAR(20),
);

CREATE TABLE DONDATHANG
(
	MADONHANG INT PRIMARY KEY IDENTITY,
	NGAYDAT DATE,
	TINHTRANGDONHANG BIT,
	THANHTOAN BIT,
	NGAYGIAO DATE,
	MAKH INT FOREIGN KEY REFERENCES KHACHHANG(MAKH)
);

CREATE TABLE CHITIETDONHANG
(
	MADONHANG INT FOREIGN KEY REFERENCES DONDATHANG(MADONHANG),
	MASACH INT FOREIGN KEY REFERENCES SACH(MASACH),
	SOLUONG INT,
	DONGIA DECIMAL(18,2),
	PRIMARY KEY (MADONHANG,MASACH)
)


INSERT INTO CHUDE (TENCHUDE) VALUES
(N'Lập trình'),
(N'Khoa học viễn tưởng'),
(N'Văn học'),
(N'Kinh tế'),
(N'Lịch sử');

INSERT INTO NHAXUATBAN (TENNXB, DIACHI, SDT, EMAIL) VALUES
(N'NXB Tổng hợp TP.HCM', N'62 Nguyễn Thị Minh Khai, Q.1, TP.HCM', '02838222956', 'tonghop@nxb.com.vn'),
(N'NXB Trẻ', N'161B Lý Chính Thắng, P.7, Q.3, TP.HCM', '02839316287', 'tre@nxb.com.vn'),
(N'NXB Kim Đồng', N'248 Cống Quỳnh, Q.1, TP.HCM', '02838367123', 'kimdong@nxb.com.vn'),
(N'NXB Lao Động', N'17B Ngô Quyền, Hoàn Kiếm, Hà Nội', '02438257080', 'laodong@nxb.com.vn'),
(N'NXB Chính trị Quốc gia Sự thật', N'6/86 Duy Tân, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', '02438289053', 'chinhtri@nxb.com.vn');

INSERT INTO TACGIA (TENTG, DIACHI, TIEUSU, DIENTHOAI) VALUES
(N'Nguyễn Nhật Ánh', N'TP.HCM', N'Nhà văn chuyên viết về tuổi học trò.', '0901234567'),
(N'Stephen King', N'Mỹ', N'Bậc thầy về truyện kinh dị.', '0902345678'),
(N'Nguyễn Du', N'Hà Tĩnh', N'Đại thi hào dân tộc Việt Nam.', '0903456789'),
(N'Robert C. Martin', N'Mỹ', N'Tác giả nổi tiếng trong lĩnh vực lập trình, được biết đến với tên "Uncle Bob".', '0904567890'),
(N'Yuval Noah Harari', N'Israel', N'Nhà sử học, tác giả của nhiều cuốn sách bán chạy về lịch sử và tương lai nhân loại.', '0905678901');

INSERT INTO SACH (TENSACH, GIABAN, MOTA, ANHBIA, NGAYCAPNHAT, SOLUONGTON, MACD, MANXB) VALUES
(N'Mắt biếc', 120000.00, N'Câu chuyện tình yêu đầy lãng mạn và nuối tiếc.', 'matbiec.jpg', '2022-01-15', 50, 3, 2),
(N'It', 250000.00, N'Tiểu thuyết kinh dị kinh điển của Stephen King.', 'it.png', '2021-11-20', 30, 2, 1),
(N'Truyện Kiều', 95000.00, N'Tác phẩm thơ Nôm nổi tiếng nhất của Nguyễn Du.', 'truyenkieu.jpg', '2023-03-10', 80, 3, 4),
(N'Clean Code', 350000.00, N'Cẩm nang viết code sạch và hiệu quả.', 'cleancode.jpg', '2022-07-01', 40, 1, 1),
(N'Sapiens: Lược sử loài người', 200000.00, N'Cuốn sách khám phá lịch sử loài người từ thời tiền sử đến hiện đại.', 'sapiens.jpg', '2023-02-28', 60, 5, 5),
(N'Đắc nhân tâm', 150000.00, N'Bí quyết để thành công trong giao tiếp và cuộc sống.', 'dacnhantam.jpg', '2023-01-05', 70, 4, 2),
(N'Hoàng tử bé', 80000.00, N'Truyện thiếu nhi kinh điển, chứa đựng nhiều ý nghĩa sâu sắc.', 'hoangtube.jpg', '2022-10-10', 90, 3, 3);

INSERT INTO VIETSACH (MASACH, MATG) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1); 

INSERT INTO KHACHHANG (HOTEN, TAIKHOAN, MATKHAU, EMAIL, DIACHI, DIENTHOAI) VALUES
(N'Trần Văn A', 'vana', '123456', 'vana@example.com', N'123 Nguyễn Văn Cừ, Q.5, TP.HCM', '0912345678'),
(N'Lê Thị B', 'thib', '654321', 'thib@example.com', N'456 Lê Lợi, Q.1, TP.HCM', '0987654321'),
(N'Phạm Minh C', 'minhc', 'abcdef', 'minhc@example.com', N'789 Trần Hưng Đạo, Q.3, TP.HCM', '0909876543');

INSERT INTO DONDATHANG (NGAYDAT, TINHTRANGDONHANG, THANHTOAN, NGAYGIAO, MAKH) VALUES
('2023-04-01', 1, 1, '2023-04-05', 1),
('2023-04-02', 0, 0, NULL, 2),
('2023-04-03', 1, 1, '2023-04-07', 1),
('2023-04-04', 1, 0, NULL, 3);

INSERT INTO CHITIETDONHANG (MADONHANG, MASACH, SOLUONG, DONGIA) VALUES
(1, 1, 1, 120000.00),
(1, 4, 1, 350000.00),
(2, 2, 2, 250000.00),
(3, 3, 1, 95000.00),
(3, 6, 1, 150000.00),
(4, 5, 1, 200000.00),
(4, 7, 2, 80000.00);

select * from DONDATHANG